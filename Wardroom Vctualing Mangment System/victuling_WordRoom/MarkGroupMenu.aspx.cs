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
    public partial class MarkGroupMenu : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMealCategory = new DataTable();
        public static DataTable dtUpdateSportsGrid = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGroupMenu = new DataTable();
        public static DataTable dtGroupMenuAll = new DataTable();

        public static int countval = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            if (!IsPostBack)
            {
                getMenuReason();
                
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
            ddlWardroom.DataSource = dtWardroom;

            ddlWardroom.DataTextField = "wardroomName";
            ddlWardroom.DataValueField = "wardroomCode";
            ddlWardroom.DataBind();

            ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            //ddlWardroom0.DataSource = dtWardroom;
            //ddlWardroom0.DataTextField = "wardroomName";
            //ddlWardroom0.DataValueField = "wardroomCode";
            //ddlWardroom0.DataBind();

            //ddlWardroom0.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

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

            dt.Columns.Add(new DataColumn("OfficialNo", typeof(string)));
            dt.Columns.Add(new DataColumn("ServiceType", typeof(string)));
            dt.Columns.Add(new DataColumn("MealId", typeof(string)));
            dt.Columns.Add(new DataColumn("MealCat", typeof(string)));
            dt.Columns.Add(new DataColumn("MealItem", typeof(string)));
            dt.Columns.Add(new DataColumn("Remarks", typeof(string)));

            if (dtGroupMenu.Rows.Count <= 1)
            {
                dr = dt.NewRow();

                dr["OfficialNo"] = string.Empty;
                dr["ServiceType"] = string.Empty;
                dr["MealId"] = string.Empty;
                dr["MealCat"] = string.Empty;
                dr["MealItem"] = string.Empty;
                dr["Remarks"] = string.Empty;

                dt.Rows.Add(dr);
            }

            else
            {
                for (int x = 0; dtGroupMenu.Rows.Count > x; x++)
                {
                    dr = dt.NewRow();

                    dr["OfficialNo"] = string.Empty;
                    dr["ServiceType"] = string.Empty;
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
                        RadTextBox box1 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[1].FindControl("txtOff");
                        RadComboBox box2 = (RadComboBox)grdMedal.Rows[rowIndex].Cells[2].FindControl("txtSer");
                        RadTextBox box3 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[3].FindControl("txtMealID");
                        RadTextBox box4 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("txtMealCategory");
                        RadTextBox box5 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[5].FindControl("txtMealItem");
                        RadTextBox box6 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[6].FindControl("txtRemarks");

                        drCurrentRow = dtCurrentTable.NewRow();

                        drCurrentRow["OfficialNo"] = box1.Text;
                        drCurrentRow["ServiceType"] = box2.Text;
                        drCurrentRow["MealId"] = box3.Text;
                        drCurrentRow["MealCat"] = box4.Text;
                        drCurrentRow["MealItem"] = box5.Text;
                        drCurrentRow["Remarks"] = box6.Text;

                        rowIndex++;
                    }

                    dtCurrentTable.Rows.Add(drCurrentRow);
                    for (int i = 1; i < countval - 1; i++)
                    {
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["OfficialNo"] = string.Empty;
                        drCurrentRow["ServiceType"] = string.Empty;
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
                        RadTextBox box1 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[1].FindControl("txtOff");
                        RadComboBox box2 = (RadComboBox)grdMedal.Rows[rowIndex].Cells[2].FindControl("txtSer");
                        RadTextBox box3 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[3].FindControl("txtMealID");
                        RadTextBox box4 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("txtMealCategory");
                        RadTextBox box5 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[5].FindControl("txtMealItem");
                        RadTextBox box6 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[6].FindControl("txtRemarks");

                        box1.Text = dt.Rows[i]["OfficialNo"].ToString();
                        box2.Text = dt.Rows[i]["ServiceType"].ToString();
                        box3.Text = dt.Rows[i]["MealId"].ToString();
                        box4.Text = dt.Rows[i]["MealCat"].ToString();
                        box5.Text = dt.Rows[i]["MealItem"].ToString();
                        box6.Text = dt.Rows[i]["From"].ToString();



                        rowIndex++;
                    }
                }
            }
        }

        protected void ddlMealCat_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
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

        protected void btnAddMenuItem_Click(object sender, EventArgs e)
        {
            AddMenuItem_T_GroupMenuAttendance();
            Bind_T_GroupMenuAttendance();
            Bind_T_GroupMenuAttendanceAll();
        }

        public void AddMenuItem_T_GroupMenuAttendance()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            //for (int i = 0; i < grdMedal.Rows.Count; i++)
            //{
            try
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Save_GroupMenuAttendance]";

                cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate);
                cmd.Parameters.AddWithValue("@mealCategory", ddlMealCat.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@mainItemCode", ddlMeal.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());

                cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                cmd.Parameters.AddWithValue("@isActive", 1);

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                lblError.Visible = true;

                lblError.Text = "Insert Item to List!";
                lblError.ForeColor = System.Drawing.Color.Green;


            }

            catch (Exception ex)
            {
                //lbl_Errormsg.Visible = true;
                //lbl_Errormsg.Text = ex.Message;
            }

        }

        public void Bind_T_GroupMenuAttendance()
        {
            if ((ddlWardroom.SelectedItem.Text == "---Select---") || (dateMenuDate.SelectedDate.ToString() == "") || (cmbDescription.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Date Cannot be Empty and Select Wardroom and Reason !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                SetInitialRow();

                string Wardroom = ddlWardroom.SelectedValue.ToString();
                string Description = cmbDescription.SelectedValue.ToString();

                string MenuDate = DateTime.Parse(dateMenuDate.SelectedDate.ToString()).Date.ToShortDateString();
                string[] codes = MenuDate.Split('/');
                string val = codes[2] + "-" + codes[0] + "-" + codes[1];

                dtGroupMenu.Clear();

               // dtGroupMenu = itemObject.GetGroupMenu(strConnString, MenuDate, Description, Wardroom);
                dtGroupMenu = itemObject.GetGroupMenu(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), ddlWardroom.SelectedValue.ToString());

                if (dtGroupMenu.Rows.Count > 0)
                {
                    Session["ss"] = dtGroupMenu;
                    //bindserchdatagv();

                }
                else
                {
                    lblError.Text = "No data found";
                    lblError.ForeColor = System.Drawing.Color.Red;

                }
            }

            int k = 0;

            SetInitialRow();
            //dtGroupMenu = itemObject.GetGroupMenu(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), ddlWardroom.SelectedValue.ToString());
            if (dtGroupMenu.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtGroupMenu.Rows)
                {

                    string MealID = row[2].ToString();
                    string MealCat = row[0].ToString();
                    string MealItem = row[1].ToString();

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

        public void Bind_T_GroupMenuAttendanceAll()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetAndBindGroupMenuAttendance]";

            command.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
        }

        protected void cmbDescription_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
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

        protected void ddlWardroom_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void btnSaveItem_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {
                    RadTextBox Id = (RadTextBox)grdMedal.Rows[i].FindControl("txtMealID");
                    RadTextBox offiNo = (RadTextBox)grdMedal.Rows[i].FindControl("txtOff");
                    RadComboBox serviceType = (RadComboBox)grdMedal.Rows[i].FindControl("txtSer");
                    RadTextBox remarks = (RadTextBox)grdMedal.Rows[i].FindControl("txtRemarks");
                    CheckBox isActive = (CheckBox)grdMedal.Rows[i].FindControl("SelectCheckBox");

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_GroupMenuAttendance]";

                    cmd.Parameters.AddWithValue("@id", Id.Text);
                    cmd.Parameters.AddWithValue("@offNo", offiNo.Text);
                    cmd.Parameters.AddWithValue("@serviceType", serviceType.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@remarks", remarks.Text);


                    if (isActive.Checked == true)
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

                    lblError0.Text = "Update Group Items Successfully!";
                    lblError0.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }

            }
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["id"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[T_GroupMenuAttendance] WHERE [id] = '" + int.Parse(id) + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblError.Text = "Delete Successfull";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex) { }
            }

            Bind_T_GroupMenuAttendanceAll();
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

    



    }
}