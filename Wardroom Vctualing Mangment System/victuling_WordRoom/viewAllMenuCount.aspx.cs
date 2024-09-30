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
    public partial class viewAllMenuCount : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static String wardRoomName, wardRoomCode;
        public static DataTable dtOfficerList = new DataTable();
        public static DataTable dtVegOfficerList = new DataTable();
        public static DataSet xx = new DataSet();

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
            //ddlWardroom.DataSource = dtWardroom;

            //ddlWardroom.DataTextField = "wardroomName";
            //ddlWardroom.DataValueField = "wardroomCode";
            //ddlWardroom.DataBind();

            //ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            txtWardRoom.Text = Session["wardRoomName"].ToString();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {   
            getMenuNon_Veg();
            getMenuVeg();

            ViewSaleMenuItem();
            ViewVeg_SaleMenuItem();

            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = wardRoomCode;
            //string veg = ddlVegi.SelectedItem.Text;

            dtOfficerList = itemObject.GetAllMainMenuNonVegAtten(strConnString, date, reasonCode, wardroomCode);

            if (dtOfficerList.Rows.Count > 0)
            {
                Session["ss"] = dtOfficerList;
                Publishdata(dtOfficerList, date, reasonCode, wardroomCode);
            }

            costPerHead();
           

            dtVegOfficerList = itemObject.GetAllMainMenuVegAtten(strConnString, date, reasonCode, wardroomCode);

            if (dtOfficerList.Rows.Count > 0)
            {
                Session["ss"] = dtVegOfficerList;
                PublishdataVeg(dtVegOfficerList, date, reasonCode, wardroomCode);
            }
             costPerVegHead();

             getGroupMenu();
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

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode);
            command.Parameters.AddWithValue("@groupMenuCode", "70000000");

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[0];

            grdReport0.DataBind();

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

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode);
            command.Parameters.AddWithValue("@groupMenuCode", "70000000");

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[0];

            grdReport1.DataBind();

            con.Close();
        }

        public void getGroupMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetAllGroupMenu]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode);
           // command.Parameters.AddWithValue("@groupMenuCode", "70000000");

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport3.DataSource = ds.Tables[0];

            grdReport3.DataBind();

            con.Close();
        }

        public void Publishdata(DataTable one, string date, string reasonCode, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchNameList(date, reasonCode, wardroomCode);

            GetPersonalData(xx);
        }

        public void PublishdataVeg(DataTable one, string date, string reasonCode, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchNameList(date, reasonCode, wardroomCode);

            GetPersonalDataVeg(xx);
        }

        public void ViewSaleMenuItem()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetAllMenuItemList_OnDate]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reason", ddlReason.SelectedValue);
       

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];
            grdReport.DataBind();

            decimal tot = 0;
            for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
            {
                tot += decimal.Parse(ds.Tables[0].Rows[x][7].ToString());
            }
            lblTot.Text = tot.ToString();
            lblTot.Visible = true;
            //lblError.Visible = true;
            con.Close();
        }

        public void ViewVeg_SaleMenuItem()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetAllMenuItemList_OnDate]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reason", ddlReason.SelectedValue);


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[1];
            grdReport2.DataBind();

            decimal tot = 0;
            for (int x = 0; x < ds.Tables[1].Rows.Count; x++)
            {
                tot += decimal.Parse(ds.Tables[1].Rows[x][7].ToString());
            }
            lblTot0.Text = tot.ToString();
            lblTot0.Visible = true;
            //lblError.Visible = true;
            con.Close();
        }

        public void costPerHead()
        {
            double NoOfDays = 0.00;
            double CostPerDay = 0.00;
            double ans5 = 0.00;

            NoOfDays = System.Double.Parse(lblCount.Text);
            CostPerDay = System.Double.Parse(lblTot.Text);


            ans5 = (CostPerDay / NoOfDays);
            lblHed.Text = ans5.ToString();
        }

        public void costPerVegHead()
        {
            double NoOfDays1 = 0.00;
            double CostPerDay1 = 0.00;
            double ans6 = 0.00;

            NoOfDays1 = System.Double.Parse(lblCount0.Text);
            CostPerDay1 = System.Double.Parse(lblTot0.Text);


            ans6 = (CostPerDay1 / NoOfDays1);
            lblHed0.Text = ans6.ToString();
        }

        private DataSet SearchNameList(string date, string reasonCode, string wardroomCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetAllMenuItemList_OnDate]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@onChargeDate", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reason", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar).Value = wardroomCode;
           

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
           
        }

        public void GetPersonalData(DataSet xx)
        {

            DataSet personal = xx;
            if (personal.Tables[2].Rows.Count > 0)
            {

                if (0 < (personal.Tables[2].Rows.Count))
                {
                    string V1 = "";
                    for (int i = 0; i < (personal.Tables[2].Rows.Count); i++)
                    {
                        if ((personal.Tables[2].Rows.Count) - 1 > i)
                        {

                            V1 = V1 + personal.Tables[2].Rows[i][0].ToString() + ",";

                        }
                        else
                        {
                            V1 = V1 + personal.Tables[2].Rows[i][0].ToString();
                        }
                        txtOfficerList.Text = V1;
                    }

                }
                else
                {
                    txtOfficerList.Text = "No Data";
                }
            }

            if (0 < (personal.Tables[3].Rows.Count))
            {
                lblCount.Text = personal.Tables[3].Rows[0]["mealCount"].ToString();
            }
            else
            {
                lblCount.Text = "No Data";
            }

            //if (0 < (personal.Tables[0].Rows.Count))
            //{
            //    lblVegetarianCount.Text = personal.Tables[0].Rows[0]["mealCount"].ToString();
            //}
            //else
            //{
            //    lblVegetarianCount.Text = "No Data";
            //}
        }

        public void GetPersonalDataVeg(DataSet xx)
        {

            DataSet personal = xx;
            if (personal.Tables[4].Rows.Count > 0)
            {

                if (0 < (personal.Tables[4].Rows.Count))
                {
                    string V1 = "";
                    for (int i = 0; i < (personal.Tables[4].Rows.Count); i++)
                    {
                        if ((personal.Tables[2].Rows.Count) - 1 > i)
                        {

                            V1 = V1 + personal.Tables[4].Rows[i][0].ToString() + ",";

                        }
                        else
                        {
                            V1 = V1 + personal.Tables[4].Rows[i][0].ToString();
                        }
                        txtOfficerList0.Text = V1;
                    }

                }
                else
                {
                    txtOfficerList0.Text = "No Data";
                }
            }

            if (0 < (personal.Tables[5].Rows.Count))
            {
                lblCount0.Text = personal.Tables[5].Rows[0]["mealCount"].ToString();
            }
            else
            {
                lblCount0.Text = "No Data";
            }

            //if (0 < (personal.Tables[0].Rows.Count))
            //{
            //    lblVegetarianCount.Text = personal.Tables[0].Rows[0]["mealCount"].ToString();
            //}
            //else
            //{
            //    lblVegetarianCount.Text = "No Data";
            //}
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

        protected void r(object sender, GridNeedDataSourceEventArgs e)
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

        protected void grdReport2_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport2.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport2.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport1_ItemDataBound(object sender, GridItemEventArgs e)
        {

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
    }
}