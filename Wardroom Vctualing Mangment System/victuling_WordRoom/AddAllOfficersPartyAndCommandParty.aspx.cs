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
    public partial class AddAllOfficersPartyAndCommandParty : System.Web.UI.Page
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
        public static DataTable dtGetExItemsIndividual = new DataTable();
        public static DataTable dtGetSaleItemsQty_Indi = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtMealCategory = new DataTable();
        public static DataTable dtUpdateSportsGrid = new DataTable();
        public static DataTable dtArea = new DataTable();
        public static DataTable dtOfficerCount = new DataTable();

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
                //SetInitialRow1();
            }
        }

        public void LoadBasic()
        {

            dtItemCat = itemObject.GetItemCatagory(strConnString);
            ddlItemCat.DataSource = dtItemCat;

            ddlItemCat.DataTextField = "itemCatagory";
            ddlItemCat.DataValueField = "itemCatagoryCode";
            ddlItemCat.DataBind();

            ddlItemCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            ddlGroupMenu.DataSource = dtGroupMenuNew;

            ddlGroupMenu.DataTextField = "GroupMenu";
            ddlGroupMenu.DataValueField = "GroupMenuCode";
            ddlGroupMenu.DataBind();
            ddlGroupMenu.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            txtWardRoom.Text = Session["wardRoomName"].ToString();

            dtMenuReason = itemObject.GetManuReason(strConnString);
            cmbDescription.DataSource = dtMenuReason;

            cmbDescription.DataTextField = "reason";
            cmbDescription.DataValueField = "reasonCode";
            cmbDescription.DataBind();
            cmbDescription.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtArea = itemObject.GetArea(strConnString);
            ddlArea.DataSource = dtArea;

            ddlArea.DataTextField = "areaName";
            ddlArea.DataValueField = "areaCode";
            ddlArea.DataBind();

            ddlArea.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            ddlArea.Items.Insert(1, new RadComboBoxItem("All Officers", "1"));
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

        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("ItemCode", typeof(string)));
            dt.Columns.Add(new DataColumn("Item", typeof(string)));
            dt.Columns.Add(new DataColumn("From", typeof(string)));
            dt.Columns.Add(new DataColumn("Price", typeof(string)));
            dt.Columns.Add(new DataColumn("OnChargeQty", typeof(string)));
            dt.Columns.Add(new DataColumn("SaleQty", typeof(string)));
            dt.Columns.Add(new DataColumn("CurrentQty", typeof(string)));

            dr = dt.NewRow();

            dr["ItemCode"] = string.Empty;
            dr["Item"] = string.Empty;
            dr["From"] = string.Empty;
            dr["Price"] = string.Empty;
            dr["OnChargeQty"] = string.Empty;
            dr["SaleQty"] = string.Empty;
            dr["CurrentQty"] = string.Empty;


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
                        RadTextBox box3 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[3].FindControl("txtFrom");
                        RadTextBox box4 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[3].FindControl("txtPrice");
                        RadTextBox box5 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("txtOnChargeQty");
                        RadTextBox box6 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[5].FindControl("txtSaleQty");
                        RadTextBox box7 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[6].FindControl("txtCurrentQty");


                        drCurrentRow = dtCurrentTable.NewRow();

                        drCurrentRow["ItemCode"] = box1.Text;
                        drCurrentRow["Item"] = box2.Text;
                        drCurrentRow["From"] = box3.Text;
                        drCurrentRow["Price"] = box4.Text;
                        drCurrentRow["OnChargeQty"] = box5.Text;
                        drCurrentRow["SaleQty"] = box6.Text;
                        drCurrentRow["CurrentQty"] = box7.Text;


                        rowIndex++;
                    }

                    dtCurrentTable.Rows.Add(drCurrentRow);
                    for (int i = 1; i < countval - 1; i++)
                    {
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["ItemCode"] = string.Empty;
                        drCurrentRow["Item"] = string.Empty;
                        drCurrentRow["From"] = string.Empty;
                        drCurrentRow["Price"] = string.Empty;
                        drCurrentRow["OnChargeQty"] = string.Empty;
                        drCurrentRow["SaleQty"] = string.Empty;
                        drCurrentRow["CurrentQty"] = string.Empty;

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
                        RadTextBox box3 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[3].FindControl("txtFrom");
                        RadTextBox box4 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[3].FindControl("txtPrice");
                        RadTextBox box5 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("txtOnChargeQty");
                        RadTextBox box6 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[5].FindControl("txtSaleQty");
                        RadTextBox box7 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[6].FindControl("txtCurrentQty");


                        box1.Text = dt.Rows[i]["ItemCode"].ToString();
                        box2.Text = dt.Rows[i]["Item"].ToString();
                        box3.Text = dt.Rows[i]["From"].ToString();
                        box4.Text = dt.Rows[i]["Price"].ToString();
                        box5.Text = dt.Rows[i]["OnChargeQty"].ToString();
                        box6.Text = dt.Rows[i]["SaleQty"].ToString();
                        box7.Text = dt.Rows[i]["CurrentQty"].ToString();


                        rowIndex++;
                    }
                }
            }
        }

        protected void ddlItem_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if ((dateMenuDate.SelectedDate.ToString() == "") || (cmbDescription.SelectedItem.Text == "---Select---") || (ddlItemCat.SelectedItem.Text == "---Select---") || (ddlItem.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Date Cannot be Empty and Select Reason,Item Category and Item !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblError.Text = "";
                SetInitialRow();

                string Sport = ddlItem.SelectedValue.ToString();

                dtGetExItemsIndividual.Clear();

                dtGetExItemsIndividual = itemObject.GetExcItemsIndividual(strConnString, Sport);
                if (dtGetExItemsIndividual.Rows.Count > 0)
                {
                    Session["ss"] = dtGetExItemsIndividual;

                    bindserchdatagv();
                    lblError.Text = "";
                }
                else
                {
                    lblError.Text = "No data found";
                    lblError.ForeColor = System.Drawing.Color.Red;

                }
            }

            int k = 0;

            if (dtGetExItemsIndividual.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtGetExItemsIndividual.Rows)
                {

                    string itemCode = row[6].ToString();
                    string item = row[1].ToString();
                    string from = row[2].ToString();
                    string price = row[3].ToString();
                    string messu = row[5].ToString();
                    string stock = row[4].ToString();
                    string id = row[0].ToString();

                    RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtItemCode");
                    RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItem");
                    RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtFrom");
                    RadTextBox t3 = (RadTextBox)grdMedal.Rows[k].FindControl("txtPrice");
                    RadTextBox t4 = (RadTextBox)grdMedal.Rows[k].FindControl("txtMesu");
                    RadTextBox t5 = (RadTextBox)grdMedal.Rows[k].FindControl("txtOnChargeQty");
                    RadTextBox t6 = (RadTextBox)grdMedal.Rows[k].FindControl("txtID");

                    t.Text = itemCode;
                    t1.Text = item;
                    t2.Text = from;
                    t3.Text = price;
                    t4.Text = messu;
                    t5.Text = stock;
                    t6.Text = id;

                    k++;
                }

            }

            btnUpdateStock.Visible = false;
        }

        public void bindserchdatagv()
        {
            dtGetExItemsIndividual.Clear();
            dtGetExItemsIndividual = itemObject.GetExcItemsIndividual(strConnString, ddlItem.SelectedValue.ToString());

            if (dtGetExItemsIndividual.Rows.Count > 0)
            {
                grdMedal.DataSource = dtGetExItemsIndividual;
                grdMedal.DataBind();
            }
        }

        protected void btnGetHandStock_Click(object sender, EventArgs e)
        {
            lblErrorWardRoom.Text = "";

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {

                RadTextBox txtsaleQty1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty"); ;

                GridViewRow gvrow = (GridViewRow)txtsaleQty1.NamingContainer;
                int rowid = gvrow.RowIndex;
                RadTextBox txtsaleQty = (RadTextBox)grdMedal.Rows[rowid].FindControl("txtSaleQty");


                RadTextBox txtitemId1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtID");

                GridViewRow gvrow1 = (GridViewRow)txtitemId1.NamingContainer;
                int rowid1 = gvrow1.RowIndex;
                RadTextBox txtitemId = (RadTextBox)grdMedal.Rows[rowid1].FindControl("txtID");

                dtGetSaleItemsQty.Clear();
                dtGetSaleItemsQty = itemObject.GetSaleItemsQty(strConnString, ddlItem.SelectedValue.ToString(), txtsaleQty.Text, txtitemId.Text);


                RadTextBox txtCurrentQty1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");
                txtCurrentQty1.Text = dtGetSaleItemsQty.Rows[0][7].ToString();
                GridViewRow gvrow2 = (GridViewRow)txtitemId1.NamingContainer;
                int rowid2 = gvrow1.RowIndex;
                RadTextBox txtCurrentQty = (RadTextBox)grdMedal.Rows[rowid2].FindControl("txtCurrentQty");



            }

            GetTotalCurrentStock();
            btnUpdateStock.Visible = true;
        }

        protected void linkbtnTotalCurrentStock_Click(object sender, EventArgs e)
        {
            //GetTotalCurrentStock();
        }

        public void GetTotalCurrentStock()
        {

            decimal sum = 0;
            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {

                RadTextBox txtCurrentQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");

                if (txtCurrentQty.Text != "")
                {
                    sum += decimal.Parse(txtCurrentQty.Text);

                }

                else
                {
                    lblErrorCurrent.Text = "First Click on 'Get Hand Stock' button !";
                    lblErrorCurrent.ForeColor = System.Drawing.Color.Red;
                }

            }

            lblCurrent.Text = sum.ToString();
            lblCurrent.ForeColor = System.Drawing.Color.Blue;

        }

        protected void btnUpdateStock_Click(object sender, EventArgs e)
        {

            update_T_stock_Table();
            update_T_StockQty_Table();
            insert_T_DailyMenuSales();

            ViewSaleMenuItem();

            GetTotalMenuCost();
        }

        public void update_T_stock_Table()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_Stock]";


                    RadTextBox Id = (RadTextBox)grdMedal.Rows[i].FindControl("txtID");
                    RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");
                    RadTextBox recFrom = (RadTextBox)grdMedal.Rows[i].FindControl("txtFrom");
                    RadTextBox unitPrice = (RadTextBox)grdMedal.Rows[i].FindControl("txtPrice");
                    RadTextBox currenyQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");


                    cmd.Parameters.AddWithValue("@itemId", Id.Text);
                    cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
                    //cmd.Parameters.AddWithValue("@recevedFrom", recFrom.Text);
                    //cmd.Parameters.AddWithValue("@unitPrice", unitPrice.Text);
                    cmd.Parameters.AddWithValue("@CurrentQty", currenyQty.Text);

                    cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Update Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }
            }
        }

        public void update_T_StockQty_Table()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_StockQty]";


                    RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");
                    RadTextBox SaleQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty");
                    //RadTextBox Id = (RadTextBox)grdMedal.Rows[i].FindControl("txtID");
                    //RadTextBox recFrom = (RadTextBox)grdMedal.Rows[i].FindControl("txtFrom");
                    //RadTextBox unitPrice = (RadTextBox)grdMedal.Rows[i].FindControl("txtPrice");
                    //RadTextBox currenyQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");

                    cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
                    cmd.Parameters.AddWithValue("@currentStock", SaleQty.Text);
                    cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

                    cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Update Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }
            }
        }

        public void insert_T_DailyMenuSales()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {
                    RadTextBox saleQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty");
                    RadTextBox unitPrice = (RadTextBox)grdMedal.Rows[i].FindControl("txtPrice");
                    RadTextBox recFrom = (RadTextBox)grdMedal.Rows[i].FindControl("txtFrom");
                    RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");

                    Double cost = ((Convert.ToDouble(saleQty.Text)) * (Convert.ToDouble(unitPrice.Text)));


                    if (saleQty.Text != "")
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_insert_T_DailyMenuSales_Party]";

                        cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                        cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
                        cmd.Parameters.AddWithValue("@saleQty", saleQty.Text);
                        cmd.Parameters.AddWithValue("@unitPrice", unitPrice.Text);
                        cmd.Parameters.AddWithValue("@price", cost);
                        cmd.Parameters.AddWithValue("@recevedFrom", recFrom.Text);
                        cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());
                        cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedValue.ToString());

                        cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                        cmd.Parameters.AddWithValue("@partyName", txtPartyName.Text);
                        cmd.Parameters.AddWithValue("@menuType", ddlGroupMenu.SelectedValue.ToString());

                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        con.Close();
                        lblError.Visible = true;

                        lblError.Text = "Update Success!";
                        lblError.ForeColor = System.Drawing.Color.Green;


                    }
                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }

            }
        }


        public void ViewSaleMenuItem()
        {
            //lblDate.Visible = true;
            //lblReason.Visible = true;


            if (dateMenuDate.SelectedDate != null)
            {
                DateTime dat = Convert.ToDateTime(dateMenuDate.SelectedDate.ToString());
                lblDate.Text = dat.ToString("yyyy-MM-dd");
            }

            lblReason.Text = cmbDescription.SelectedItem.Text;

            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMenuItemList_OnDate_party]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateMenuDate.SelectedDate);
            command.Parameters.AddWithValue("@reason", cmbDescription.SelectedValue.ToString());
            command.Parameters.AddWithValue("@vegi", ddlVegi.SelectedItem.Text);
            command.Parameters.AddWithValue("@menuType", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
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

        public void GetTotalMenuCost()
        {
            string date = dateMenuDate.SelectedDate.ToString();
            string reasonCode = cmbDescription.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();
            string vegi = ddlVegi.SelectedItem.Text;
            string menuType = ddlGroupMenu.SelectedValue.ToString();

            dtTotalMenuCost = itemObject.GetTotalMenuCostParty(strConnString, date, reasonCode, wardroomCode, vegi, menuType);

            if (dtTotalMenuCost.Rows.Count > 0)
            {
                Session["ss"] = dtTotalMenuCost;
                Publishdata(dtTotalMenuCost, date, reasonCode, wardroomCode, vegi, menuType);
            }
        }

        public void Publishdata(DataTable one, string date, string reasonCode, string wardroomCode, string vegi, string menuType)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchTotalMEnuCost(date, reasonCode, wardroomCode, vegi, menuType);

            GetTotalCost(xx);
        }

        private DataSet SearchTotalMEnuCost(string date, string reasonCode, string wardroomCode, string vegi, string menuType)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetTotalMenuCost_Party]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;
            cmd.Parameters.Add("@vegi", SqlDbType.VarChar).Value = vegi;
            cmd.Parameters.Add("@menuType", SqlDbType.VarChar).Value = menuType;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetTotalCost(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                     lblTotalCost.Text = personal.Tables[0].Rows[0]["totalCost"].ToString();
                }
                else
                {
                    lblTotalCost.Text = "No Data";
                }

            }
        }

        protected void ddlArea_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            GetTotalOfficersCount();
        }

        public void GetTotalOfficersCount()
        {

            string area = ddlArea.SelectedValue.ToString();


            dtOfficerCount = itemObject.GetAreaOfficerCount(strConnString, area);

            if (dtOfficerCount.Rows.Count > 0)
            {
                Session["ss"] = dtTotalMenuCost;
                PublishdataOff(dtOfficerCount, area);
            }
        }

        public void PublishdataOff(DataTable one, string area)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchTotalAreaCount(area);

            GetTotalAreaCount(xx);
        }

        private DataSet SearchTotalAreaCount(string area)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetPartContributionHeadCount]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@areaCode", SqlDbType.VarChar).Value = area;


            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetTotalAreaCount(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblNoOfOfficers.Text = personal.Tables[0].Rows[0]["offCount"].ToString();
                }
                else
                {
                    lblNoOfOfficers.Text = "No Data";
                }

                if (0 < (personal.Tables[1].Rows.Count))
                {
                    String branch = "";
                    for (int i = 0; i < personal.Tables[1].Rows.Count; i++)
                    {
                        branch = personal.Tables[1].Rows[i]["officialNo"].ToString() + "," + branch;
                    }


                    txtOffNoList.Text = branch;
                }
                else
                {
                    lblEligibleBranch.Text = "No Data";
                }

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            

            if (lblNoOfOfficers.Text != "")
            {

                //int noOfPerson = int.Parse(lblNoOfOfficers.ToString());
                double noOfPerson = System.Double.Parse(lblNoOfOfficers.Text);
                double totalCost = System.Double.Parse(lblPartyCost.Text);

                double CostPerHead = (totalCost / noOfPerson);
                lblCostPerHead.Text = CostPerHead.ToString();


            }

            else
            {
                lblMsg.Text = "Get Officers Count s!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnSavePartyCost_Click(object sender, EventArgs e)
        {
            if (lblCostPerHead.Text != "")
            {
                if (!string.IsNullOrEmpty(txtOffNoList.Text))
                {
                    List<string> offNOList = txtOffNoList.Text.Split(',').Reverse().ToList();
                    if (offNOList.Count > 0)
                    {
                        for (int x = 0; x < offNOList.Count; x++)
                        {
                            int offNo = int.Parse(offNOList[x]);


                            insert_T_DailyExtraSales(offNo.ToString(), int.Parse(offNOList.Count.ToString()));


                            lblError.Text = "Updation Successful";
                            lblError.ForeColor = System.Drawing.Color.Green;
                        }

                        offNOList.Clear();
                    }

                    lblError.Text = "Updation Successful";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMsg.Text = "Enter Official Number/s";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        public void insert_T_DailyExtraSales(string offNo, int officerCount)
        {
            if ((txtOffNoList.Text != "") && (lblCostPerHead.Text != ""))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;


                try
                {

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_insert_T_PartyCostByIndividual]";

                    cmd.Parameters.AddWithValue("@partyDate", dateMenuDate.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    cmd.Parameters.AddWithValue("@reason", cmbDescription.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@groupType", ddlGroupMenu.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@veg", ddlVegi.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@totalMenuCost", lblTotalCost.Text);

                    int a = 0;

                    if (!string.IsNullOrEmpty(txtOffNoList.Text))
                    {
                        List<string> offNOList = txtOffNoList.Text.Split(',').Reverse().ToList();
                        if (offNOList.Count > 0)
                        {
                            for (int x = 0; x < offNOList.Count; x++)
                            {
                                //offNo = int.Parse(offNOList[x]);
                                a = int.Parse(offNOList.Count.ToString());

                            }
                        }
                    }

                    int noOfPerson = int.Parse(a.ToString());

                    cmd.Parameters.AddWithValue("@noOfPerson", noOfPerson);
                    cmd.Parameters.AddWithValue("@perHeadCost", lblCostPerHead.Text);
                    cmd.Parameters.AddWithValue("@offNo", offNo);
                    cmd.Parameters.AddWithValue("@OS", "O");
                    cmd.Parameters.AddWithValue("@partyName", txtPartyName.Text);

                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblMsg.Text = "Save Success!";
                    lblMsg.ForeColor = System.Drawing.Color.Green;



                }

                catch (Exception ex)
                {

                }
            }

            else
            {
                lblMsg.Text = "First Enter Official Numbers,After that Calculate Cost Per Head!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["transID"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[T_DailyMenuSales] WHERE [transID] = '" + int.Parse(id) + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblError.Text = "Delete Successfull";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex) { }


                ////Update T_StockQty table

                string itemCode = x["itemCode"].Text.ToString();
                string qty = x["saleQty"].Text.ToString();
                string recFrom = x["recevedFrom"].Text.ToString();
                string itemId = x["transID"].Text.ToString();

                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_StockQty_forMenuSale]";

                    cmd.Parameters.AddWithValue("@itemCode", itemCode);
                    cmd.Parameters.AddWithValue("@currentStock", qty);
                    cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

                    cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Update Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }



                ////Update T_Stock table

                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_Stock_forMenuSale]";

                    cmd.Parameters.AddWithValue("@itemId", itemId);
                    cmd.Parameters.AddWithValue("@itemCode", itemCode);
                    cmd.Parameters.AddWithValue("@currentStock", qty);
                    cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());
                    cmd.Parameters.AddWithValue("@recevedFrom", recFrom);

                    cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Update Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }


            }

            ViewSaleMenuItem();
            GetTotalMenuCost();
            UpdateTotalCost();
        }

        public void UpdateTotalCost()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            try
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Update_TotalMenuCost]";

                cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                cmd.Parameters.AddWithValue("@reason", cmbDescription.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@totalCost", lblTotalCost.Text);
                cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@lastModifiedUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@lastModifiedDate", System.DateTime.Now);

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                lblMsg.Visible = true;

                lblMsg.Text = "Update Success!";
                lblMsg.ForeColor = System.Drawing.Color.Green;

            }

            catch (Exception ex)
            {
                //lbl_Errormsg.Visible = true;
                //lbl_Errormsg.Text = ex.Message;
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (txtOffNoList.Text != "")
            {
                lblMsg.Text = "";
                int a = 0;

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                if (!string.IsNullOrEmpty(txtOffNoList.Text))
                {
                    List<string> offNOList = txtOffNoList.Text.Split(',').Reverse().ToList();
                    if (offNOList.Count > 0)
                    {
                        for (int x = 0; x < offNOList.Count; x++)
                        {
                            int offNo = int.Parse(offNOList[x]);
                            a = int.Parse(offNOList.Count.ToString());

                        }
                    }
                }

                int noOfPerson = int.Parse(a.ToString());
                lblNoOfOfficers.Text = noOfPerson.ToString();
                //double totalCost = System.Double.Parse(lblTotalCost.Text);

                //double CostPerHead = (totalCost / noOfPerson);
                //lblCostPerHead.Text = CostPerHead.ToString();


            }

            else
            {
                lblMsg.Text = "Enter Official Numbers !";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void lnkGetCostForParty_Click(object sender, EventArgs e)
        {

            if (txtDiscount.Text != "")
            {
                double totalcost = System.Double.Parse(lblTotalCost.Text);
                double discount = System.Double.Parse(txtDiscount.Text);
                //double partyCost = System.Double.Parse(lblPartyCost.Text);

                double CostForParty = (totalcost - discount);
                lblPartyCost.Text = CostForParty.ToString();

            }

            else
            {
                double totalcost = System.Double.Parse(lblTotalCost.Text);
                double discount = 0.00;
               
                double CostForParty = (totalcost - discount);
                lblPartyCost.Text = CostForParty.ToString();
            }

                        //lblTotalCost.Text = personal.Tables[0].Rows[0]["totalCost"].ToString();
        }
    }
}