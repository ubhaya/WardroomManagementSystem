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




using System.Drawing;
using System.IO;
using System.Net;

namespace victuling_WordRoom
{
    public partial class MenuSale : System.Web.UI.Page
    {

        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItems= new DataTable();
        public static DataTable dtGetSaleItemsQty = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtTotalMenuCost = new DataTable();
        public static DataTable dtNonVegetarian = new DataTable();
        public static DataTable dtVegetarian = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
        public static DataTable dtSalebySA = new DataTable();
        public static DataTable dtGetDeductItems = new DataTable();
        public static DataTable dtGetNonVegMMEx = new DataTable();

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
                SetInitialRow();
            }

            lblDate.Visible = false;
            lblReason.Visible = false;
        }

        public void LoadBasic()
        {

            dtItemCat = itemObject.GetItemCatagory(strConnString);
            ddlItemCat.DataSource = dtItemCat;

            ddlItemCat.DataTextField = "itemCatagory";
            ddlItemCat.DataValueField = "itemCatagoryCode";
            ddlItemCat.DataBind();

            ddlItemCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtWardroom = itemObject.GetWardroom(strConnString);
            ddlWardroom.DataSource = dtWardroom;

            ddlWardroom.DataTextField = "wardroomName";
            ddlWardroom.DataValueField = "wardroomCode";
            ddlWardroom.DataBind();

            ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));


            dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            ddlGroupMenu.DataSource = dtGroupMenuNew;

            ddlGroupMenu.DataTextField = "GroupMenu";
            ddlGroupMenu.DataValueField = "GroupMenuCode";
            ddlGroupMenu.DataBind();

            txtWardRoom.Text = Session["wardRoomName"].ToString();
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
            dt.Columns.Add(new DataColumn("itemId", typeof(string)));

            dr = dt.NewRow();

            dr["ItemCode"] = string.Empty;
            dr["Item"] = string.Empty;
            dr["From"] = string.Empty;
            dr["Price"] = string.Empty;
            dr["OnChargeQty"] = string.Empty;
            dr["SaleQty"] = string.Empty;
            dr["CurrentQty"] = string.Empty;
            dr["itemId"] = string.Empty;

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
                        RadTextBox box8 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[7].FindControl("txtID");

                        drCurrentRow = dtCurrentTable.NewRow();

                        drCurrentRow["ItemCode"] = box1.Text;
                        drCurrentRow["Item"] = box2.Text;
                        drCurrentRow["From"] = box3.Text;
                        drCurrentRow["Price"] = box4.Text;
                        drCurrentRow["OnChargeQty"] = box5.Text;
                        drCurrentRow["SaleQty"] = box6.Text;
                        drCurrentRow["CurrentQty"] = box7.Text;
                        drCurrentRow["itemId"] = box8.Text;

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
                        drCurrentRow["itemId"] = string.Empty;

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
                        RadTextBox box8 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[7].FindControl("txtID");

                        box1.Text = dt.Rows[i]["ItemCode"].ToString();
                        box2.Text = dt.Rows[i]["Item"].ToString();
                        box3.Text = dt.Rows[i]["From"].ToString();
                        box4.Text = dt.Rows[i]["Price"].ToString();
                        box5.Text = dt.Rows[i]["OnChargeQty"].ToString();
                        box6.Text = dt.Rows[i]["SaleQty"].ToString();
                        box7.Text = dt.Rows[i]["CurrentQty"].ToString();
                        box8.Text = dt.Rows[i]["itemId"].ToString();

                        rowIndex++;
                    }
                }
            }
        }

        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

      

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

      
   
        protected void ddlItem_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if ((dateSaleDate.SelectedDate.ToString() == "") || (ddlReason.SelectedItem.Text == "---Select---") || (ddlItemCat.SelectedItem.Text == "---Select---") || (ddlItem.SelectedItem.Text == "---Select---"))
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

                dtGetExItems.Clear();

                dtGetExItems = itemObject.GetExcItems(strConnString, Sport);
                if (dtGetExItems.Rows.Count > 0)
                {
                    Session["ss"] = dtGetExItems;
                
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

            if (dtGetExItems.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtGetExItems.Rows)
                {
              
                    string itemCode = row[4].ToString();
                    string item = row[0].ToString();
                    string from = row[1].ToString();
                    string price = row[2].ToString();
                    string messu = row[3].ToString();
                    string stock = row[5].ToString();
                   
                    
                    RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtItemCode");
                    RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItem");
                    RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtFrom");
                    RadTextBox t3 = (RadTextBox)grdMedal.Rows[k].FindControl("txtPrice");
                    RadTextBox t4 = (RadTextBox)grdMedal.Rows[k].FindControl("txtMesu");
                    RadTextBox t5 = (RadTextBox)grdMedal.Rows[k].FindControl("txtOnChargeQty");

                    t.Text = itemCode;
                    t1.Text = item;
                    t2.Text = from;
                    t3.Text = price;
                    t4.Text = messu;
                    t5.Text = stock;
               
                    k++;
                }

            }

        }



        public void bindserchdatagv()
        {
            dtGetExItems.Clear();
            dtGetExItems = itemObject.GetExcItems(strConnString, ddlItem.SelectedValue.ToString());

            if (dtGetExItems.Rows.Count > 0)
            {
                grdMedal.DataSource = dtGetExItems;
                grdMedal.DataBind();
            }
        }

     
        protected void txtsale_TextChanged(object sender, EventArgs e)
        {
          
            
           
        }

        

        protected void btnGetHandStock_Click(object sender, EventArgs e)
        {
            //if (ddlWardroom.SelectedItem.Text == "---Select---")
            //{
            //    lblErrorWardRoom.Visible = true;
            //    lblErrorWardRoom.Text = "Select Wardroom !";
            //    lblErrorWardRoom.ForeColor = System.Drawing.Color.Red;
            //}

            //else
            //{
            //    lblErrorWardRoom.Text = "";

            //    for (int i = 0; i < grdMedal.Rows.Count; i++)
            //    {

            //        RadTextBox txtsaleQty1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty"); ;

            //        GridViewRow gvrow = (GridViewRow)txtsaleQty1.NamingContainer;
            //        int rowid = gvrow.RowIndex;
            //        RadTextBox txtsaleQty = (RadTextBox)grdMedal.Rows[rowid].FindControl("txtSaleQty");


            //        RadTextBox txtitemId1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");

            //        GridViewRow gvrow1 = (GridViewRow)txtitemId1.NamingContainer;
            //        int rowid1 = gvrow1.RowIndex;
            //        RadTextBox txtitemId = (RadTextBox)grdMedal.Rows[rowid1].FindControl("txtItemCode");


            //        RadTextBox txtitemCode1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtID");

            //        GridViewRow gvrow3 = (GridViewRow)txtitemId1.NamingContainer;
            //        int rowid3 = gvrow3.RowIndex;
            //        RadTextBox txtitemCode = (RadTextBox)grdMedal.Rows[rowid1].FindControl("txtID");

            //        dtGetSaleItemsQty.Clear();
            //        dtGetSaleItemsQty = itemObject.GetSaleItemsQty(strConnString, txtitemId.Text,txtsaleQty.Text,txtitemCode.Text );
            //        //dtGetSaleItemsQty = itemObject.GetSaleItemsQty(strConnString, ddlItem.SelectedValue.ToString(), txtsaleQty.Text, txtitemId.Text);


            //        RadTextBox txtCurrentQty1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");
            //        txtCurrentQty1.Text = dtGetSaleItemsQty.Rows[0][7].ToString();
            //        GridViewRow gvrow2 = (GridViewRow)txtitemId1.NamingContainer;
            //        int rowid2 = gvrow1.RowIndex;
            //        RadTextBox txtCurrentQty = (RadTextBox)grdMedal.Rows[rowid2].FindControl("txtCurrentQty");



            //    }
            //}

           
                // string itemCode = row[4].ToString();
                //string item = row[0].ToString();
                //string from = row[1].ToString();
                //string price = row[2].ToString();
                //string messu = row[3].ToString();
                // string stock = row[5].ToString();
                //string id = row[6].ToString();

               
                //RadTextBox t6 = (RadTextBox)grdMedal.Rows[n].FindControl("txtID");

                //t.Text = itemCode;
                //t1.Text = item;
                //t2.Text = from;
                //t3.Text = price;
                //t4.Text = messu;
                //t5.Text = stock;
                //t6.Text = id;

                Decimal currentQty = 0;
              
                for (int p = 0; p < grdReport2.Items.Count; p++)
                {

                    String itemCode1 = grdReport2.Items[p].Cells[7].Text;
                    Decimal SaleQty = Convert.ToDecimal(grdReport2.Items[p].Cells[4].Text);

                    for (int n = 0; n < grdMedal.Rows.Count; n++)
                    {

                        RadTextBox t = (RadTextBox)grdMedal.Rows[n].FindControl("txtItemCode");
                        string itemCode = t.Text;
                        RadTextBox t5 = (RadTextBox)grdMedal.Rows[n].FindControl("txtOnChargeQty");
                        String stock = t5.Text;

                            if (itemCode == itemCode1)
                            {
                                if (Convert.ToDecimal(stock) >= SaleQty)
                                {
                                    RadTextBox t7 = (RadTextBox)grdMedal.Rows[n].FindControl("txtSaleQty");
                                    RadTextBox t8 = (RadTextBox)grdMedal.Rows[n].FindControl("txtCurrentQty");
                                    currentQty = Convert.ToDecimal(stock) - SaleQty;
                                    t7.Text = SaleQty.ToString();
                                    t8.Text = currentQty.ToString();
                                    break;
                                   
                                }

                                if (Convert.ToDecimal(stock) < SaleQty)
                                {
                                    RadTextBox t7 = (RadTextBox)grdMedal.Rows[n].FindControl("txtSaleQty");
                                    RadTextBox t8 = (RadTextBox)grdMedal.Rows[n].FindControl("txtCurrentQty");

                                    currentQty =(Convert.ToDecimal(stock)) - SaleQty;                          
                                    t7.Text = SaleQty.ToString();
                                    t8.Text = currentQty.ToString();
                                    RadTextBox t7_1 = (RadTextBox)grdMedal.Rows[n+1].FindControl("txtSaleQty");
                                  

                                    SaleQty = -1* currentQty;

                                    if (currentQty < 0)
                                    {
                                        t8.Text = "0.000";
                                    }
                                  
                                }
                      
                            }
                }

                }


                for (int n = 0; n < grdMedal.Rows.Count; n++)
                {

                    RadTextBox t = (RadTextBox)grdMedal.Rows[n].FindControl("txtItemCode");
                    string itemCode = t.Text;
                    RadTextBox t5 = (RadTextBox)grdMedal.Rows[n].FindControl("txtOnChargeQty");
                    String stock = t5.Text;

                   
                    RadTextBox t7 = (RadTextBox)grdMedal.Rows[n].FindControl("txtSaleQty");
                    RadTextBox t8 = (RadTextBox)grdMedal.Rows[n].FindControl("txtCurrentQty");

                    if (t7.Text == "")
                    {
                        t7.Text = "0.000";
                        t8.Text = stock.ToString();

                    }

                }

                btnUpdateStock.Visible = true;

            }


        

        protected void grdMedal_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpdateStock_Click(object sender, EventArgs e)
        {
            //for (int i = 0; i < grdMedal.Rows.Count; i++)
            //{
            //    RadTextBox CurrentQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");

            //    if (CurrentQty.Text != "")
            //    {
                    update_T_stock_Table();
                    update_T_StockQty_Table();
                    insert_T_DailyMenuSales();
                    ViewSaleMenuItem();
                    GetTotalMenuCost();
                //}

            //    else
            //    {
            //        Label12.Visible = true;
            //        Label12.Text = "First Click on 'Get Hand Stock' button !";
            //        Label12.ForeColor = System.Drawing.Color.Red;
            //    }
            //}
        }

        public void GetTotalMenuCost()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();
            string vegi = ddlVegi.SelectedItem.Text;

            dtTotalMenuCost = itemObject.GetTotalMenuCost(strConnString, date, reasonCode, wardroomCode, vegi);

            if (dtTotalMenuCost.Rows.Count > 0)
            {
                Session["ss"] = dtTotalMenuCost;
                Publishdata(dtTotalMenuCost, date, reasonCode, wardroomCode, vegi);
            }
        }

        public void Publishdata(DataTable one, string date, string reasonCode, string wardroomCode, string vegi)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchTotalMEnuCost(date, reasonCode, wardroomCode, vegi);

            GetTotalCost(xx);
        }

        private DataSet SearchTotalMEnuCost(string date, string reasonCode, string wardroomCode, string vegi)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetTotalMenuCost]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;
            cmd.Parameters.Add("@vegi", SqlDbType.VarChar).Value = vegi;

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


        //public void Update_T_DailyMenuSalesCost()
        //{
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = con;

        //    for (int i = 0; i < grdMedal.Rows.Count; i++)
        //    {
        //        try
        //        {

        //            con.Open();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = "[VICTULING_Update_price_DailyMenuSale]";

        //            RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");

        //            cmd.Parameters.AddWithValue("@transID", itemId.Text);
                 
        //            cmd.ExecuteNonQuery();
        //            cmd.Parameters.Clear();
        //            con.Close();
        //            lblError.Visible = true;

        //            lblError.Text = "Update Success!";
        //            lblError.ForeColor = System.Drawing.Color.Green;


        //        }

        //        catch (Exception ex)
        //        {
        //            //lbl_Errormsg.Visible = true;
        //            //lbl_Errormsg.Text = ex.Message;
        //        }
        //    }
        //}


        public void ViewSaleMenuItem()
        {
            lblDate.Visible = true;
            lblReason.Visible = true;

            
            if (dateSaleDate.SelectedDate != null)
            {
            DateTime dat = Convert.ToDateTime(dateSaleDate.SelectedDate.ToString());
            lblDate.Text = dat.ToString("yyyy-MM-dd");
            }
          
            lblReason.Text = ddlReason.SelectedItem.Text;

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMenuItemList_OnDate]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reason", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@vegi", ddlVegi.SelectedItem.Text);

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
        }


        public void GetTotalCurrentStock()
        {

            double sum = 0;
            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                
                RadTextBox txtCurrentQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");

                if (txtCurrentQty.Text != "")
                {
                    sum += Convert.ToDouble(txtCurrentQty.Text);
                    
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

        public void update_T_stock_Table()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_Stock]";
                    //cmd.CommandText = "[VICTULING_Update_T_Stock_New]";

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
                    if (con.State != ConnectionState.Closed)
                    {
                        con.Close();
                    }
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

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
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
                    if (con.State != ConnectionState.Closed)
                    {
                        con.Close();
                    }
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
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {
                    RadTextBox saleQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty");
                    RadTextBox stockQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtOnChargeQty");
                    RadTextBox unitPrice = (RadTextBox)grdMedal.Rows[i].FindControl("txtPrice");
                    RadTextBox recFrom = (RadTextBox)grdMedal.Rows[i].FindControl("txtFrom");
                    RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");

                  

                    double balanceQty = 0.00;

                    if (decimal.Parse(saleQty.Text.ToString()) >= decimal.Parse(stockQty.Text.ToString()))
                    {
                        //if sala qty greater than stock
                        Double cost = ((double.Parse(stockQty.Text.ToString())) * (double.Parse(unitPrice.Text.ToString())));
                        balanceQty = (double.Parse(saleQty.Text.ToString()) - double.Parse(stockQty.Text.ToString()));
                        
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_insert_T_DailyMenuSales]";

                        cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                        cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
                        cmd.Parameters.AddWithValue("@saleQty",stockQty.Text.ToString());


                        cmd.Parameters.AddWithValue("@unitPrice", unitPrice.Text);
                        cmd.Parameters.AddWithValue("@price", cost);
                        cmd.Parameters.AddWithValue("@recevedFrom", recFrom.Text);
                        cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());
                        cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedValue.ToString());

                        cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        //con.Close();
                        lblError.Visible = true;

                        lblError.Text = "Update Success!";
                        lblError.ForeColor = System.Drawing.Color.Green;
                    }

                    if (balanceQty > 0)
                    {
                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.Connection = con;

                        for (int x = i + 1; x < grdMedal.Rows.Count; x++)
                        {
                            if (balanceQty > 0)
                            {

                                RadTextBox saleQty1 = (RadTextBox)grdMedal.Rows[x].FindControl("txtSaleQty");
                                RadTextBox stockQty1 = (RadTextBox)grdMedal.Rows[x].FindControl("txtOnChargeQty");
                                RadTextBox unitPrice1 = (RadTextBox)grdMedal.Rows[x].FindControl("txtPrice");
                                RadTextBox recFrom1 = (RadTextBox)grdMedal.Rows[x].FindControl("txtFrom");
                                RadTextBox itemId1 = (RadTextBox)grdMedal.Rows[x].FindControl("txtItemCode");

                                    if (itemId.Text == itemId1.Text )
                                    {

                                        //balanceQty = (double.Parse(saleQty.Text.ToString()) - double.Parse(stockQty.Text.ToString()));
                                        //con.Open();
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.CommandText = "[VICTULING_insert_T_DailyMenuSales]";

                                        cmd1.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                                        cmd1.Parameters.AddWithValue("@itemCode", itemId1.Text);

                                       // string saleqt = (double.Parse(stockQty1.Text.ToString()) - double.Parse(balanceQty.ToString())).ToString();
                                        if (double.Parse(stockQty1.Text.ToString()) >= balanceQty)
                                        {
                                            cmd1.Parameters.AddWithValue("@saleQty", balanceQty.ToString());
                                            Double cost1 = ((double.Parse(unitPrice1.Text)) * (double.Parse(balanceQty.ToString())));
                                            cmd1.Parameters.AddWithValue("@price", cost1);
                                        }
                                        else 
                                        {
                                            cmd1.Parameters.AddWithValue("@saleQty", stockQty1.Text.ToString());
                                            Double cost1 = ((double.Parse(unitPrice1.Text)) * (double.Parse(stockQty1.Text)));
                                            cmd1.Parameters.AddWithValue("@price", cost1);
                                        }

                                        cmd1.Parameters.AddWithValue("@unitPrice", unitPrice1.Text);

                                        //Double cost1 = ((double.Parse(unitPrice1.Text)) * (double.Parse(balanceQty.ToString())));
                                        //cmd1.Parameters.AddWithValue("@price", cost1);

                                        cmd1.Parameters.AddWithValue("@recevedFrom", recFrom.Text);
                                        cmd1.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                                        cmd1.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());
                                        cmd1.Parameters.AddWithValue("@vegi", ddlVegi.SelectedValue.ToString());
                           
                                        cmd1.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                                        cmd1.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                                
                                        cmd1.ExecuteNonQuery();
                                        cmd1.Parameters.Clear();
                                        //con.Close();
                                        lblError.Visible = true;

                                        lblError.Text = "Update Success!";
                                        lblError.ForeColor = System.Drawing.Color.Green;

                                        balanceQty = double.Parse(balanceQty.ToString()) - double.Parse(stockQty1.Text.ToString());
                                        i++;
                                    }                                       
                            }


                            if (balanceQty <= 0.000)
                            {
                                break;
                            }

                            /////////////////

                            //for (int j = 0; j < grdMedal.Rows.Count; j++)
                            //{
                            //    RadTextBox stockQty1 = (RadTextBox)grdMedal.Rows[x].FindControl("txtOnChargeQty");

                            //    if (balanceQty <= double.Parse(stockQty1.Text.ToString()))
                            //    {
                            //        break;
                            //    }
                            //}

                            /////////////////////
                        }                         
                        
                    }

                    else
                    {

                        Double cost1 = ((Convert.ToDouble(saleQty.Text)) * (Convert.ToDouble(unitPrice.Text)));
                        //if stock qty greater than sale qty
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_insert_T_DailyMenuSales]";

                        cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                        cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
                        cmd.Parameters.AddWithValue("@saleQty", saleQty.Text);


                        cmd.Parameters.AddWithValue("@unitPrice", unitPrice.Text);
                        cmd.Parameters.AddWithValue("@price", cost1);
                        cmd.Parameters.AddWithValue("@recevedFrom", recFrom.Text);
                        cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());
                        cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedValue.ToString());

                        cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        //con.Close();
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

            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
        }

        protected void linkbtnTotalCurrentStock_Click(object sender, EventArgs e)
        {
            //GetTotalCurrentStock();
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
                string unitPrice = x["unitPrice"].Text.ToString();

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

                        cmd.Parameters.AddWithValue("@itemCode", itemCode);
                        cmd.Parameters.AddWithValue("@currentStock", qty);
                        cmd.Parameters.AddWithValue("@unitPrice", unitPrice);
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

                cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                cmd.Parameters.AddWithValue("@reason", ddlReason.SelectedItem.Text);
          
                cmd.Parameters.AddWithValue("@totalCost", lblTotalCost.Text);
                cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@lastModifiedUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@lastModifiedDate", System.DateTime.Now);

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                lblSaveTotalCost.Visible = true;

                lblSaveTotalCost.Text = "Update Success!";
                lblSaveTotalCost.ForeColor = System.Drawing.Color.Green;

            }

            catch (Exception ex)
            {
                //lbl_Errormsg.Visible = true;
                //lbl_Errormsg.Text = ex.Message;
            }
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

        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuSale.aspx");
        }

        protected void btnSaveTotalCost_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

           
                try
                {
              
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_insert_T_TotalMenuCost]";

                        cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                        cmd.Parameters.AddWithValue("@reason", ddlReason.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@totalCost", lblTotalCost.Text);
                        cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                        cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        con.Close();
                        lblSaveTotalCost.Visible = true;

                        Label11.Text = "Save Success!";
                        Label11.ForeColor = System.Drawing.Color.Green;

                    }
                
                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }

                UpdateTotalCost();
            
        }

        protected void lblViewCA_Click(object sender, EventArgs e)
        {
            if (ddlVegi.SelectedItem.Text == "Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForSA]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@noOfPerson", lblVegetarianCount.Text);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString()); 
                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport0.DataSource = ds.Tables[0];

                grdReport0.DataBind();

                con.Close();

            }

            else if (ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForSA]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@noOfPerson", lblNonVegetarianCount.Text);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString()); 

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport0.DataSource = ds.Tables[0];

                grdReport0.DataBind();

                con.Close();

            }
           
        }     

        protected void grdReport0_ItemCommand(object sender, GridCommandEventArgs e)
        {

        }
        protected void grdReportItemListByCa_ItemCommand(object sender, GridCommandEventArgs e)
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

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyProperMenu]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[0];

            grdReport1.DataBind();

            con.Close();
            
            getNonVegList();           
            getVegList();
        }

        public void getNonVegList()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();

            dtNonVegetarian = itemObject.GetNonVegiCount(strConnString, date, reasonCode, wardroomCode);

            if (dtNonVegetarian.Rows.Count > 0)
            {
                Session["ss"] = dtNonVegetarian;
                Publishdata(dtNonVegetarian, date, reasonCode, wardroomCode);
            }
        }

        public void getVegList()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();

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

        protected void grdReport1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport1.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn1") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport1.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void lnTotalIngredientsList_Click(object sender, EventArgs e)
        {
            if (ddlVegi.SelectedItem.Text == "Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForSA_Tot]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@noOfPerson", lblVegetarianCount.Text);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport2.DataSource = ds.Tables[0];

                grdReport2.DataBind();

                con.Close();

            }

            else if (ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForSA_Tot]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@noOfPerson", lblNonVegetarianCount.Text);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport2.DataSource = ds.Tables[0];

                grdReport2.DataBind();

                con.Close();

               

            }
            SearchExeedItem();

            
            SaveT_MealItemsSaleBySA();
        }

        public void SearchExeedItem()
        {

            dtGetNonVegMMEx = itemObject.GetNonVegMainMenu(strConnString,dateSaleDate.SelectedDate.ToString(), ddlReason.SelectedValue.ToString(), Session["wardRoomCode"].ToString(), lblNonVegetarianCount.Text, ddlVegi.SelectedItem.Text, ddlGroupMenu.SelectedValue.ToString());

            for (int k = 0; k < dtGetNonVegMMEx.DefaultView.Count; k++)
            {
                float currentQty = float.Parse(dtGetNonVegMMEx.DefaultView[k].Row["currentStock"].ToString());
                float saleQty = float.Parse(dtGetNonVegMMEx.DefaultView[k].Row["qty"].ToString());
               

                    if (currentQty < saleQty)
                    {
                        grdReport2.Items[k].BackColor = System.Drawing.Color.Orange;
                    }

               
            }

        }


        public void SaveT_MealItemsSaleBySA()
        {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            if (ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {
                string date = dateSaleDate.SelectedDate.ToString();
                string reasonCode = ddlReason.SelectedValue.ToString();
                string wardroomCode = Session["wardRoomCode"].ToString();            
                string noOfPerson = lblNonVegetarianCount.Text;                          
                string vegiNonVegi = ddlVegi.SelectedItem.Text;
                string groupMenuCode = ddlGroupMenu.SelectedValue.ToString();


                dtSalebySA = itemObject.GetSalebySA(strConnString, date, reasonCode, wardroomCode, noOfPerson, vegiNonVegi, groupMenuCode);
            }
            else if (ddlVegi.SelectedItem.Text == "Vegetarian")
            {
                string date = dateSaleDate.SelectedDate.ToString();
                string reasonCode = ddlReason.SelectedValue.ToString();
                string wardroomCode = Session["wardRoomCode"].ToString();            
                string noOfPerson = lblVegetarianCount.Text;
                string vegiNonVegi = ddlVegi.SelectedItem.Text;
                string groupMenuCode = ddlGroupMenu.SelectedValue.ToString();


                dtSalebySA = itemObject.GetSalebySA(strConnString, date, reasonCode, wardroomCode, noOfPerson, vegiNonVegi, groupMenuCode);
            }

            for (int i = 0; i < dtSalebySA.Rows.Count; i++)
            {
                try
                {

                   
                    String item = dtSalebySA.Rows[i][0].ToString();
                    String Issueqty = dtSalebySA.Rows[i][1].ToString();
                    String itemMessurment = dtSalebySA.Rows[i][2].ToString();
                    String itemCode = dtSalebySA.Rows[i][3].ToString();

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Save_MealItemsSaleBySA]";

                    cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    cmd.Parameters.AddWithValue("@reason", ddlReason.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@menuType", ddlGroupMenu.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@vegNveg", ddlVegi.SelectedValue.ToString());

                    cmd.Parameters.AddWithValue("@item", item);
                    cmd.Parameters.AddWithValue("@qty", Issueqty);
                    cmd.Parameters.AddWithValue("@itemMessurment", itemMessurment);
                    cmd.Parameters.AddWithValue("@itemCode", itemCode);

                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    //lblSaveTotalCost.Visible = true;

                    //lblSaveTotalCost.Text = "Update Success!";
                    //lblSaveTotalCost.ForeColor = System.Drawing.Color.Green;

                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }
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

        protected void linkBtnGetInList_Click(object sender, EventArgs e)
        {
            if ((dateSaleDate.SelectedDate.ToString() == "") || (ddlReason.SelectedItem.Text == "---Select---") )
            {
                lblError.Visible = true;
                lblError.Text = "Date Cannot be Empty and Select Reason !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblError.Text = "";
                SetInitialRow();

                string date = dateSaleDate.SelectedDate.ToString();
                string wardroom = Session["wardRoomCode"].ToString();
                string reason = ddlReason.SelectedValue.ToString();
                string menuType = ddlGroupMenu.SelectedValue.ToString();
                string vegNveg = ddlVegi.SelectedValue.ToString();

                dtGetDeductItems.Clear();

                dtGetDeductItems = itemObject.GetDeductItems(strConnString, date, wardroom, reason, menuType, vegNveg);
                if (dtGetDeductItems.Rows.Count > 0)
                {
                    Session["ss"] = dtGetDeductItems;

                    bindserchdatagvNew();
                    lblError.Text = "";
                }
                else
                {
                    lblError.Text = "No data found";
                    lblError.ForeColor = System.Drawing.Color.Red;

                }
            }

            int k = 0;

            if (dtGetDeductItems.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtGetDeductItems.Rows)
                {

                    string itemCode = row[4].ToString();
                    string item = row[0].ToString();
                    string from = row[1].ToString();
                    string price = row[2].ToString();
                    string messu = row[3].ToString();
                    string stock = row[5].ToString();
                    string id = row[6].ToString();

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
           // int n = 0;
            //int l = 0;
            //if (dtGetDeductItems.Rows.Count > 0)
            //{
            //    l = 0;
            //    foreach (DataRow row in dtGetDeductItems.Rows)
            //    {

            //        string itemCode = row[4].ToString();
            //        string item = row[0].ToString();
            //        string from = row[1].ToString();
            //        string price = row[2].ToString();
            //        string messu = row[3].ToString();
            //        string stock = row[5].ToString();
            //        string id = row[6].ToString();

            //        RadTextBox t = (RadTextBox)grdMedal.Rows[l].FindControl("txtItemCode");
            //        RadTextBox t1 = (RadTextBox)grdMedal.Rows[l].FindControl("txtItem");
            //        RadTextBox t2 = (RadTextBox)grdMedal.Rows[l].FindControl("txtFrom");
            //        RadTextBox t3 = (RadTextBox)grdMedal.Rows[l].FindControl("txtPrice");
            //        RadTextBox t4 = (RadTextBox)grdMedal.Rows[l].FindControl("txtMesu");
            //        RadTextBox t5 = (RadTextBox)grdMedal.Rows[l].FindControl("txtOnChargeQty");
            //        RadTextBox t6 = (RadTextBox)grdMedal.Rows[l].FindControl("txtID");

            //        t.Text = itemCode;
            //        t1.Text = item;
            //        t2.Text = from;
            //        t3.Text = price;
            //        t4.Text = messu;
            //        t5.Text = stock;
            //        t6.Text = id;

                  

            //        //for (int m = 0; m < grdReport2.Items.Count; m++ )
            //        //{
            //        //    String itemCode1 = grdReport2.Items[m].Cells[6].Text;
            //        //    Decimal qty = Convert.ToDecimal(grdReport2.Items[m].Cells[4].Text);
            //        //    Decimal currentQty = 0;
            //        //    if (itemCode == itemCode1)
            //        //    {
            //        //        if (Convert.ToDecimal(stock) > qty)
            //        //        {
            //        //            RadTextBox t7 = (RadTextBox)grdMedal.Rows[l].FindControl("txtSaleQty");
            //        //            RadTextBox t8 = (RadTextBox)grdMedal.Rows[l].FindControl("txtCurrentQty");
            //        //            currentQty = Convert.ToDecimal(stock) - qty;
            //        //            t7.Text = qty.ToString();
            //        //            t8.Text = currentQty.ToString();



            //        //        }
            //        //    }
                        
            //        //}

            //    }



               


          //  }
            btnUpdateStock.Visible = false;

        }


        public void bindserchdatagvNew()
        {
            dtGetDeductItems.Clear();
            dtGetDeductItems = itemObject.GetDeductItems(strConnString, dateSaleDate.SelectedDate.ToString(), Session["wardRoomCode"].ToString(), ddlReason.SelectedValue.ToString(), ddlGroupMenu.SelectedValue.ToString(), ddlVegi.SelectedValue.ToString());

            if (dtGetDeductItems.Rows.Count > 0)
            {
                grdMedal.DataSource = dtGetDeductItems;
                grdMedal.DataBind();
            }

           



        }

    }
}