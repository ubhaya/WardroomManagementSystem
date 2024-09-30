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
    public partial class GetGroupMenuMarkList : System.Web.UI.Page
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
        public static DataTable dtGroupMenuNew = new DataTable();

        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            if (!IsPostBack)
            {

                wardRoomName = Session["wardRoomName"].ToString();
                wardRoomCode = Session["wardRoomCode"].ToString();

                getMenuReason();
            }
        }

        public void getMenuReason()
        {

            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = wardRoomName;

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
            ddlGroupMenu.Items.Insert(0, new RadComboBoxItem("---Select---", ""));
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
                command.CommandText = "[VICTULING_GetGroupMealAttendanceList_vegetarian]";

                command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
                command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.Trim());
                command.Parameters.AddWithValue("@GroupMenuCode", ddlGroupMenu.SelectedValue.ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport.DataSource = ds.Tables[0];

                grdReport.DataBind();

                con.Close();

                ///////////
                //string date = dateSelected.SelectedDate.ToString();
                //string reasonCode = cmbDescription.SelectedValue.ToString();
                //string wardroomCode = wardRoomCode;

                //dtVegetarian = itemObject.GetVegiCount(strConnString, date, reasonCode, wardroomCode);

                //if (dtVegetarian.Rows.Count > 0)
                //{
                //    Session["ss"] = dtVegetarian;
                //    PublishdataVegi(dtVegetarian, date, reasonCode, wardroomCode);
                //}
            }

            else if (ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_GetGroupMealAttendanceList_NonVegetarian]";

                command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
                command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", wardRoomCode);
                command.Parameters.AddWithValue("@GroupMenuCode", ddlGroupMenu.SelectedValue.ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport.DataSource = ds.Tables[0];

                grdReport.DataBind();

                con.Close();

                //    //////////

                //    string date = dateSelected.SelectedDate.ToString();
                //    string reasonCode = cmbDescription.SelectedValue.ToString();
                //    string wardroomCode = wardRoomCode;

                //    dtNonVegetarian = itemObject.GetNonVegiCount(strConnString, date, reasonCode, wardroomCode);

                //    if (dtNonVegetarian.Rows.Count > 0)
                //    {
                //        Session["ss"] = dtNonVegetarian;
                //        Publishdata(dtNonVegetarian, date, reasonCode, wardroomCode);
                //    }
            }
        }


        protected void grdReport_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
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
    }
}