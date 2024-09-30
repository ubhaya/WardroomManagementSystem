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
    public partial class MealAttendanceDelete : System.Web.UI.Page
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
        public static DataSet countNVeg = new DataSet();

        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtNonVegetarian = new DataTable();
        public static DataTable dtVegetarian = new DataTable();

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
        }

        public void getMenuReason()
        {
            txtWardRoom.Text = Session["wardRoomName"].ToString();

            dtMenuReason = itemObject.GetManuReason(strConnString);
            cmbDescription.DataSource = dtMenuReason;

            cmbDescription.DataTextField = "reason";
            cmbDescription.DataValueField = "reasonCode";
            cmbDescription.DataBind();
            cmbDescription.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtWardroom = itemObject.GetWardroom(strConnString);
            ddlWardroom.DataSource = dtWardroom;

            ddlWardroom.DataTextField = "wardroomName";
            ddlWardroom.DataValueField = "wardroomCode";
            ddlWardroom.DataBind();

            ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            GridBind();
        }

        public void GridBind()
        {
            if (ddlVegi.SelectedItem.Text == "Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_GetMealAttendanceList_vegetarian]";

                command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
                command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport.DataSource = ds.Tables[0];

                grdReport.DataBind();

                con.Close();

                ///////////
                string date = dateSelected.SelectedDate.ToString();
                string reasonCode = cmbDescription.SelectedItem.Text;
                string wardroomCode = ddlWardroom.SelectedValue.ToString();

                dtVegetarian = itemObject.GetVegiCount(strConnString, date, reasonCode, wardroomCode);

                if (dtVegetarian.Rows.Count > 0)
                {
                    Session["ss"] = dtVegetarian;
                    PublishdataVegi(dtVegetarian, date, reasonCode, wardroomCode);
                }
            }

            else if (ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_GetMealAttendanceList_NonVegetarian]";

                command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
                command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport.DataSource = ds.Tables[0];

                grdReport.DataBind();

                con.Close();

                //////////

                string date = dateSelected.SelectedDate.ToString();
                string reasonCode = cmbDescription.SelectedItem.Text;
                string wardroomCode = Session["wardRoomCode"].ToString();

                dtNonVegetarian = itemObject.GetNonVegiCount(strConnString, date, reasonCode, wardroomCode);

                if (dtNonVegetarian.Rows.Count > 0)
                {
                    Session["ss"] = dtNonVegetarian;
                    Publishdata(dtNonVegetarian, date, reasonCode, wardroomCode);
                }
            }
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

        public void Publishdata(DataTable one, string date, string reasonCode, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchNonVegetarianDetils(date, reasonCode, wardroomCode);

            GetPersonalData(xx);
        }

        public void PublishdataVegi(DataTable one, string date, string reasonCode, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchVegetarianDetils(date, reasonCode, wardroomCode);

            GetPersonalData(xx);
        }

        public void GetPersonalData(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblCount.Text = personal.Tables[0].Rows[0]["mealCount"].ToString();
                }
                else
                {
                    lblCount.Text = "No Data";
                }
            }
        }

        protected void grdReport_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void rgdBoardAssessment_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["mealId"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[T_MealAttendance] WHERE [mealId] = '" + int.Parse(id) + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblError.Text = "Delete Successfull";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex) { }
            }

            GridBind(); 
        }
    }
}