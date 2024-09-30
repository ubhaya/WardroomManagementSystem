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
    public partial class Reports : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dt = new DataTable();
        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            if (IsPostBack != true)
            {


            }
            wardRoomCode = Session["wardRoomCode"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            txtWardRoom.Text = wardRoomName;
        }

        public void bindPendingRecovery()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetPendingRecovery]";

            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[0];

            grdReport2.DataBind();

            con.Close();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            if (ddlRecoveryType.SelectedItem.Text == "Monthly Recovery")
            {
                Panel1.Visible = true;
                Panel2 .Visible = false;
                bindRecovery();
            }

            else
            {
                Panel1.Visible = false;
                Panel2 .Visible = true;
                bindPendingRecovery();
            }
        }

        public void bindRecovery()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_FinalMonthlyRecovery_By_SeriveType]";

            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
            command.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[0];

            grdReport1.DataBind();

            con.Close();
        }

        protected void grdReport1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport1.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn1") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport1.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport2_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport2.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport2.PageCount) + e.Item.ItemIndex + 1);
            }
        }
    }
}