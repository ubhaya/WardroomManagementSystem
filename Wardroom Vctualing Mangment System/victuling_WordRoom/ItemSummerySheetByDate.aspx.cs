

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
    public partial class ItemSummerySheetByDate : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static String wardRoomName, wardRoomCode;

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dt = new DataTable();

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

        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            getMainMenu();
            getExtra();
            getParty();
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
            command.CommandText = "[VICTULING_DailySaleSummery]";

            command.Parameters.AddWithValue("@saleDate", dateTo.SelectedDate.ToString());
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
            command.CommandText = "VICTULING_DailySaleSummery";

            command.Parameters.AddWithValue("@saleDate", dateTo.SelectedDate.ToString());
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
            command.CommandText = "VICTULING_DailySaleSummery";

            command.Parameters.AddWithValue("@saleDate", dateTo.SelectedDate.ToString());
            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport4.DataSource = ds.Tables[2];

            grdReport4.DataBind();

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
            command.CommandText = "VICTULING_DailySaleSummery";

            command.Parameters.AddWithValue("@saleDate", dateTo.SelectedDate.ToString());
            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport5.DataSource = ds.Tables[3];

            grdReport5.DataBind();

            con.Close();
        }

        protected void grdReport2_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport2.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport2.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport3_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport3.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn3") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport3.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport4_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport4.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn4") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport4.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport5_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport5.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn5") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport5.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void btnGetSummarySheet_Click(object sender, EventArgs e)
        {
            deleteAllData();
            SaveMainMenu();
            SaveExtra();
            SaveParty();
            SaveDepreciation();
            getTotal();
 
        }

        public void deleteAllData()
        {
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "VICTULING_Delete_DailySaleSummary";



            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            //grdReport6.DataSource = ds.Tables[0];

            //grdReport6.DataBind();

            con.Close();
        }

        public void getTotal()
        {
            //con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "VICTULING_TotalDailySummery_NEW";
            

            command.Parameters.AddWithValue("@saleDate", dateTo.SelectedDate.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport6.DataSource = ds.Tables[0];

            grdReport6.DataBind();

            con.Close();
        }

        public void SaveMainMenu()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string selectdate = dateTo.SelectedDate.ToString();

            dt = itemObject.GetDailyItemSummaryMenue(strConnString, wardroomCode, selectdate);


            for (int i = 0; i < dt.Rows.Count; i++)
            {

                string itemCode = "";
                string item = "";
                string saleQty = "";
                string itemMessurment = "";
                string reason = "";
                string groupMenue = "";
                //string serial = "";

                itemCode = dt.Rows[i]["itemCode"].ToString();
                item = dt.Rows[i]["item"].ToString();
                saleQty = dt.Rows[i]["saleQty"].ToString();
                itemMessurment = dt.Rows[i]["itemMessurment"].ToString();
                reason = dt.Rows[i]["reason"].ToString();
                groupMenue = dt.Rows[i]["GroupMenu"].ToString();
                //serial = dt.Rows[i]["SlNo"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    //sqlcmd.CommandText = "VICTULING_InsertDailyItemSummaryMenue";
                    sqlcmd.CommandText = "VICTULING_InsertDailyItemSummary";
                    

                    sqlcmd.Parameters.AddWithValue("@ItemCode", itemCode);
                    sqlcmd.Parameters.AddWithValue("@Item", item);
                    sqlcmd.Parameters.AddWithValue("@SaleQty", saleQty);
                    sqlcmd.Parameters.AddWithValue("@Messurment", itemMessurment);
                    sqlcmd.Parameters.AddWithValue("@reason", reason);
                    sqlcmd.Parameters.AddWithValue("@groupMenue", groupMenue);
                    //sqlcmd.Parameters.AddWithValue("@serialNo", serial);

                    sqlcmd.Parameters.AddWithValue("@saleDate", dateTo.SelectedDate.ToString());
                    sqlcmd.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@craetdDate", System.DateTime.Now);

                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success";

                }
                catch
                {

                }
            }
        }

        public void SaveExtra()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string selectdate = dateTo.SelectedDate.ToString();

            dt = itemObject.GetDailyItemSummaryExtra(strConnString, wardroomCode, selectdate);


            for (int i = 0; i < dt.Rows.Count; i++)
            {

                string itemCode = "";
                string item = "";
                string saleQty = "";
                string itemMessurment = "";
                string reason = "";
                string groupMenue = "";
                //string serial = "";

                itemCode = dt.Rows[i]["itemCode"].ToString();
                item = dt.Rows[i]["item"].ToString();
                saleQty = dt.Rows[i]["saleQty"].ToString();
                itemMessurment = dt.Rows[i]["itemMessurment"].ToString();
                reason = dt.Rows[i]["reason"].ToString();
                groupMenue = dt.Rows[i]["GroupMenu"].ToString();
               // serial = dt.Rows[i]["SlNo"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "VICTULING_InsertDailyItemSummary";

                    sqlcmd.Parameters.AddWithValue("@ItemCode", itemCode);
                    sqlcmd.Parameters.AddWithValue("@Item", item);
                    sqlcmd.Parameters.AddWithValue("@SaleQty", saleQty);
                    sqlcmd.Parameters.AddWithValue("@Messurment", itemMessurment);
                    sqlcmd.Parameters.AddWithValue("@reason", reason);
                    sqlcmd.Parameters.AddWithValue("@groupMenue", groupMenue);
                    //sqlcmd.Parameters.AddWithValue("@serialNo", serial);

                    sqlcmd.Parameters.AddWithValue("@saleDate", dateTo.SelectedDate.ToString());
                    sqlcmd.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@craetdDate", System.DateTime.Now);

                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success";

                }
                catch
                {

                }
            }
        }

        public void SaveParty()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string selectdate = dateTo.SelectedDate.ToString();

            dt = itemObject.GetDailyItemSummaryParty(strConnString, wardroomCode, selectdate);


            for (int i = 0; i < dt.Rows.Count; i++)
            {

                string itemCode = "";
                string item = "";
                string saleQty = "";
                string itemMessurment = "";
                string reason = "";
                string groupMenue = "";
                //string serial = "";

                itemCode = dt.Rows[i]["itemCode"].ToString();
                item = dt.Rows[i]["item"].ToString();
                saleQty = dt.Rows[i]["saleQty"].ToString();
                itemMessurment = dt.Rows[i]["itemMessurment"].ToString();
                reason = dt.Rows[i]["reason"].ToString();
                groupMenue = dt.Rows[i]["GroupMenu"].ToString();
                //serial = dt.Rows[i]["SlNo"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "VICTULING_InsertDailyItemSummary";

                    sqlcmd.Parameters.AddWithValue("@ItemCode", itemCode);
                    sqlcmd.Parameters.AddWithValue("@Item", item);
                    sqlcmd.Parameters.AddWithValue("@SaleQty", saleQty);
                    sqlcmd.Parameters.AddWithValue("@Messurment", itemMessurment);
                    sqlcmd.Parameters.AddWithValue("@reason", reason);
                    sqlcmd.Parameters.AddWithValue("@groupMenue", groupMenue);
                   // sqlcmd.Parameters.AddWithValue("@serialNo", serial);

                    sqlcmd.Parameters.AddWithValue("@saleDate", dateTo.SelectedDate.ToString());
                    sqlcmd.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@craetdDate", System.DateTime.Now);

                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success";

                }
                catch
                {

                }
            }
        }

        public void SaveDepreciation()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string selectdate = dateTo.SelectedDate.ToString();

            dt = itemObject.GetDailyItemSummaryDepreciation(strConnString, wardroomCode, selectdate);


            for (int i = 0; i < dt.Rows.Count; i++)
            {

                string itemCode = "";
                string item = "";
                string saleQty = "";
                string itemMessurment = "";
                string reason = "";
                string groupMenue = "";
               // string serial = "";

                itemCode = dt.Rows[i]["itemCode"].ToString();
                item = dt.Rows[i]["item"].ToString();
                saleQty = dt.Rows[i]["saleQty"].ToString();
                itemMessurment = dt.Rows[i]["itemMessurment"].ToString();
                reason = dt.Rows[i]["reason"].ToString();
                groupMenue = dt.Rows[i]["GroupMenu"].ToString();
                //serial = dt.Rows[i]["SlNo"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "VICTULING_InsertDailyItemSummary";

                    sqlcmd.Parameters.AddWithValue("@ItemCode", itemCode);
                    sqlcmd.Parameters.AddWithValue("@Item", item);
                    sqlcmd.Parameters.AddWithValue("@SaleQty", saleQty);
                    sqlcmd.Parameters.AddWithValue("@Messurment", itemMessurment);
                    sqlcmd.Parameters.AddWithValue("@reason", reason);
                    sqlcmd.Parameters.AddWithValue("@groupMenue", groupMenue);
                   // sqlcmd.Parameters.AddWithValue("@serialNo", serial);

                    sqlcmd.Parameters.AddWithValue("@saleDate", dateTo.SelectedDate.ToString());
                    sqlcmd.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@craetdDate", System.DateTime.Now);

                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success";

                }
                catch
                {

                }
            }
        }

        protected void grdReport6_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport6.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn6") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport6.PageCount) + e.Item.ItemIndex + 1);
            }
        }
    }
}