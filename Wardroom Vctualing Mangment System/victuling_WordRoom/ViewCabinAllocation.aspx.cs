using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using VICTULING_DLL.AddNewItems;

namespace victuling_WordRoom
{
    public partial class ViewCabinAllocation : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static int countval = 0;

        public static string nic = "";
        public static string OS = "";
        public static string nicNo_SSID = "";
        public static string officialNo = "";
        public static string serviceType = "";

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();

        public static DataTable dtArea = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtBlock = new DataTable();
        public static DataTable dtBranch = new DataTable();
        public static String wardRoomName, wardRoomCode;

        public static DataTable dtRankRate = new DataTable();
        public static DataTable dtselectpersons = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (!IsPostBack)
            {
                getInitialData();
                getCabinAllocatoin();

            }
        }

        public void getInitialData()
        {
           

            dtBlock = itemObject.GetBlockList(strConnString);
            ddlBlockNo.DataSource = dtBlock;

            ddlBlockNo.DataTextField = "blockNo";
            ddlBlockNo.DataValueField = "blockID";
            ddlBlockNo.DataBind();

            ddlBlockNo.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            ddlBlockNo.Items.Insert(1, new RadComboBoxItem("All", "1"));

           
        }

        protected void grdReport1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport1.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn1") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport1.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport0_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport0.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn0") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport0.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void linkCabinList_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetCabinAllocationListByCabin]";

            command.Parameters.AddWithValue("@blockName", ddlBlockNo.SelectedValue.ToString());
            command.Parameters.AddWithValue("@cabinName", ddlCabinNo.SelectedValue.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[0];

            grdReport0.DataBind();

            con.Close();
        }

        protected void ddlBlockNo_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string blockValue = ddlBlockNo.SelectedValue.ToString();
            DataTable Entrydt1 = tt.GetCabinList(blockValue, strConnString);
            ddlCabinNo.DataSource = Entrydt1;
            ddlCabinNo.DataTextField = "cabinNo";
            ddlCabinNo.DataValueField = "cabinID";
            ddlCabinNo.DataBind();
        }

        public void getCabinAllocatoin()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetCabinAllocationList]";

            //command.Parameters.AddWithValue("@blockName", ddlBlockNo.SelectedValue.ToString());
            //command.Parameters.AddWithValue("@cabinName", ddlCabinNo.SelectedValue.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[0];

            grdReport1.DataBind();

            con.Close();
        }
    }
}