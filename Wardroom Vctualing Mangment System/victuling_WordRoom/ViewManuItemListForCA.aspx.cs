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
    public partial class ViewManuItemListForCA : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItems = new DataTable();
        public static DataTable dtGetSaleItemsQty = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtTotalMenuCost = new DataTable();
        public static DataTable dtNonVegetarian = new DataTable();
        public static DataTable dtVegetarian = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
        public static DataTable dtSalebySA = new DataTable();
        public static DataTable dtGetDeductItems = new DataTable();

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();

        public static int countval = 0;
        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();
                //SetInitialRow();
            }

            //lblDate.Visible = false;
            //lblReason.Visible = false;
        }

        public void LoadBasic()
        {

           


            dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            ddlGroupMenu.DataSource = dtGroupMenuNew;

            ddlGroupMenu.DataTextField = "GroupMenu";
            ddlGroupMenu.DataValueField = "GroupMenuCode";
            ddlGroupMenu.DataBind();

            txtWardRoom.Text = Session["wardRoomName"].ToString();
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyProperMenu]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[0];

            grdReport1.DataBind();

            con.Close();

            getNonVegList();
            getVegList();
        }

        public void getNonVegList()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();

            dtNonVegetarian = itemObject.GetNonVegiCount(strConnString, date, reasonCode, wardroomCode);

            if (dtNonVegetarian.Rows.Count > 0)
            {
                Session["ss"] = dtNonVegetarian;
                Publishdata(dtNonVegetarian, date, reasonCode, wardroomCode);
            }
        }

        public void getVegList()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();

            dtVegetarian = itemObject.GetVegiCount(strConnString, date, reasonCode, wardroomCode);

            if (dtVegetarian.Rows.Count > 0)
            {
                Session["ss"] = dtVegetarian;
                PublishdataVegi(dtVegetarian, date, reasonCode, wardroomCode);
            }
        }

        public void PublishdataVegi(DataTable one, string date, string reasonCode, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchVegetarianDetils(date, reasonCode, wardroomCode);

            GetPersonalDataVegi(xx);
        }

        public void Publishdata(DataTable one, string date, string reasonCode, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchNonVegetarianDetils(date, reasonCode, wardroomCode);

            GetPersonalDataNVegi(xx);
        }

        public void GetPersonalDataVegi(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblVegetarianCount.Text = personal.Tables[0].Rows[0]["mealCount"].ToString();
                }
                else
                {
                    lblVegetarianCount.Text = "No Data";
                }

            }
        }

        public void GetPersonalDataNVegi(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblNonVegetarianCount.Text = personal.Tables[0].Rows[0]["mealCount"].ToString();
                }
                else
                {
                    lblNonVegetarianCount.Text = "No Data";
                }
            }
        }

        private DataSet SearchVegetarianDetils(string date, string reasonCode, string wardroomCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetMealAttendanceCount_Vegetarian]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        private DataSet SearchNonVegetarianDetils(string date, string reasonCode, string wardroomCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetMealAttendanceCount_NonVegetarian]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {

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

        protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void lblViewCA_Click(object sender, EventArgs e)
        {
            if (ddlVegi.SelectedItem.Text == "Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForSA]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@noOfPerson", lblVegetarianCount.Text);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport0.DataSource = ds.Tables[0];

                grdReport0.DataBind();

                con.Close();

            }

            else if (ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForSA]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@noOfPerson", lblNonVegetarianCount.Text);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport0.DataSource = ds.Tables[0];

                grdReport0.DataBind();

                con.Close();

            }
        }

        protected void grdReport0_ItemCommand(object sender, GridCommandEventArgs e)
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

        protected void lnTotalIngredientsList_Click(object sender, EventArgs e)
        {
            if (ddlVegi.SelectedItem.Text == "Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForSA_Tot]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@noOfPerson", lblVegetarianCount.Text);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport2.DataSource = ds.Tables[0];

                grdReport2.DataBind();

                con.Close();

            }

            else if (ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForSA_Tot]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@noOfPerson", lblNonVegetarianCount.Text);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport2.DataSource = ds.Tables[0];

                grdReport2.DataBind();

                con.Close();

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