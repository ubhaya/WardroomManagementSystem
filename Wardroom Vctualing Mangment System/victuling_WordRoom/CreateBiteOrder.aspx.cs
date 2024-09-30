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
    public partial class CreateBiteOrder : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMealCategory = new DataTable();
        public static DataTable dtUpdateSportsGrid = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static string nic = "";
        public static string OS = "";
        public static string nicNo_SSID = "";
        public static string officialNo = "";
        public static string serviceType = "";

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();
        public static DataSet xx3 = new DataSet();
        public static DataSet xx4 = new DataSet();

        public static String wardRoomName, wardRoomCode;
        public static int countval = 0;
        float totalMealCost = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (!IsPostBack)
            {
                getMenuReason();
                SetInitialRow();
            }
        }

        public void getMenuReason()
        {
            dtMenuReason = itemObject.GetManuReason(strConnString);
            cmbDescription.DataSource = dtMenuReason;

            cmbDescription.DataTextField = "reason";
            cmbDescription.DataValueField = "reasonCode";
            cmbDescription.DataBind();
            cmbDescription.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = wardRoomName.ToString();
            //txtWardRoom0.Text = wardRoomName.ToString();
            

            dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            ddlGroupMenu.DataSource = dtGroupMenuNew;

            ddlGroupMenu.DataTextField = "GroupMenu";
            ddlGroupMenu.DataValueField = "GroupMenuCode";
            ddlGroupMenu.DataBind();

            dtMealCategory = itemObject.GetMealCategory(strConnString);
            ddlMealCat.DataSource = dtMealCategory;

            ddlMealCat.DataTextField = "mainItemCategory";
            ddlMealCat.DataValueField = "mainItemCategoryCode";
            ddlMealCat.DataBind();

            ddlMealCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            //dtItemCat = itemObject.GetItemCatagory(strConnString);
            //ddlItemCat.DataSource = dtItemCat;

            //ddlItemCat.DataTextField = "itemCatagory";
            //ddlItemCat.DataValueField = "itemCatagoryCode";
            //ddlItemCat.DataBind();

            //ddlItemCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("MealId", typeof(string)));
            dt.Columns.Add(new DataColumn("MealCat", typeof(string)));
            dt.Columns.Add(new DataColumn("MealItem", typeof(string)));
            dt.Columns.Add(new DataColumn("Remarks", typeof(string)));


            dr = dt.NewRow();

            dr["MealId"] = string.Empty;
            dr["MealCat"] = string.Empty;
            dr["MealItem"] = string.Empty;
            dr["Remarks"] = string.Empty;

            dt.Rows.Add(dr);

            ViewState["CurrentTable"] = dt;

            grdMedal.DataSource = dt;
            grdMedal.DataBind();
        }

        private void AddNewRowToGrid()
        {

            int rowIndex = 0;

            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {

                        RadTextBox box1 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[1].FindControl("txtMealID");
                        RadTextBox box2 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[2].FindControl("txtMealCategory");
                        RadTextBox box3 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[3].FindControl("txtMealItem");
                        RadTextBox box4 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("txtRemarks");

                        drCurrentRow = dtCurrentTable.NewRow();

                        drCurrentRow["MealId"] = box1.Text;
                        drCurrentRow["MealCat"] = box2.Text;
                        drCurrentRow["MealItem"] = box3.Text;
                        drCurrentRow["Remarks"] = box4.Text;

                        rowIndex++;
                    }

                    dtCurrentTable.Rows.Add(drCurrentRow);
                    for (int i = 1; i < countval - 1; i++)
                    {
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["MealId"] = string.Empty;
                        drCurrentRow["MealCat"] = string.Empty;
                        drCurrentRow["MealItem"] = string.Empty;
                        drCurrentRow["Remarks"] = string.Empty;

                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }

                    //dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["CurrentTable"] = dtCurrentTable;

                    grdMedal.DataSource = dtCurrentTable;
                    grdMedal.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }
            //Set Previous Data on Postbacks
            SetPreviousData();
        }

        private void SetPreviousData()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 1; i < dt.Rows.Count; i++)
                    {
                        RadTextBox box1 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[1].FindControl("txtMealID");
                        RadTextBox box2 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[1].FindControl("txtMealCategory");
                        RadTextBox box3 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[2].FindControl("txtMealItem");
                        RadTextBox box4 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[3].FindControl("txtRemarks");

                        box1.Text = dt.Rows[i]["MealId"].ToString();
                        box2.Text = dt.Rows[i]["MealCat"].ToString();
                        box3.Text = dt.Rows[i]["MealItem"].ToString();
                        box4.Text = dt.Rows[i]["From"].ToString();



                        rowIndex++;
                    }
                }
            }
        }

        protected void ddlMealCat_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string itemValue = ddlMealCat.Text;
            DataTable Entrydt1 = tt.GetMealItemByCate(itemValue, strConnString);
            ddlMeal.DataSource = Entrydt1;
            ddlMeal.DataTextField = "mainItem";
            ddlMeal.DataValueField = "mainItemCode";
            ddlMeal.DataBind();
            ddlMeal.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void ddlMeal_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void btnAddMenuItem_Click(object sender, EventArgs e)
        {
            AddMenuItem_T_DailyMenu();
            Bind_T_DailyMenu();
        }

        public void AddMenuItem_T_DailyMenu()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Save_BiteMenuItems]";

                    RadTextBox remark = (RadTextBox)grdMedal.Rows[i].FindControl("txtRemarks");

                    cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate);
                    cmd.Parameters.AddWithValue("@mealCategory", ddlMealCat.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@mainItemCode", ddlMeal.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString());
                    cmd.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);

                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                    cmd.Parameters.AddWithValue("@isAuthorized", 0);
                    cmd.Parameters.AddWithValue("@remarks", remark.Text);
                    cmd.Parameters.AddWithValue("@isActive", 1);

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
        }


        public void Bind_T_DailyMenu()
        {
            if ((txtWardRoom.Text == "") || (dateMenuDate.SelectedDate.ToString() == "") || (cmbDescription.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Date Cannot be Empty and Select Wardroom and Reason !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                SetInitialRow();

                string Wardroom = wardRoomCode.ToString();
                string Description = cmbDescription.SelectedValue.ToString();
                string GroupMenu = ddlGroupMenu.SelectedValue.ToString();

                string MenuDate = DateTime.Parse(dateMenuDate.SelectedDate.ToString()).Date.ToShortDateString();
                string[] codes = MenuDate.Split('/');
                string val = codes[2] + "-" + codes[0] + "-" + codes[1];

                dtUpdateSportsGrid.Clear();

                dtUpdateSportsGrid = itemObject.GetMenuBite(strConnString, MenuDate, Description, Wardroom, GroupMenu);
                if (dtUpdateSportsGrid.Rows.Count > 0)
                {
                    Session["ss"] = dtUpdateSportsGrid;
                    bindserchdatagv();

                }
                else
                {
                    lblError.Text = "No data found";
                    lblError.ForeColor = System.Drawing.Color.Red;

                }
            }

            int k = 0;

            dtUpdateSportsGrid = itemObject.GetMenuBite(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), wardRoomCode.ToString(), ddlGroupMenu.SelectedValue.ToString());
            if (dtUpdateSportsGrid.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtUpdateSportsGrid.Rows)
                {

                    string MealID = row[3].ToString();
                    string MealCat = row[1].ToString();
                    string MealItem = row[2].ToString();
                    string Remarks = row[4].ToString();

                    RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtMealID");
                    RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtMealCategory");
                    RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtMealItem");
                    RadTextBox t3 = (RadTextBox)grdMedal.Rows[k].FindControl("txtRemarks");

                    t.Text = MealID;
                    t1.Text = MealCat;
                    t2.Text = MealItem;
                    t3.Text = Remarks;

                    k++;
                }

            }
        }

        public void bindserchdatagv()
        {
            //DateTime SignalRefDate = Convert.ToDateTime(dateMenuDate.SelectedDate.ToString());
            //dtUpdateSportsGrid.Clear();
            dtUpdateSportsGrid = itemObject.GetMenu(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), wardRoomCode.ToString(), ddlGroupMenu.SelectedValue.ToString());

            if (dtUpdateSportsGrid.Rows.Count > 0)
            {
                grdMedal.DataSource = dtUpdateSportsGrid;
                grdMedal.DataBind();
            }
        }

        protected void grdMedal_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btnAddMenu_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {
                    RadTextBox MealItem = (RadTextBox)grdMedal.Rows[i].FindControl("txtMealItem");
                    RadTextBox Remarks = (RadTextBox)grdMedal.Rows[i].FindControl("txtRemarks");
                    CheckBox chkPaticipation = (CheckBox)grdMedal.Rows[i].FindControl("SelectCheckBox");

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Insert_T_BiteMenue]";

                    cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@wardroom", wardRoomCode.ToString());
                    cmd.Parameters.AddWithValue("@reason", cmbDescription.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@vegNonVeg", ddlVegi.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@groupType", ddlGroupMenu.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@mealItem", MealItem.Text);
                    cmd.Parameters.AddWithValue("@remark", Remarks.Text);
                    cmd.Parameters.AddWithValue("@offNo", txtOffNoList.Text);

                    if (chkPaticipation.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@isActive", 0);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isActive", 1);
                    }

                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                    cmd.Parameters.AddWithValue("@remarksNew", txtRemark.Text);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Add Menu Successfully!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }

            }

            update_T_DailyMenu();
        }

        public void update_T_DailyMenu()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {
                    RadTextBox MealID = (RadTextBox)grdMedal.Rows[i].FindControl("txtMealID");
                    RadTextBox Remarks = (RadTextBox)grdMedal.Rows[i].FindControl("txtRemarks");
                    CheckBox chkPaticipation = (CheckBox)grdMedal.Rows[i].FindControl("SelectCheckBox");

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_DailyMenuSaleBite]";

                    cmd.Parameters.AddWithValue("@id", MealID.Text);
                    cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString());
                    cmd.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedValue.ToString());
                    if (chkPaticipation.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@isActive", 0);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isActive", 1);
                    }
                    cmd.Parameters.AddWithValue("@remarks", Remarks.Text);
                    cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);


                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Update Menu Successfully!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string off = txtOfficialNo.Text;
            string OSType = ddlOfficerSailor.SelectedItem.Text.ToString();
            string ServiceType = ddlServiceType.SelectedItem.Text.ToString();

            dtOfficerSailor.Clear();

            if (OSType == "Sailor")
            {
                OS = "S";

                dtOfficerSailor = itemObject.GetAllOfficerDetails(strConnString2, OS, off);
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

                dtOfficerSailor = itemObject.GetAllOfficerDetails(strConnString2, OS, off);
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

            xx3.Clear();
            xx3 = SearchPesonalDeatailBySelectedNew(nicNo_SSID, officialNo, OS, serviceType);
            GetPersonalData(xx3);
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

        public void GetPersonalData(DataSet xy1)
        {

            DataSet personal = xy1;
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
                    lblPermanentBase.ForeColor = System.Drawing.Color.Blue;
                }
                else
                {
                    lblPermanentBase.Text = "No Data";
                }

                if (0 < (personal.Tables[13].Rows.Count))
                {
                    lblIsActive.Text = personal.Tables[13].Rows[0]["isActive"].ToString();
                    lblIsActive.ForeColor = System.Drawing.Color.Blue;
                }
                else
                {
                    lblIsActive.Text = "No Data";
                }
            }



        }

    }
}