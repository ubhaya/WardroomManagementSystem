﻿using System;
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
    public partial class ChangeMenuItemsByMM : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMealCategory = new DataTable();
        public static DataTable dtUpdateSportsGrid = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtAuthorizedMenu = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
     

        public static String wardRoomName, wardRoomCode;
        public static int countval = 0;

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


        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("MealId", typeof(string)));
            dt.Columns.Add(new DataColumn("MealCat", typeof(string)));
            dt.Columns.Add(new DataColumn("MealItem", typeof(string)));
            dt.Columns.Add(new DataColumn("Remarks", typeof(string)));



            if (dtAuthorizedMenu.Rows.Count <= 1)
            {
                dr = dt.NewRow();

                dr["MealId"] = string.Empty;
                dr["MealCat"] = string.Empty;
                dr["MealItem"] = string.Empty;
                dr["Remarks"] = string.Empty;

                dt.Rows.Add(dr);
            
            }
            else 
            {
                for (int x = 0; dtAuthorizedMenu.Rows.Count > x; x++)
                {
                    dr = dt.NewRow();

                    dr["MealId"] = string.Empty;
                    dr["MealCat"] = string.Empty;
                    dr["MealItem"] = string.Empty;
                    dr["Remarks"] = string.Empty;

                    dt.Rows.Add(dr);
                }
            }
           
            
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

        public void getMenuReason()
        {
            dtMenuReason = itemObject.GetManuReason(strConnString);
            cmbDescription.DataSource = dtMenuReason;

            cmbDescription.DataTextField = "reason";
            cmbDescription.DataValueField = "reasonCode";
            cmbDescription.DataBind();
            cmbDescription.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtWardroom = itemObject.GetWardroom(strConnString);
            //ddlWardroom.DataSource = dtWardroom;

            txtWardRoom.Text = wardRoomName.ToString();

            dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            ddlGroupMenu.DataSource = dtGroupMenuNew;

            ddlGroupMenu.DataTextField = "GroupMenu";
            ddlGroupMenu.DataValueField = "GroupMenuCode";
            ddlGroupMenu.DataBind();

            //ddlWardroom.DataTextField = "wardroomName";
            //ddlWardroom.DataValueField = "wardroomCode";
            //ddlWardroom.DataBind();

            //ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            //ddlWardroom0.DataSource = dtWardroom;
            //ddlWardroom0.DataTextField = "wardroomName";
            //ddlWardroom0.DataValueField = "wardroomCode";
            //ddlWardroom0.DataBind();

            //ddlWardroom0.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            //dtMealCategory = itemObject.GetMealCategory(strConnString);
            //ddlMealCat.DataSource = dtMealCategory;

            //ddlMealCat.DataTextField = "mainItemCategory";
            //ddlMealCat.DataValueField = "mainItemCategoryCode";
            //ddlMealCat.DataBind();

            //ddlMealCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            //dtItemCat = itemObject.GetItemCatagory(strConnString);
            //ddlItemCat.DataSource = dtItemCat;

            //ddlItemCat.DataTextField = "itemCatagory";
            //ddlItemCat.DataValueField = "itemCatagoryCode";
            //ddlItemCat.DataBind();

            //ddlItemCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void btnViewMenu_Click(object sender, EventArgs e)
        {
           // SetInitialRow();
            Bind_T_DailyMenu();

        }

        public void Bind_T_DailyMenu()
        {
            if ((dateMenuDate.SelectedDate.ToString() == "") || (cmbDescription.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Date Cannot be Empty and Select Wardroom and Reason !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                string Wardroom = Session["wardRoomName"].ToString();
                wardRoomCode = Session["wardRoomCode"].ToString();

                string Description = cmbDescription.SelectedValue.ToString();

                string MenuDate = DateTime.Parse(dateMenuDate.SelectedDate.ToString()).Date.ToShortDateString();
                string[] codes = MenuDate.Split('/');
                string val = codes[2] + "-" + codes[0] + "-" + codes[1];

                string Veg = ddlVeg.SelectedValue.ToString();
                string gropMenu = ddlGroupMenu.SelectedValue.ToString();

                dtAuthorizedMenu.Clear();

               // dtAuthorizedMenu = itemObject.GetAuthorizedMenu(strConnString, MenuDate, Description, Wardroom);
                dtAuthorizedMenu = itemObject.GetAuthorizedMenu(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), Session["wardRoomCode"].ToString(), ddlGroupMenu.SelectedValue.ToString(), ddlVeg.SelectedValue.ToString());


                if (dtAuthorizedMenu.Rows.Count > 0)
                {
                    Session["ss"] = dtAuthorizedMenu;
                   // bindserchdatagv();

                }
                else
                {
                    lblError.Text = "No data found";
                    lblError.ForeColor = System.Drawing.Color.Red;

                }
            }

            int k = 0;

          //  dtAuthorizedMenu = itemObject.GetAuthorizedMenu(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), ddlWardroom.SelectedValue.ToString());
            SetInitialRow();
            
            
            if (dtAuthorizedMenu.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtAuthorizedMenu.Rows)
                {

                    string MealID = row[3].ToString();
                    string MealCat = row[1].ToString();
                    string MealItem = row[2].ToString();

                    RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtMealID");
                    RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtMealCategory");
                    RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtMealItem");

                    t.Text = MealID;
                    t1.Text = MealCat;
                    t2.Text = MealItem;

                    k++;
                }

            }
        }

        public void bindserchdatagv()
        {
            //DateTime SignalRefDate = Convert.ToDateTime(dateMenuDate.SelectedDate.ToString());
            //dtUpdateSportsGrid.Clear();
            dtAuthorizedMenu = itemObject.GetAuthorizedMenu(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), Session["wardRoomName"].ToString(), ddlGroupMenu.SelectedValue.ToString(), ddlVeg.SelectedValue.ToString());

            if (dtAuthorizedMenu.Rows.Count > 0)
            {
                grdMedal.DataSource = dtAuthorizedMenu;
                grdMedal.DataBind();
            }
        }

        protected void btnAddMenuItem_Click(object sender, EventArgs e)
        {
            AddMenuItem_T_DailyMenu();
            Bind_T_DailyMenu();
        }


        public void AddMenuItem_T_DailyMenu()
        {
            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = con;

            ////for (int i = 0; i < grdMedal.Rows.Count; i++)
            ////{
            //try
            //{
            //    con.Open();
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.CommandText = "[VICTULING_Save_DailyMenuItems]";

            //    cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate);
            //    cmd.Parameters.AddWithValue("@mealCategory", ddlMealCat.SelectedValue.ToString());
            //    cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
            //    cmd.Parameters.AddWithValue("@mainItemCode", ddlMeal.SelectedValue.ToString());
            //    cmd.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());

            //    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
            //    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
            //    cmd.Parameters.AddWithValue("@isAuthorized", 0);

            //    cmd.ExecuteNonQuery();
            //    cmd.Parameters.Clear();
            //    con.Close();
            //    lblError.Visible = true;

            //    lblError.Text = "Insert Menu Item to List!";
            //    lblError.ForeColor = System.Drawing.Color.Green;


            //}

            //catch (Exception ex)
            //{
            //    //lbl_Errormsg.Visible = true;
            //    //lbl_Errormsg.Text = ex.Message;
            //}

        }

        protected void ddlMeal_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void ddlMealCat_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
        //    VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
        //    string itemValue = ddlMealCat.Text;
        //    DataTable Entrydt1 = tt.GetMealItemByCate(itemValue, strConnString);
        //    ddlMeal.DataSource = Entrydt1;
        //    ddlMeal.DataTextField = "mainItem";
        //    ddlMeal.DataValueField = "mainItemCode";
        //    ddlMeal.DataBind();
        //    ddlMeal.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void cmbDescription_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grdMedal_SelectedIndexChanged(object sender, EventArgs e)
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
                    RadTextBox curryType = (RadTextBox)grdMedal.Rows[i].FindControl("txtRemarks");
                    RadTextBox mealID = (RadTextBox)grdMedal.Rows[i].FindControl("txtMealID");
                    CheckBox chkPaticipation = (CheckBox)grdMedal.Rows[i].FindControl("SelectCheckBox");

                    //if (curryType.Text != "")
                    //{
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_DailyMenu]";

                    cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@mainItemCode", mealID.Text);
                    cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                    cmd.Parameters.AddWithValue("@remarks", curryType.Text);
                    if (chkPaticipation.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@isActive", 0);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isActive", 1);
                    }
                    cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

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
        }
    }
}