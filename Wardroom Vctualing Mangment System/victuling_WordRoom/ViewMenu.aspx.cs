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
    public partial class ViewMenu : System.Web.UI.Page
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

        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (!IsPostBack)
            {
                getMenuReason();
            }

            //lblNic.Visible = false;
        }

        public void getMenuReason()
        {
            dtMenuReason = itemObject.GetManuReason(strConnString);
            cmbDescription.DataSource = dtMenuReason;

            cmbDescription.DataTextField = "reason";
            cmbDescription.DataValueField = "reasonCode";
            cmbDescription.DataBind();
            cmbDescription.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));


            dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            ddlGroupMenu.DataSource = dtGroupMenuNew;

            ddlGroupMenu.DataTextField = "GroupMenu";
            ddlGroupMenu.DataValueField = "GroupMenuCode";
            ddlGroupMenu.DataBind();
            //ddlGroupMenu.Items.Insert(0, new RadComboBoxItem("---Select---", ""));

            //dtWardroom = itemObject.GetWardroom(strConnString);
            //ddlWardroom.DataSource = dtWardroom;

            //ddlWardroom.DataTextField = "wardroomName";
            //ddlWardroom.DataValueField = "wardroomCode";
            //ddlWardroom.DataBind();

            //ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));


            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = wardRoomName.ToString();

            //dtBaseAll = itemObject.GetAllBase(strConnString2);
            //ddlBaseAll.DataSource = dtBaseAll;

            //ddlBaseAll.DataTextField = "baseDescription";
            //ddlBaseAll.DataValueField = "baseCode";
            //ddlBaseAll.DataBind();

            //ddlBaseAll.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

        }

        protected void btnVewMenu_Click(object sender, EventArgs e)
        {
            getMenuNon_Veg();
            getMenuVeg();
           
        }


        public void getMenuNon_Veg()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyMenu]";

            command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
        }


        public void getMenuVeg()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyMenu_Veg]";

            command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[0];

            grdReport0.DataBind();

            con.Close();
        }

        protected void grdReport0_ItemCommand(object sender, GridCommandEventArgs e)
        {
         
        }

        protected void grdReport_ItemDataBound(object sender, GridItemEventArgs e)
        {
             if (e.Item is GridDataItem)
                 {
                            int strIndex = grdReport.MasterTableView.CurrentPageIndex;

                            Label lbl = e.Item.FindControl("lblSn") as Label;
                            lbl.Text = Convert.ToString((strIndex * grdReport.PageCount) + e.Item.ItemIndex + 1);
                  }
        
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
           
        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void grdReport0_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport0.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn0") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport0.PageCount) + e.Item.ItemIndex + 1);
            }
        }
    }
}