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
    public partial class AddExtraForGroupMenuSale : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItems = new DataTable();
        public static DataTable dtGetSaleItemsQty = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
        public static DataTable dtGroupMenuCount = new DataTable();
        public static DataTable dtGetDeductItems = new DataTable();
        public static int countval = 0;
        public static DataTable dtSalebySA = new DataTable();
        public static DataTable dtTotalMenuCost = new DataTable();
        public static DataTable dtGetGroupMEx = new DataTable();

        public static string nic = "";
        public static string OS = "";
        public static string nicNo_SSID = "";
        public static string officialNo = "";
        public static string serviceType = "";

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();

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
            txtWardRoom.Text = Session["wardRoomName"].ToString();



            //ddlWardroom.DataSource = dtWardroom;

            //ddlWardroom.DataTextField = "wardroomName";
            //ddlWardroom.DataValueField = "wardroomCode";
            //ddlWardroom.DataBind();

            //ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            //dtBaseAll = itemObject.GetAllBase(strConnString2);
            //ddlBaseAll.DataSource = dtBaseAll;

            //ddlBaseAll.DataTextField = "baseDescription";
            //ddlBaseAll.DataValueField = "baseCode";
            //ddlBaseAll.DataBind();

            //ddlBaseAll.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtMenuReason = itemObject.GetManuReason(strConnString);
            ddlReason.DataSource = dtMenuReason;

            ddlReason.DataTextField = "reason";
            ddlReason.DataValueField = "reasonCode";
            ddlReason.DataBind();
            ddlReason.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            ddlGroupMenu.DataSource = dtGroupMenuNew;

            ddlGroupMenu.DataTextField = "GroupMenu";
            ddlGroupMenu.DataValueField = "GroupMenuCode";
            ddlGroupMenu.DataBind();
            ddlGroupMenu.Items.Insert(0, new RadComboBoxItem("---Select---", ""));
        }

        public void bindserchdatagv()
        {
            dtGetDeductItems.Clear();
            //dtGetExItems = itemObject.GetExcItems(strConnString, ddlItem.SelectedValue.ToString());
            dtGetDeductItems = itemObject.GetDeductItems(strConnString, dateSaleDate.SelectedDate.ToString(), Session["wardRoomCode"].ToString(), ddlReason.SelectedValue.ToString(), ddlGroupMenu.SelectedValue.ToString(), ddlVegi.SelectedValue.ToString());

            if (dtGetDeductItems.Rows.Count > 0)
            {
                grdMedal.DataSource = dtGetDeductItems;
                grdMedal.DataBind();
            }
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string off = txtOfficialNo.Text;
            string OSType = ddlOfficerSailor.SelectedItem.Text.ToString();
            string ServiceType = ddlServiceType0.SelectedItem.Text.ToString();

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

        protected void btnViewExtra_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMenuCcstomizeMealItemList]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedItem.Text);
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            //command.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);            
            //command.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);

            //adapter = new SqlDataAdapter(command);
            adapter.SelectCommand = command;
            adapter.Fill(ds);

            //grdReport0.DataSource = ds.Tables[0];

            //grdReport0.DataBind();

            con.Close();

            if (ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {
                view_GroupMenu();
            }

            if (ddlVegi.SelectedItem.Text == "Vegetarian")
            {
                view_VegGroupMenu();
            }

            ViewGroupMenuAttendanceList();
            view_ItemList();

            getGroupMenuCount(); 
        }


        public void getGroupMenuCount()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = wardRoomCode.ToString().Trim();
            string groupMenuCode = ddlGroupMenu.SelectedValue.ToString();
            string vegNonVeg = ddlVegi.SelectedItem.Text;

            dtGroupMenuCount = itemObject.GetGroupMenuCount(strConnString, date, reasonCode, wardroomCode, groupMenuCode, vegNonVeg);

            if (dtGroupMenuCount.Rows.Count > 0)
            {
                Session["ss"] = dtGroupMenuCount;
                Publishdata(dtGroupMenuCount, date, reasonCode, wardroomCode, groupMenuCode, vegNonVeg);
            }
        }

        public void Publishdata(DataTable one, string date, string reasonCode, string wardroomCode, string groupMenuCode, string vegNonVeg)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchGroupMenuCount(date, reasonCode, wardroomCode, groupMenuCode, vegNonVeg);

            GetGroupMenuCount(xx);
        }


        public void GetGroupMenuCount(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblGroupMenuCount.Text = personal.Tables[0].Rows[0]["mealCount"].ToString();
                }
                else
                {
                    lblGroupMenuCount.Text = "No Data";
                }

                if (0 < (personal.Tables[1].Rows.Count))
                {
                    string V1 = "";
                    for (int i = 0; i < (personal.Tables[1].Rows.Count); i++)
                    {
                        if ((personal.Tables[1].Rows.Count) - 1 > i)
                        {

                            V1 = V1 + personal.Tables[1].Rows[i][0].ToString() + ",";

                        }
                        else
                        {
                            V1 = V1 + personal.Tables[1].Rows[i][0].ToString();
                        }
                        txtOffNoList.Text = V1;
                    }

                }
                else
                {
                    txtOffNoList.Text = "No Data";
                }

                //               DataTable dt = new DataTable();
                //              var columnarray= dt.AsEnumerable().Select(s => s.Field<string>"TankName")).Distinct().ToArray();
                //              string value  = string.Join(",", columnarray);
            }
        }
        protected void ViewIngredientsList_Click(object sender, EventArgs e)
        {
            ViewGropMenuIngredients();
        }

        protected void lnTotalIngredientsList_Click(object sender, EventArgs e)
        {
             if (txtOffNoList.Text != "")
            {
                int a = 0;

                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForGroupMenu_Tot]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
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
                command.Parameters.AddWithValue("@noOfPerson", a);
                //command.Parameters.AddWithValue("@noOfPerson", lblGroupMenuCount.Text);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport5.DataSource = ds.Tables[0];

                grdReport5.DataBind();

                con.Close();
            }
            else
            {
                Label15.Text = "Please Enter Official No.";
                Label15.ForeColor = System.Drawing.Color.Red;
            }

            SearchExeedItem();
            SaveT_MealItemsSaleBySA();
        }

        protected void linkBtnGetInList_Click(object sender, EventArgs e)
        {
            if ((dateSaleDate.SelectedDate.ToString() == "") || (ddlReason.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Date Cannot be Empty and Select Reason !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblError.Text = "";
                SetInitialRow();

                //string Sport = ddlItem.SelectedValue.ToString();
                string date = dateSaleDate.SelectedDate.ToString();
                string wardroom = Session["wardRoomCode"].ToString();
                string reason = ddlReason.SelectedValue.ToString();
                string menuType = ddlGroupMenu.SelectedValue.ToString();
                string vegNveg = ddlVegi.SelectedValue.ToString();

                dtGetDeductItems.Clear();

                //dtGetExItems = itemObject.GetExcItems(strConnString, Sport);
                dtGetDeductItems = itemObject.GetDeductItems_Group(strConnString, date, wardroom, reason, menuType, vegNveg);
                if (dtGetDeductItems.Rows.Count > 0)
                {
                    Session["ss"] = dtGetDeductItems;

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

                    //string itemCode = row[0].ToString();
                    //string item = row[1].ToString();
                    //string from = row[2].ToString();
                    //string price = row[3].ToString();
                    //string messu = row[4].ToString();
                    //string stock = row[5].ToString();


                    //RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtItemCode");
                    //RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItem");
                    //RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtFrom");
                    //RadTextBox t3 = (RadTextBox)grdMedal.Rows[k].FindControl("txtPrice");
                    //RadTextBox t4 = (RadTextBox)grdMedal.Rows[k].FindControl("txtMesu");
                    //RadTextBox t5 = (RadTextBox)grdMedal.Rows[k].FindControl("txtOnChargeQty");

                    //t.Text = itemCode;
                    //t1.Text = item;
                    //t2.Text = from;
                    //t3.Text = price;
                    //t4.Text = messu;
                    //t5.Text = stock;

                    k++;
                }

            }

            btnUpdateStock.Visible = false;
        }

        protected void btnGetHandStock_Click(object sender, EventArgs e)
        {
            getItemDeductItem();
            btnUpdateStock.Visible = true;
        }

        public void getItemDeductItem()
        {


            Decimal currentQty = 0;

            for (int p = 0; p < grdReport5.Items.Count; p++)
            {

                String itemCode1 = grdReport5.Items[p].Cells[7].Text;
                Decimal SaleQty = Convert.ToDecimal(grdReport5.Items[p].Cells[4].Text);

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

                            currentQty = (Convert.ToDecimal(stock)) - SaleQty;
                            t7.Text = SaleQty.ToString();
                            t8.Text = currentQty.ToString();
                            RadTextBox t7_1 = (RadTextBox)grdMedal.Rows[n + 1].FindControl("txtSaleQty");


                            SaleQty = -1 * currentQty;

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
        }

        public void getHandStock()
        {
            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                //    RadTextBox txtCurrent = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");
                //    if (txtCurrent.Text !="")
                //    {

                RadTextBox txtsaleQty1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty"); ;

                GridViewRow gvrow = (GridViewRow)txtsaleQty1.NamingContainer;
                int rowid = gvrow.RowIndex;
                RadTextBox txtsaleQty = (RadTextBox)grdMedal.Rows[rowid].FindControl("txtSaleQty");


                RadTextBox txtitemId1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");

                GridViewRow gvrow1 = (GridViewRow)txtitemId1.NamingContainer;
                int rowid1 = gvrow1.RowIndex;
                RadTextBox txtitemId = (RadTextBox)grdMedal.Rows[rowid1].FindControl("txtItemCode");

                RadTextBox txtitemCode1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtID");

                GridViewRow gvrow3 = (GridViewRow)txtitemId1.NamingContainer;
                int rowid3 = gvrow3.RowIndex;
                RadTextBox txtitemCode = (RadTextBox)grdMedal.Rows[rowid1].FindControl("txtID");

                dtGetSaleItemsQty.Clear();
                //dtGetSaleItemsQty = itemObject.GetSaleItemsQty(strConnString, ddlItem.SelectedValue.ToString(), txtsaleQty.Text, txtitemId.Text);
                dtGetSaleItemsQty = itemObject.GetSaleItemsQty(strConnString, txtitemId.Text, txtsaleQty.Text, txtitemCode.Text);

                RadTextBox txtCurrentQty1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");
                txtCurrentQty1.Text = dtGetSaleItemsQty.Rows[0][7].ToString();
                GridViewRow gvrow2 = (GridViewRow)txtitemId1.NamingContainer;
                int rowid2 = gvrow1.RowIndex;
                RadTextBox txtCurrentQty = (RadTextBox)grdMedal.Rows[rowid2].FindControl("txtCurrentQty");
                //}

                //else
                //{
                //    Label16.Text = "Please Get Current Stock First!";
                //    Label16.ForeColor = System.Drawing.Color.Red;
                //}

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

        protected void btnUpdateStock_Click(object sender, EventArgs e)
        {

            update_T_stock_Table();
            update_T_StockQty_Table();

            if (!string.IsNullOrEmpty(txtOffNoList.Text))
            {
                List<string> offNOList = txtOffNoList.Text.Split(',').Reverse().ToList();
                if (offNOList.Count > 0)
                {
                    for (int x = 0; x < offNOList.Count; x++)
                    {
                        int offNo = int.Parse(offNOList[x]);

                        //update_T_stock_Table();
                        //update_T_StockQty_Table();
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

        public void GetTotalMenuCost()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();
            string vegi = ddlVegi.SelectedItem.Text;
            string groupCode = ddlGroupMenu.SelectedValue.ToString();

            dtTotalMenuCost = itemObject.GetTotalGroupMenuCost(strConnString, date, reasonCode, wardroomCode, vegi, groupCode);

            if (dtTotalMenuCost.Rows.Count > 0)
            {
                Session["ss"] = dtTotalMenuCost;
                PublishdataGroup(dtTotalMenuCost, date, reasonCode, wardroomCode, vegi, groupCode);
            }
        }

        public void PublishdataGroup(DataTable one, string date, string reasonCode, string wardroomCode, string vegi, string groupCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchTotalMEnuCost(date, reasonCode, wardroomCode, vegi, groupCode);

            GetTotalCost(xx);
        }

        private DataSet SearchTotalMEnuCost(string date, string reasonCode, string wardroomCode, string vegi, string groupCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetTotalMenuCost_Group]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;
            cmd.Parameters.Add("@vegi", SqlDbType.VarChar).Value = vegi;
            cmd.Parameters.Add("@groupMenue", SqlDbType.VarChar).Value = groupCode;

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
                    Label19.Text = personal.Tables[0].Rows[0]["totalCost"].ToString();
                }
                else
                {
                    Label19.Text = "No Data";
                }



            }
        }

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
            con.Close();
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetIndividualItemList_OnDate]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue);
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue);

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
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
                    //cmd.CommandText = "[VICTULING_Update_T_Stock_forMenuSale]";

                    RadTextBox Id = (RadTextBox)grdMedal.Rows[i].FindControl("txtID");
                    RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");
                    RadTextBox recFrom = (RadTextBox)grdMedal.Rows[i].FindControl("txtFrom");
                    RadTextBox unitPrice = (RadTextBox)grdMedal.Rows[i].FindControl("txtPrice");
                    RadTextBox currenyQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");

                    //RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");
                    //RadTextBox currenyQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");

                    cmd.Parameters.AddWithValue("@itemId", Id.Text);
                    cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
                    cmd.Parameters.AddWithValue("@CurrentQty", currenyQty.Text);

                    //cmd.Parameters.AddWithValue("@itemId", itemId.Text);
                    //cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                    //cmd.Parameters.AddWithValue("@CurrentQty", currenyQty.Text);

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

        public void insert_T_DailyExtraSales(string offNo, int officerCount)
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
                    RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");
                    RadTextBox saleQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty");
                    RadTextBox messurment = (RadTextBox)grdMedal.Rows[i].FindControl("txtMesu");
                    RadTextBox unitPrice = (RadTextBox)grdMedal.Rows[i].FindControl("txtPrice");
                    RadTextBox recevedFrom = (RadTextBox)grdMedal.Rows[i].FindControl("txtFrom");
                    RadTextBox Id = (RadTextBox)grdMedal.Rows[i].FindControl("txtID");



                    //if (saleQty.Text != "")
                    //{
                    decimal saleQtyperPerson = (decimal.Parse(saleQty.Text.ToString()) / officerCount);
                    Double cost = (((Convert.ToDouble(saleQty.Text)) / officerCount) * (Convert.ToDouble(unitPrice.Text)));

                    //decimal saleQtyperPerson = (decimal.Parse(saleQty.Text.ToString()));

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_insert_T_DailyExtraSales]";

                    cmd.Parameters.AddWithValue("@saleDate", dateSaleDate.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
                    cmd.Parameters.AddWithValue("@itemId", Id.Text);
                    cmd.Parameters.AddWithValue("@saleQty", saleQtyperPerson.ToString());
                    cmd.Parameters.AddWithValue("@unitPrice", unitPrice.Text);
                    cmd.Parameters.AddWithValue("@TotalCost", cost.ToString());
                    cmd.Parameters.AddWithValue("@recevedFrom", recevedFrom.Text);
                    cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@offNo", offNo);
                    cmd.Parameters.AddWithValue("@officerSailor", "O");
                    cmd.Parameters.AddWithValue("@serviceType", "");
                    cmd.Parameters.AddWithValue("@currentBase", Session["wardRoomName"].ToString());
                    cmd.Parameters.AddWithValue("@permantBase", '0');
                    cmd.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());

                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                    cmd.Parameters.AddWithValue("@takenBy", "");
                    cmd.Parameters.AddWithValue("@offNoSailor", "");
                    cmd.Parameters.AddWithValue("@serviceTypeSailor", "");
                    cmd.Parameters.AddWithValue("@osSailor", "");
                    cmd.Parameters.AddWithValue("@rankRate", "");
                    cmd.Parameters.AddWithValue("@vegNonVeg", ddlVegi.SelectedValue.ToString());

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();

                    lblError.Visible = true;

                    lblError.Text = "Update Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                    //}
                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }



                finally
                {



                }
            }
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
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

                if (0 < (personal.Tables[13].Rows.Count))
                {
                    lblIsActive.Text = personal.Tables[13].Rows[0]["isActive"].ToString();
                }
                else
                {
                    lblIsActive.Text = "No Data";
                }


            }



        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((dateSaleDate.SelectedDate.ToString() != "") || (ddlReason.SelectedItem.Text != "---Select---"))
            {
                ViewSaleMenuItem();
            }

            else
            {
                Label17.Text = "Please select Date and Reason !";
                Label17.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            GetTotalMenuCost();

            double NoOfDays = 0.00;
            double CostPerDay = 0.00;
            double ans5 = 0.00;

            NoOfDays = System.Double.Parse(lblGroupMenuCount.Text);
            CostPerDay = System.Double.Parse(Label19.Text);


            ans5 = (CostPerDay / NoOfDays);
            Label20.Text = ans5.ToString();

            saveGroupMenueSale();
        }

        protected void grdReport_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["transID"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[T_DailyExtraSales] WHERE [transID] = '" + int.Parse(id) + "'";
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
                string itemId = x["itemId"].Text.ToString();
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
                    cmd.Parameters.AddWithValue("@itemId", itemId);
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

        private DataSet SearchGroupMenuCount(string date, string reasonCode, string wardroomCode, string groupMenuCode, string vegNonVeg)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetGroupMealAttendanceCount]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;
            cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 250).Value = groupMenuCode;
            cmd.Parameters.Add("@vegNonVeg", SqlDbType.VarChar, 250).Value = vegNonVeg;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void ViewGropMenuIngredients()
        {
            int a = 0;
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_getIngredientsListForGroupMenu]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
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
            command.Parameters.AddWithValue("@noOfPerson", a);
            command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport4.DataSource = ds.Tables[0];

            grdReport4.DataBind();

            con.Close();


        }

        public void ViewGroupMenuAttendanceList()
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

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@GroupMenuCode", ddlGroupMenu.SelectedValue.ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport3.DataSource = ds.Tables[0];

                grdReport3.DataBind();

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

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@GroupMenuCode", ddlGroupMenu.SelectedValue.ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport3.DataSource = ds.Tables[0];

                grdReport3.DataBind();

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

        public void view_GroupMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyMenu]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[0];

            grdReport2.DataBind();

            con.Close();
        }

        public void view_VegGroupMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyMenu_Veg]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[0];

            grdReport2.DataBind();

            con.Close();
        }

        public void view_ItemList()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMenuCcstomizeItemList]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            //command.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
            command.Parameters.AddWithValue("@officerSailor", "O");
            command.Parameters.AddWithValue("@serviceType", ddlServiceType0.SelectedItem.Text);

            adapter.SelectCommand = command;
            adapter.Fill(ds);

            //grdReport1.DataSource = ds.Tables[0];

            //grdReport1.DataBind();

            con.Close();


        }
        protected void rgdBoardAssessment_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport0_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void grdReport4_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport4.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn4") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport4.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport5_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }
        public void SearchExeedItem()
        {
            int a = 0;
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
        }
        public void SaveT_MealItemsSaleBySA()
        {
            if (txtOffNoList.Text != "")
            {
                int a = 0;

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                string date = dateSaleDate.SelectedDate.ToString();
                string reasonCode = ddlReason.SelectedValue.ToString();
                string wardroomCode = Session["wardRoomCode"].ToString();

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

                string noOfPerson = a.ToString();
                string vegiNonVegi = ddlVegi.SelectedItem.Text;
                string groupMenuCode = ddlGroupMenu.SelectedValue.ToString();


                dtSalebySA = itemObject.GetSalebySA(strConnString, date, reasonCode, wardroomCode, noOfPerson, vegiNonVegi, groupMenuCode);

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
                        //Label18.Visible = true;

                        //Label18.Text = "Update Success!";
                        //Label18.ForeColor = System.Drawing.Color.Green;

                    }

                    catch (Exception ex)
                    {
                        //lbl_Errormsg.Visible = true;
                        //lbl_Errormsg.Text = ex.Message;
                    }
                }
            }
        }

        protected void grdReport5_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport5.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn5") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport5.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport3_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport3.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn3") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport3.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport2_ItemCommand(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport2.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport2.PageCount) + e.Item.ItemIndex + 1);
            }
        }

      
        protected void grdReport3_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport3.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn3") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport3.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void ddlItemCat_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
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

        protected void ddlItem_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grdMedal_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void saveGroupMenueSale()
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
                cmd.Parameters.AddWithValue("@totalCost", Label19.Text);
                cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                Label21.Visible = true;

                Label21.Text = "Save Success!";
                Label21.ForeColor = System.Drawing.Color.Green;

            }

            catch (Exception ex)
            {
                //lbl_Errormsg.Visible = true;
                //lbl_Errormsg.Text = ex.Message;
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

        protected void grdReport2_ItemCommand(object sender, GridCommandEventArgs e)
        {

        }
    }
}