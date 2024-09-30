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
    public partial class itemListByCA : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtNonVegetarian = new DataTable();
        public static DataTable dtVegetarian = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtUpdateMenuItemList = new DataTable();

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();
        public static DataSet countNVeg = new DataSet();

        public static int countval = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

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
            ddlWardroom.DataSource = dtWardroom;

            ddlWardroom.DataTextField = "wardroomName";
            ddlWardroom.DataValueField = "wardroomCode";
            ddlWardroom.DataBind();

            ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

    
            dtItemCat = itemObject.GetItemCatagory(strConnString);
            ddlItemCat.DataSource = dtItemCat;

            ddlItemCat.DataTextField = "itemCatagory";
            ddlItemCat.DataValueField = "itemCatagoryCode";
            ddlItemCat.DataBind();

            ddlItemCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("ItemCode", typeof(string)));
            dt.Columns.Add(new DataColumn("Item", typeof(string)));
            dt.Columns.Add(new DataColumn("Cqty", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
            dt.Columns.Add(new DataColumn("Measurement", typeof(string)));
            

            dr = dt.NewRow();

            dr["ItemCode"] = string.Empty;
            dr["Item"] = string.Empty;
            dr["Cqty"] = string.Empty;
            dr["Quantity"] = string.Empty;
            dr["Measurement"] = string.Empty;

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

                        RadTextBox box1 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[1].FindControl("txtItemCode");
                        RadTextBox box2 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[2].FindControl("txtItem");
                        RadTextBox box3 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("txtQty");
                        RadTextBox box4 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[3].FindControl("txtQuantity");                      
                        RadComboBox box5 = (RadComboBox)grdMedal.Rows[rowIndex].Cells[5].FindControl("cmbmeasurement");

                        drCurrentRow = dtCurrentTable.NewRow();

                        drCurrentRow["ItemCode"] = box1.Text;
                        drCurrentRow["Item"] = box2.Text;
                        drCurrentRow["Cqty"] = box3.Text;
                        drCurrentRow["Quantity"] = box4.Text;
                        drCurrentRow["Measurement"] = box5.Text;

                        rowIndex++;
                    }

                    dtCurrentTable.Rows.Add(drCurrentRow);
                    for (int i = 1; i < countval - 1; i++)
                    {
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["ItemCode"] = string.Empty;
                        drCurrentRow["Item"] = string.Empty;
                        drCurrentRow["Cqty"] = string.Empty;
                        drCurrentRow["Quantity"] = string.Empty;
                        drCurrentRow["Measurement"] = string.Empty;

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
                        RadTextBox box1 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[1].FindControl("txtItemCode");
                        RadTextBox box2 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[2].FindControl("txtItem");
                        RadTextBox box3 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[2].FindControl("txtQty");
                        RadTextBox box4 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("txtQuantity");
                        RadComboBox box5 = (RadComboBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("cmbmeasurement");

                        box1.Text = dt.Rows[i]["ItemCode"].ToString();
                        box2.Text = dt.Rows[i]["Item"].ToString();
                        box3.Text = dt.Rows[i]["Cqty"].ToString();
                        box4.Text = dt.Rows[i]["Quantity"].ToString();
                        box5.Text = dt.Rows[i]["Measurement"].ToString();



                        rowIndex++;
                    }
                }
            }
        }


        protected void btnVewMenu_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyProperMenu]";

            command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());
            command.Parameters.AddWithValue("@vegiNonVegi", ddlWardroom.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();

            getNonVegList();
            getVegList();

        }

        public void getNonVegList()
        {
            string date = dateSelected.SelectedDate.ToString();
            string reasonCode = cmbDescription.SelectedValue.ToString();
            string wardroomCode = ddlWardroom.SelectedValue.ToString();

            dtNonVegetarian = itemObject.GetNonVegiCount(strConnString, date, reasonCode, wardroomCode);

            if (dtNonVegetarian.Rows.Count > 0)
            {
                Session["ss"] = dtNonVegetarian;
                Publishdata(dtNonVegetarian, date, reasonCode, wardroomCode);
            }
        }

        public void getVegList()
        {
            string date = dateSelected.SelectedDate.ToString();
            string reasonCode = cmbDescription.SelectedValue.ToString();
            string wardroomCode = ddlWardroom.SelectedValue.ToString();

            dtVegetarian = itemObject.GetVegiCount(strConnString, date, reasonCode, wardroomCode);

            if (dtVegetarian.Rows.Count > 0)
            {
                Session["ss"] = dtVegetarian;
                PublishdataVegi(dtVegetarian, date, reasonCode, wardroomCode);
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

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            saveItemList();
            bindItemList();
        
        }

        public void bindItemList()
        {
            if ((ddlWardroom.SelectedItem.Text == "---Select---") || (dateSelected.SelectedDate.ToString() == "") || (cmbDescription.SelectedItem.Text == "---Select---") || (ddlVegi.SelectedItem.Text == "---Select---"))
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

                string MenuDate = DateTime.Parse(dateSelected.SelectedDate.ToString()).Date.ToShortDateString();
                string[] codes = MenuDate.Split('/');
                string val = codes[2] + "-" + codes[0] + "-" + codes[1];
                string vegi = ddlVegi.SelectedItem.Text;

                dtUpdateMenuItemList.Clear();

                dtUpdateMenuItemList = itemObject.GetMenuItemList(strConnString, MenuDate, Description, Wardroom, vegi);
                if (dtUpdateMenuItemList.Rows.Count > 0)
                {
                    Session["ss"] = dtUpdateMenuItemList;
                    bindserchdatagv();

                }
                else
                {
                    lblError.Text = "No data found";
                    lblError.ForeColor = System.Drawing.Color.Red;

                }
            }

            int k = 0;

            dtUpdateMenuItemList = itemObject.GetMenuItemList(strConnString, dateSelected.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), ddlWardroom.SelectedValue.ToString(), ddlVegi.SelectedItem.Text);
            if (dtUpdateMenuItemList.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtUpdateMenuItemList.Rows)
                {

                    string MealID = row[0].ToString();
                    string MealCat = row[1].ToString();
                    string MealQty = row[2].ToString();
                    string Messurment = row[3].ToString();
                    string Qty = row[4].ToString();

                    RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtItemCode");
                    RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItem");
                    RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtQty");
                    RadComboBox t3 = (RadComboBox)grdMedal.Rows[k].FindControl("cmbmeasurement");
                    RadTextBox t4 = (RadTextBox)grdMedal.Rows[k].FindControl("txtQuantity");

                    t.Text = MealID;
                    t1.Text = MealCat;
                    t2.Text = MealQty;
                    t3.SelectedItem.Text = Messurment;
                    t4.Text = Qty;

                    k++;
                }

            }
        }

        public void bindserchdatagv()
        {
            //DateTime SignalRefDate = Convert.ToDateTime(dateMenuDate.SelectedDate.ToString());
            //dtUpdateSportsGrid.Clear();
            dtUpdateMenuItemList = itemObject.GetMenuItemList(strConnString, dateSelected.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), ddlWardroom.SelectedValue.ToString(), ddlVegi.SelectedItem.Text);

            if (dtUpdateMenuItemList.Rows.Count > 0)
            {
                grdMedal.DataSource = dtUpdateMenuItemList;
                grdMedal.DataBind();
            }
        }

        public void saveItemList()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            //for (int i = 0; i < grdMedal.Rows.Count; i++)
            //{
            try
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Save_DailyMenuItemList]";


                cmd.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
                cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@wardroom", ddlWardroom.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@isActive", 1);

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

        protected void ddlItemCat_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string itemValue = ddlItemCat.Text;
            DataTable Entrydt1 = tt.GetItemByCate(itemValue, strConnString);
            ddlItem.DataSource = Entrydt1;
            ddlItem.DataTextField = "item";
            ddlItem.DataValueField = "itemCode";
            ddlItem.DataBind();
            ddlItem.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void btnViewStock_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_ViewStockItem]";

            command.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[0];

            grdReport0.DataBind();

            con.Close();
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

        protected void grdReport0_ItemCommand(object sender, GridCommandEventArgs e)
        {

        }

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
            //Add Position
            SqlConnection con = new SqlConnection(strConnString);
            DataSet ItemMessurment = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();
            SqlCommand sqlcmd = new SqlCommand();
            try
            {
                sqlcmd.Connection = con;
                con.Open();
                //sqlcmd.Parameters.AddWithValue("@Action", "3");
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "[VICTULING_GetItemMessurment]";
                sqlcmd.ExecuteNonQuery();
                sqlda.SelectCommand = sqlcmd;
                sqlda.Fill(ItemMessurment);
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadComboBox Messurment = (RadComboBox)e.Row.FindControl("cmbmeasurement");
                Messurment.DataSource = ItemMessurment.Tables[0];
                Messurment.DataTextField = "itemMessurment";
                Messurment.DataValueField = "itemMessurmentCode";
                Messurment.DataBind();
                Messurment.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            }
        }

        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grdMedal_SelectedIndexChanged(object sender, EventArgs e)
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
                    RadTextBox ItemCode = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");
                    RadTextBox Quantity = (RadTextBox)grdMedal.Rows[i].FindControl("txtQuantity");
                    RadComboBox measurement = (RadComboBox)grdMedal.Rows[i].FindControl("cmbmeasurement");
                    CheckBox chkPaticipation = (CheckBox)grdMedal.Rows[i].FindControl("SelectCheckBox");

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_MenuListItem]";

                    cmd.Parameters.AddWithValue("@date", dateSelected.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@itemCode", ItemCode.Text);
                    cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@wardroom", ddlWardroom.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue ("@qty",Quantity.Text);
                    cmd.Parameters.AddWithValue("@messurment", measurement.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedItem.Text);

                    if (chkPaticipation.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@isActive", 0);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isActive", 1);
                    }

                    cmd.Parameters.AddWithValue("@lastModifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastModifiedDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Add Menu Items Successfully!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }

            }
        }

        protected void ddlItem_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void ddlWardroom_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {

        }
    }
}