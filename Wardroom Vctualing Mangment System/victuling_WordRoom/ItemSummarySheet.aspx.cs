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

namespace victuling_WordRoom
{
    public partial class ItemSummarySheet : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static String wardRoomName, wardRoomCode;

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtItemCat = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();
            }
        }

        public void LoadBasic()
        {
            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = Session["wardRoomName"].ToString();



            dtItemCat = itemObject.GetItemCatagory(strConnString);
            ddlItemCat.DataSource = dtItemCat;

            ddlItemCat.DataTextField = "itemCatagory";
            ddlItemCat.DataValueField = "itemCatagoryCode";
            ddlItemCat.DataBind();

            ddlItemCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void ddlItemCat_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string itemValue = ddlItemCat.Text;
            DataTable Entrydt1 = tt.GetItemByCate(itemValue, strConnString);
            ddlItem.DataSource = Entrydt1;
            ddlItem.DataTextField = "item";
            ddlItem.DataValueField = "itemCode";
            ddlItem.DataBind();
            ddlItem.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            getMainMenu();
            getExtra();
            getParty();
            getPartyNormal();
            getDepreciation();
        }

        public void getMainMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_DailySaleSummerySheetByItem_Period_New]";

            command.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
            command.Parameters.AddWithValue("@fromDate", dateFrom.SelectedDate.ToString());
            command.Parameters.AddWithValue("@toDate", dateTo.SelectedDate.ToString());
            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[0];

            grdReport2.DataBind();

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
            command.CommandText = "[VICTULING_DailySaleSummerySheetByItem_Period_New]";

            command.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
            command.Parameters.AddWithValue("@fromDate", dateFrom.SelectedDate.ToString());
            command.Parameters.AddWithValue("@toDate", dateTo.SelectedDate.ToString());
            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport3.DataSource = ds.Tables[1];

            grdReport3.DataBind();

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
            command.CommandText = "[VICTULING_DailySaleSummerySheetByItem_Period_New]";

            command.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
            command.Parameters.AddWithValue("@fromDate", dateFrom.SelectedDate.ToString());
            command.Parameters.AddWithValue("@toDate", dateTo.SelectedDate.ToString());
            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport4.DataSource = ds.Tables[2];

            grdReport4.DataBind();

            con.Close();
        }

        public void getPartyNormal()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_DailySaleSummerySheetByItem_Period_New]";

            command.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
            command.Parameters.AddWithValue("@fromDate", dateFrom.SelectedDate.ToString());
            command.Parameters.AddWithValue("@toDate", dateTo.SelectedDate.ToString());
            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport6.DataSource = ds.Tables[4];

            grdReport6.DataBind();

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
            command.CommandText = "[VICTULING_DailySaleSummerySheetByItem_Period_New]";

            command.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
            command.Parameters.AddWithValue("@fromDate", dateFrom.SelectedDate.ToString());
            command.Parameters.AddWithValue("@toDate", dateTo.SelectedDate.ToString());
            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport5.DataSource = ds.Tables[3];

            grdReport5.DataBind();

            con.Close();
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

        protected void grdReport3_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport3.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn3") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport3.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport4_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport4.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn4") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport4.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport5_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport5.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn5") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport5.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport6_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport5.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn6") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport5.PageCount) + e.Item.ItemIndex + 1);
            }
        }
    }
}