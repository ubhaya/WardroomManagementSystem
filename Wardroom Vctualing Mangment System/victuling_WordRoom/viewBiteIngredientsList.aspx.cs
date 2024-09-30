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
    public partial class viewBiteIngredientsList : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static int countval = 0;
        public static String wardRoomName, wardRoomCode;

        public static DataTable dtGroupMenuNew = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtUpdateSportsGrid = new DataTable();
        public static DataTable dtSalebySA = new DataTable();
        public static DataTable dtGetDeductItems = new DataTable();
        public static DataTable dtTotalMenuCost = new DataTable();
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

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();
                SetInitialRow();
                SetInitialRow1();
            }
        }

        public void LoadBasic()
        {



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

        protected void btnView0_Click(object sender, EventArgs e)
        {
            Bind_T_DailyMenu();
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
                    string ItemCode = row[0].ToString();
                    string potion = row[4].ToString();

                    RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtMealID");
                    RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtMealCategory");
                    RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtMealItem");
                    RadTextBox t3 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItemCode");
                    RadTextBox t4 = (RadTextBox)grdMedal.Rows[k].FindControl("txtRemarks");

                    t.Text = MealID;
                    t1.Text = MealCat;
                    t2.Text = MealItem;
                    t3.Text = ItemCode;
                    t4.Text = potion;

                    k++;
                }

            }
        }

        public void bindserchdatagv()
        {
            //DateTime SignalRefDate = Convert.ToDateTime(dateMenuDate.SelectedDate.ToString());
            //dtUpdateSportsGrid.Clear();
            dtUpdateSportsGrid = itemObject.GetMenuBite(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), wardRoomCode.ToString(), ddlGroupMenu.SelectedValue.ToString());

            if (dtUpdateSportsGrid.Rows.Count > 0)
            {
                grdMedal.DataSource = dtUpdateSportsGrid;
                grdMedal.DataBind();
            }
        }

        protected void ViewIngredientsList_Click(object sender, EventArgs e)
        {
            ViewGropMenuIngredients();
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
            command.CommandText = "[VICTULING_getIngredientsListForBiteyMenu_Tot]";

            command.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
            command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
            //if (!string.IsNullOrEmpty(txtOffNoList.Text))
            //{
            //    List<string> offNOList = txtOffNoList.Text.Split(',').Reverse().ToList();
            //    if (offNOList.Count > 0)
            //    {
            //        for (int x = 0; x < offNOList.Count; x++)
            //        {
            //            int offNo = int.Parse(offNOList[x]);
            //            a = int.Parse(offNOList.Count.ToString());

            //        }


            //    }
            //}
            //command.Parameters.AddWithValue("@noOfPerson", a);
            command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport4.DataSource = ds.Tables[0];

            grdReport4.DataBind();

            con.Close();


        }

        protected void grdReport4_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport4.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn4") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport4.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void lnTotalIngredientsList_Click(object sender, EventArgs e)
        {

            //if (txtOffNoList.Text != "")
            //{
            int a = 0;

            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_getTotalIngredientsListForBite]";

            command.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
            command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
            //if (!string.IsNullOrEmpty(txtOffNoList.Text))
            //{
            //    List<string> offNOList = txtOffNoList.Text.Split(',').Reverse().ToList();
            //    if (offNOList.Count > 0)
            //    {
            //        for (int x = 0; x < offNOList.Count; x++)
            //        {
            //            int offNo = int.Parse(offNOList[x]);
            //            a = int.Parse(offNOList.Count.ToString());

            //        }
            //    }
            //}
            //command.Parameters.AddWithValue("@noOfPerson", a);
            //command.Parameters.AddWithValue("@noOfPerson", lblGroupMenuCount.Text);
            command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport5.DataSource = ds.Tables[0];

            grdReport5.DataBind();

            con.Close();
            //}
            //else
            //{
            //    Label15.Text = "Please Enter Official No.";
            //    Label15.ForeColor = System.Drawing.Color.Red;
            //}

            SaveT_MealItemsSaleBySA();
        }

        public void SaveT_MealItemsSaleBySA()
        {


            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            string date = dateMenuDate.SelectedDate.ToString();
            string reasonCode = cmbDescription.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();
            string vegiNonVegi = ddlVegi.SelectedItem.Text;
            string groupMenuCode = ddlGroupMenu.SelectedValue.ToString();

            dtSalebySA = itemObject.GetBiteTotalIng(strConnString, date, reasonCode, wardroomCode, vegiNonVegi, groupMenuCode);

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

                    cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    cmd.Parameters.AddWithValue("@reason", cmbDescription.SelectedValue.ToString());
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
                    //Label15.Visible = true;

                    //Label15.Text = "Update Success!";
                    //Label15.ForeColor = System.Drawing.Color.Green;

                }

                catch (Exception ex)
                {

                }
            }
        }

        protected void grdReport5_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport5.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn5") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport5.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void linkBtnGetInList_Click(object sender, EventArgs e)
        {
            if ((dateMenuDate.SelectedDate.ToString() == "") || (cmbDescription.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Date Cannot be Empty and Select Reason !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblError.Text = "";
                SetInitialRow1();

                //string Sport = ddlItem.SelectedValue.ToString();
                string date = dateMenuDate.SelectedDate.ToString();
                string wardroom = Session["wardRoomCode"].ToString();
                string reason = cmbDescription.SelectedValue.ToString();
                string menuType = ddlGroupMenu.SelectedValue.ToString();
                string vegNveg = ddlVegi.SelectedValue.ToString();

                dtGetDeductItems.Clear();

                //dtGetExItems = itemObject.GetExcItems(strConnString, Sport);
                dtGetDeductItems = itemObject.GetDeductItems_Group(strConnString, date, wardroom, reason, menuType, vegNveg);
                if (dtGetDeductItems.Rows.Count > 0)
                {
                    Session["ss"] = dtGetDeductItems;

                    bindserchdatagv1();
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

                    RadTextBox t = (RadTextBox)grdMedal0.Rows[k].FindControl("txtItemCode0");
                    RadTextBox t1 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtItem");
                    RadTextBox t2 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtFrom");
                    RadTextBox t3 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtPrice");
                    RadTextBox t4 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtMesu");
                    RadTextBox t5 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtOnChargeQty");
                    RadTextBox t6 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtID");

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
        }

        private void SetInitialRow1()
        {
            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();
            DataRow dr = null;

            dt1 = itemObject.GetDeductItems_Group(strConnString, dateMenuDate.SelectedDate.ToString(), wardRoomCode, cmbDescription.SelectedValue.ToString(), ddlGroupMenu.SelectedValue.ToString(), ddlVegi.SelectedValue.ToString());
            ViewState["CurrentTable"] = dt;


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



            grdMedal0.DataSource = dt1;
            grdMedal0.DataBind();
        }

        private void AddNewRowToGrid1()
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

                        RadTextBox box1 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[1].FindControl("txtItemCode");
                        RadTextBox box2 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[2].FindControl("txtItem");
                        RadTextBox box3 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[3].FindControl("txtFrom");
                        RadTextBox box4 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[3].FindControl("txtPrice");
                        RadTextBox box5 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[4].FindControl("txtOnChargeQty");
                        RadTextBox box6 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[5].FindControl("txtSaleQty");
                        RadTextBox box7 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[6].FindControl("txtCurrentQty");


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

                    grdMedal0.DataSource = dtCurrentTable;
                    grdMedal0.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }
            //Set Previous Data on Postbacks
            SetPreviousData1();
        }

        private void SetPreviousData1()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 1; i < dt.Rows.Count; i++)
                    {
                        RadTextBox box1 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[1].FindControl("txtItemCode");
                        RadTextBox box2 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[2].FindControl("txtItem");
                        RadTextBox box3 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[3].FindControl("txtFrom");
                        RadTextBox box4 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[3].FindControl("txtPrice");
                        RadTextBox box5 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[4].FindControl("txtOnChargeQty");
                        RadTextBox box6 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[5].FindControl("txtSaleQty");
                        RadTextBox box7 = (RadTextBox)grdMedal0.Rows[rowIndex].Cells[6].FindControl("txtCurrentQty");


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

        public void bindserchdatagv1()
        {
            dtGetDeductItems.Clear();
            //dtGetExItems = itemObject.GetExcItems(strConnString, ddlItem.SelectedValue.ToString());
            dtGetDeductItems = itemObject.GetDeductItems_Group(strConnString, dateMenuDate.SelectedDate.ToString(), Session["wardRoomCode"].ToString(), cmbDescription.SelectedValue.ToString(), ddlGroupMenu.SelectedValue.ToString(), ddlVegi.SelectedValue.ToString());

            if (dtGetDeductItems.Rows.Count > 0)
            {
                grdMedal0.DataSource = dtGetDeductItems;
                grdMedal0.DataBind();
            }
        }

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}