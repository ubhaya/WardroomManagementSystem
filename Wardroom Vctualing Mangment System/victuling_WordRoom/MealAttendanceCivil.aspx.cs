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
    public partial class MealAttendanceCivil : System.Web.UI.Page
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
        public static DataTable dtCivilDetails = new DataTable();
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

            //dtWardroom = itemObject.GetWardroom(strConnString);
            //ddlWardroom.DataSource = dtWardroom;

            //ddlWardroom.DataTextField = "wardroomName";
            //ddlWardroom.DataValueField = "wardroomCode";
            //ddlWardroom.DataBind();

            //ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = wardRoomName.ToString();

            dtBaseAll = itemObject.GetAllBase(strConnString2);
            ddlBaseAll.DataSource = dtBaseAll;

            ddlBaseAll.DataTextField = "baseDescription";
            ddlBaseAll.DataValueField = "baseCode";
            ddlBaseAll.DataBind();

            ddlBaseAll.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

        }

        protected void btnVewMenu_Click(object sender, EventArgs e)
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
            command.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());
            command.Parameters.AddWithValue("@groupMenuCode", ddlWardroom.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
        }

        protected void grdReport_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
          
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

        protected void rdoMealInOut_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAddMenu_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            try
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Save_T_MealAttendance]";

                cmd.Parameters.AddWithValue("@mealDate", dateSelected.SelectedDate);
                cmd.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
                cmd.Parameters.AddWithValue("@officerSailor", 'O');
                cmd.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@reason", cmbDescription.SelectedItem.Text);

                if (rdoVegi.SelectedItem.Text == "Vegetarian")
                {
                    cmd.Parameters.AddWithValue("@vegetarian", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@vegetarian", 0);
                }

                if (rdoVegi.SelectedItem.Text == "Non-Vegetarian")
                {
                    cmd.Parameters.AddWithValue("@noneVegetarian", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@noneVegetarian", 0);
                }

                if (rdoMealInOut.SelectedItem.Text == "Meal In")
                {
                    cmd.Parameters.AddWithValue("@mealIn", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@mealIn", 0);
                }

                if (rdoMealInOut.SelectedItem.Text == "Meal Out")
                {
                    cmd.Parameters.AddWithValue("@mealOut", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@mealOut", 0);
                }

                cmd.Parameters.AddWithValue("@mealCount", ddlMealCOunt.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@baseCode", ddlBaseAll.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@wardroom", ddlWardroom.SelectedValue.ToString());

                cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                lblError.Visible = true;

                lblError.Text = "Insert Menu Item to List!";
                lblError.ForeColor = System.Drawing.Color.Green;


            }

            catch (Exception ex)
            {
                //lbl_Errormsg.Visible = true;
                //lbl_Errormsg.Text = ex.Message;
            }
        }

        protected void ddlWardroom_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void btnViewOfficer_Click(object sender, EventArgs e)
        {
            string off = txtOfficialNo.Text;
            string ServiceType = ddlServiceType.SelectedItem.Text.ToString();

            dtCivilDetails.Clear();


            dtCivilDetails = itemObject.GetAllCivilDetails(strConnString, ServiceType, off);
            if (dtCivilDetails.Rows.Count > 0)
                {
                    Session["ss"] = dtOfficerSailor;
                    Session["OS"] = OS;

                    Publishdata(dtCivilDetails);

                }
                else
                {
                    lblError.Text = "No data found";
                }
     
        }


        public void Publishdata(DataTable one)
        {

            DataRow row = one.Rows[0];

            officialNo = row["officialNo"].ToString();
            serviceType = row["serviceType"].ToString();

            xx.Clear();
            xx = SearchPesonalDeatailBySelectedNew(officialNo,  serviceType);
            GetPersonalData(xx);
            //btnBack.Visible = true;
        }

        private DataSet SearchPesonalDeatailBySelectedNew(string SelectedOff, string SelectedST)
        {

            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Parameters.Clear();
            cmd = new SqlCommand("VICTULING_Search_PersonalRecordCivil", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@off", SqlDbType.VarChar).Value = SelectedOff;
            cmd.Parameters.Add("@st", SqlDbType.VarChar).Value = SelectedST;
            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);

            return dst;
        }

        public void GetPersonalData(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {
               

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblFullName.Text = personal.Tables[0].Rows[0]["fullName"].ToString();
                }
                else
                {
                    lblFullName.Text = "No Data";
                }

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblPermanentBase.Text = personal.Tables[0].Rows[0]["baseDescription"].ToString();
                }
                else
                {
                    lblPermanentBase.Text = "No Data";
                }


            }



        }
    }
}