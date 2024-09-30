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
    public partial class DailyItemSummarySheet : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();

        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();

            }
            lblReason.Text = dateSaleDate.SelectedDate.ToString();
    
        }

        public void LoadBasic()
        {

          

            txtWardRoom.Text = Session["wardRoomName"].ToString();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            getMenu();
            getExtra();
            getParty();
            getDepreciation();
        }

        public void getMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_DailySaleSummerySheet]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
        }


        public void getExtra()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_DailySaleSummerySheet]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[1];

            grdReport0.DataBind();

            con.Close();
        }


        public void getParty()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_DailySaleSummerySheet]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[2];

            grdReport1.DataBind();

            con.Close();
        }


        public void getDepreciation()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_DailySaleSummerySheet]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[3];

            grdReport2.DataBind();

            con.Close();
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

        protected void grdReport0_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport0.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn0") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport0.PageCount) + e.Item.ItemIndex + 1);
            }
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
                int strIndex = grdReport1.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport1.PageCount) + e.Item.ItemIndex + 1);
            }
        }
    }
}