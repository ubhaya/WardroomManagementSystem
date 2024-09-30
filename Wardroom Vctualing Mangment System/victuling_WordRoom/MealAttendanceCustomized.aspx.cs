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
    public partial class MealAttendanceCustomized : System.Web.UI.Page
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

            lblNic.Visible = false;
            grdReport.Visible = false;
        }

        public void getMenuReason()
        {
            try
            {

                dtMenuReason = itemObject.GetManuReason(strConnString);
                cmbDescription.DataSource = dtMenuReason;

                cmbDescription.DataTextField = "reason";
                cmbDescription.DataValueField = "reasonCode";
                cmbDescription.DataBind();
                cmbDescription.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

                //txtWardRoom.Text = wardRoomName.ToString();

                //dtWardroom = itemObject.GetWardroom(strConnString);
                //ddlWardroom.DataSource = dtWardroom;

                //ddlWardroom.DataTextField = "wardroomName";
                //ddlWardroom.DataValueField = "wardroomCode";
                //ddlWardroom.DataBind();

                dtWardroom = itemObject.GetWardroom(strConnString);
                txtWardRoom.Text = wardRoomName.ToString();

                ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

                dtBaseAll = itemObject.GetAllBase(strConnString2);
                ddlBaseAll.DataSource = dtBaseAll;

                ddlBaseAll.DataTextField = "baseDescription";
                ddlBaseAll.DataValueField = "baseCode";
                ddlBaseAll.DataBind();

                ddlBaseAll.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            }
            catch (Exception ex) { }
        }

        protected void btnVewMenu_Click(object sender, EventArgs e)
        {
            if (ddlVeg.SelectedItem.Text == "Non-Vegetarian")
            {
            NonVeg();
            }

            if (ddlVeg.SelectedItem.Text == "Vegetarian")
            {
                Veg();
            }
        }

        public void Veg()
        {
            string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection Conn = new SqlConnection(strConnString);

            using (Conn)
            {
                SqlCommand command = new SqlCommand("VICTULING_GetDailyProperMenu", Conn);
                command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
                command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", wardRoomCode);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVeg.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", "70000000");

                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();

                command.CommandType = CommandType.StoredProcedure;
                Conn.Open();
                da.SelectCommand = command;
                da.Fill(dt);

                RadListBox1.DataSource = dt;
                RadListBox1.DataValueField = "mainItem";
                RadListBox1.DataTextField = "mainItem";
                RadListBox1.DataBind();
            }
        }

        public void NonVeg()
        {
            string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection Conn = new SqlConnection(strConnString);

            using (Conn)
            {
                SqlCommand command = new SqlCommand("VICTULING_GetDailyProperMenu_NonVeg", Conn);
                command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
                command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", wardRoomCode);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVeg.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", "70000000");

                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();

                command.CommandType = CommandType.StoredProcedure;
                Conn.Open();
                da.SelectCommand = command;
                da.Fill(dt);

                RadListBox1.DataSource = dt;
                RadListBox1.DataValueField = "mainItem";
                RadListBox1.DataTextField = "mainItem";
                RadListBox1.DataBind();
            }
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
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

        protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void btnViewOfficer_Click(object sender, EventArgs e)
        {
            string off = txtOfficialNo.Text;
            string OSType = ddlOfficerSailor.SelectedItem.Text.ToString();
            string ServiceType = ddlServiceType.SelectedItem.Text.ToString();

            dtOfficerSailor.Clear();

            if (OSType == "Sailor")
            {
                OS = "S";

                dtOfficerSailor = itemObject.GetAllOfficerDetails(strConnString2, OS,  off);
                if (dtOfficerSailor.Rows.Count > 0)
                {
                    Session["ss"] = dtOfficerSailor;
                    Session["OS"] = OS;

                    Publishdata(dtOfficerSailor);

                }
                else
                {
                    lblError.Text = "No data found";
                }
            }

            else if (OSType == "Officer")
            {
                OS = "O";

                dtOfficerSailor = itemObject.GetAllOfficerDetails(strConnString2, OS,  off);
                if (dtOfficerSailor.Rows.Count > 0)
                {
                    Session["ss"] = dtOfficerSailor;
                    Session["OS"] = OS;

                    Publishdata(dtOfficerSailor);
                    lblError.Text = "";
                }
                else
                {
                    lblError.Text = "No data found";
                }
            }
        }

        public void Publishdata(DataTable one)
        {

            DataRow row = one.Rows[0];
            nicNo_SSID = row["nicNo_SSID"].ToString();
            officialNo = row["officialNo"].ToString();
            serviceType = row["serviceType"].ToString();

            xx.Clear();
            xx = SearchPesonalDeatailBySelectedNew(nicNo_SSID, officialNo, OS, serviceType);
            GetPersonalData(xx);
            //btnBack.Visible = true;
        }

        private DataSet SearchPesonalDeatailBySelectedNew(string SelectedNic, string SelectedOff, string SelectedOS, string SelectedST)
        {

            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Parameters.Clear();
            cmd = new SqlCommand("HRIS_PersonalRecord_PersonalDetailsSelect2", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@nicNo_SSID", SqlDbType.VarChar).Value = SelectedNic;
            cmd.Parameters.Add("@off", SqlDbType.VarChar).Value = SelectedOff;
            cmd.Parameters.Add("@OS", SqlDbType.VarChar).Value = SelectedOS;
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
                    imgPerson.ImageUrl = personal.Tables[0].Rows[0]["image"].ToString();
                }


                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblNic.Text = personal.Tables[0].Rows[0]["nicNo_SSID"].ToString();
                }
                else
                {
                    lblNic.Text = "No Data";
                }

                if (0 < (personal.Tables[16].Rows.Count))
                {
                    lblRank.Text = personal.Tables[16].Rows[0]["description"].ToString();
                }
                else
                {
                    lblRank.Text = "No Data";
                }

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblFullName.Text = personal.Tables[0].Rows[0]["fullName"].ToString();
                }
                else
                {
                    lblFullName.Text = "No Data";
                }

                if (0 < (personal.Tables[20].Rows.Count))
                {
                    lblPermanentBase.Text = personal.Tables[20].Rows[0]["baseName"].ToString();
                }
                else
                {
                    lblPermanentBase.Text = "No Data";
                }


            }



        }

        protected void ToggleSelectedState(object sender, EventArgs e)
        {
            CheckBox headerCheckBox = (sender as CheckBox);
            foreach (GridDataItem dataItem in grdReport.MasterTableView.Items)
            {
                (dataItem.FindControl("cbxSelect") as CheckBox).Checked = headerCheckBox.Checked;
                dataItem.Selected = headerCheckBox.Checked;
            }
        }

        protected void ToggleRowSelection(object sender, EventArgs e)
        {
            ((sender as CheckBox).NamingContainer as GridItem).Selected = (sender as CheckBox).Checked;
            bool checkHeader = true;
            foreach (GridDataItem dataItem in grdReport.MasterTableView.Items)
            {
                if (!(dataItem.FindControl("cbxSelect") as CheckBox).Checked)
                {
                    checkHeader = false;
                    break;
                }
                GridHeaderItem headerItem = grdReport.MasterTableView.GetItems(GridItemType.Header)[0] as GridHeaderItem;
                (headerItem.FindControl("headerChkbox") as CheckBox).Checked = checkHeader;
            }
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
                String meal = "";

                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Save_T_customizeMealAttendance]";

                cmd.Parameters.AddWithValue("@mealDate", dateSelected.SelectedDate);
                cmd.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
                cmd.Parameters.AddWithValue("@officerSailor", ddlOfficerSailor.SelectedValue.ToString());
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

                for (int i = 0; i < RadListBox1.CheckedItems.Count; i++)
                {
                    if (i == RadListBox1.CheckedItems.Count - 1)
                    {
                        meal = meal + RadListBox1.CheckedItems[i].Value.ToString();
                    }
                    else
                    {
                        meal = meal + RadListBox1.CheckedItems[i].Value.ToString() + ",";
                    }
                }

                cmd.Parameters.AddWithValue("@selectedMeal", meal);
                cmd.Parameters.AddWithValue("@remarks", txtRemarks.Text);
                cmd.Parameters.AddWithValue("@mealCount", ddlMealCOunt.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@baseCode", ddlBaseAll.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@wardroom", wardRoomCode);

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

        protected void ddlMealCat_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void ddlMeal_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }
    }
}