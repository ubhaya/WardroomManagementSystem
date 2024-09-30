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
    public partial class CustomizedMenuSale : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtAllMealCount = new DataTable();
        public static DataTable dtTeaCount = new DataTable();
        public static DataTable dtMealCategory = new DataTable();
        public static String wardRoomName, wardRoomCode;
        public static DataTable dtUpdateSportsGrid = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItems = new DataTable();
        public static DataTable dtGetSaleItemsQty = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtSalebySA = new DataTable();
        public static DataTable dtGetDeductItems = new DataTable();

        public static string nic = "";
        public static string OS = "";
        public static string nicNo_SSID = "";
        public static string officialNo = "";
        public static string serviceType = "";
        //public static DataTable dtGroupMenuNew = new DataTable();

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();

        public static int countval = 0;

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

            //dtWardroom = itemObject.GetWardroom(strConnString);
            //ddlWardroom.DataSource = dtWardroom;

            //ddlWardroom.DataTextField = "wardroomName";
            //ddlWardroom.DataValueField = "wardroomCode";
            //ddlWardroom.DataBind();

            //ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtMenuReason = itemObject.GetManuReason(strConnString);
            ddlReason.DataSource = dtMenuReason;

            ddlReason.DataTextField = "reason";
            ddlReason.DataValueField = "reasonCode";
            ddlReason.DataBind();
            ddlReason.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtMealCategory = itemObject.GetMealCategory(strConnString);
            ddlMealCat.DataSource = dtMealCategory;

            ddlMealCat.DataTextField = "mainItemCategory";
            ddlMealCat.DataValueField = "mainItemCategoryCode";
            ddlMealCat.DataBind();

            ddlMealCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = wardRoomName.ToString();

            //dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            //ddlGroupMenu.DataSource = dtGroupMenuNew;

            //ddlGroupMenu.DataTextField = "GroupMenu";
            //ddlGroupMenu.DataValueField = "GroupMenuCode";
            //ddlGroupMenu.DataBind();

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
            DataTable dt1 = new DataTable();
            DataRow dr = null;

            dt1 = itemObject.GetGroupMenu(strConnString, dateSaleDate.SelectedDate.ToString(), ddlReason.SelectedValue.ToString(), wardRoomCode, ddlGroupMenu.SelectedValue.ToString());
            ViewState["CurrentTable"] = dt;

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



            grdMedal.DataSource = dt1;
            grdMedal.DataBind();
        }

        private void SetInitialRow1()
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

            dtGetExItems = itemObject.GetExcItems(strConnString, ddlItem.SelectedValue.ToString());
            ViewState["CurrentTable"] = dt;

            grdMedal0.DataSource = dt;
            grdMedal0.DataBind();
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

        protected void btnView_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetCstomizeIndividualItems]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedItem.Text);
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());


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

        protected void btnAddMenuItem_Click(object sender, EventArgs e)
        {
            AddMenuItem_T_DailyMenu();
            Bind_T_DailyMenu();
            
        }

        public void AddMenuItem_T_DailyMenu()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            //for (int i = 0; i < grdMedal.Rows.Count; i++)
            //{
            try
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Save_DailyCustomizedMenuItems]";

                cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
                cmd.Parameters.AddWithValue("@mealCategory", ddlMealCat.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                if (ddlGroupMenu.SelectedItem.Text != "---Select---")
                {
                    cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@groupMenuCode", "");
                }
                cmd.Parameters.AddWithValue("@mainItemCode", ddlMeal.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
                cmd.Parameters.AddWithValue("@vegiNonVegi", ddlVeg.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                cmd.Parameters.AddWithValue("@isAuthorized", 1);
                cmd.Parameters.AddWithValue("@isActive", 1);

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                lblError.Visible = true;

                lblError.Text = "Insert Customized Meal Item to List!";
                lblError.ForeColor = System.Drawing.Color.Green;


            }

            catch (Exception ex)
            {
                //lbl_Errormsg.Visible = true;
                //lbl_Errormsg.Text = ex.Message;
            }

        }

        public void Bind_T_DailyMenu()
        {
            if ((txtWardRoom.Text == "---Select---") || (dateSaleDate.SelectedDate.ToString() == "") || (ddlReason.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Date Cannot be Empty and Select Wardroom and Reason !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                SetInitialRow();

                string Wardroom = wardRoomCode.ToString().Trim();
                string Description = ddlReason.SelectedValue.ToString();
                string GroupMenu = ddlGroupMenu.SelectedValue.ToString();

                string MenuDate = DateTime.Parse(dateSaleDate.SelectedDate.ToString()).Date.ToShortDateString();
                string[] codes = MenuDate.Split('/');
                string val = codes[2] + "-" + codes[0] + "-" + codes[1];

                dtUpdateSportsGrid.Clear();

                dtUpdateSportsGrid = itemObject.GetGroupMenu(strConnString, MenuDate, Description, Wardroom, GroupMenu);
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

            dtUpdateSportsGrid = itemObject.GetGroupMenu(strConnString, dateSaleDate.SelectedDate.ToString(), ddlReason.SelectedValue.ToString(), wardRoomCode.ToString().Trim(), ddlGroupMenu.SelectedValue.ToString());
            if (dtUpdateSportsGrid.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtUpdateSportsGrid.Rows)
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
            dtUpdateSportsGrid = itemObject.GetMenu(strConnString, dateSaleDate.SelectedDate.ToString(), ddlReason.SelectedValue.ToString(), wardRoomCode.ToString().Trim(), ddlGroupMenu.SelectedValue.ToString());

            if (dtUpdateSportsGrid.Rows.Count > 0)
            {
                grdMedal.DataSource = dtUpdateSportsGrid;
                grdMedal.DataBind();
            }
        }

        //public void bindserchdatagv1()
        //{
        //    dtGetExItems.Clear();
        //    dtGetExItems = itemObject.GetExcItems(strConnString, ddlItem.SelectedValue.ToString());

        //    if (dtGetExItems.Rows.Count > 0)
        //    {
        //        grdMedal0.DataSource = dtGetExItems;
        //        grdMedal0.DataBind();
        //    }
        //}

        public void bindserchdatagv1()
        {
            dtGetDeductItems.Clear();
            //dtGetExItems = itemObject.GetExcItems(strConnString, ddlItem.SelectedValue.ToString());
            dtGetDeductItems = itemObject.GetDeductItems(strConnString, dateSaleDate.SelectedDate.ToString(), Session["wardRoomCode"].ToString(), ddlReason.SelectedValue.ToString(), ddlGroupMenu.SelectedValue.ToString(), ddlVeg.SelectedValue.ToString());

            if (dtGetDeductItems.Rows.Count > 0)
            {
                grdMedal0.DataSource = dtGetDeductItems;
                grdMedal0.DataBind();
            }
        }

        public void ViewGropMenuIngredients()
        {

           

            DataTable dtb = new DataTable();
            dtb.Columns.Add("mainItem",typeof(string));
            dtb.Columns.Add("item",typeof(string));
            dtb.Columns.Add("qty",typeof(decimal));
            dtb.Columns.Add("itemMessurment",typeof(string));
            dtb.Columns.Add("Issueqty", typeof(decimal));
            DataRow dr;
                
            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
               
                int mealId;
                RadTextBox mealIdTxt = (RadTextBox)grdMedal.Rows[i].FindControl("txtMealID");
                mealId = Convert.ToInt32(mealIdTxt.Text);
                decimal a = 0;
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForCustomizedMenu]";

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

                            RadTextBox currenyQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtRemarks");

                            if (currenyQty.Text != "")
                            {
                                a=decimal.Parse(currenyQty.Text.ToString()) * int.Parse(offNOList.Count.ToString());
                                //command.Parameters.AddWithValue("@noOfPerson", ((decimal.Parse(currenyQty.Text.ToString())) * int.Parse(offNOList.Count.ToString())));
                            }
                            else
                            {
                                a=int.Parse(offNOList.Count.ToString());
                            }
                        }

                        //offNOList.Clear();
                    }
                }


                command.Parameters.AddWithValue("@noOfPerson",a);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVeg.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                command.Parameters.AddWithValue("@mealId", mealId);
                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);
                command.Parameters.Clear();

                for (int j =0 ; j< ds.Tables[0].Rows.Count; j++)
                {
                dr = dtb.NewRow();
                dr["mainItem"]= ds.Tables[0].Rows[j]["mainItem"].ToString();
                dr["item"] = ds.Tables[0].Rows[j]["item"].ToString();
                dr["qty"] = Convert.ToDecimal ( ds.Tables[0].Rows[j]["qty"].ToString());
                dr["itemMessurment"] = ds.Tables[0].Rows[j]["itemMessurment"].ToString();
                dr["Issueqty"] = Convert.ToDecimal( ds.Tables[0].Rows[j]["Issueqty"].ToString());
                dtb.Rows.Add(dr);
                }
                con.Close();

            }

            grdReport4.DataSource = dtb;

            grdReport4.DataBind();
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

       

        protected void grdReport4_ItemDataBound1(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport4.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn4") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport4.PageCount) + e.Item.ItemIndex + 1);
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
                SetInitialRow1();

                string Sport = ddlItem.SelectedValue.ToString();

                dtGetExItems.Clear();

                dtGetExItems = itemObject.GetExcItems(strConnString, Sport);
                if (dtGetExItems.Rows.Count > 0)
                {
                    Session["ss"] = dtGetExItems;

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

            dtGetExItems = itemObject.GetExcItems(strConnString,ddlItem.SelectedValue.ToString());
            if (dtGetExItems.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtGetExItems.Rows)
                {

                    string itemCode = row[0].ToString();
                    string item = row[1].ToString();
                    string from = row[2].ToString();
                    string price = row[3].ToString();
                    string messu = row[4].ToString();
                    string stock = row[5].ToString();


                    RadTextBox t = (RadTextBox)grdMedal0.Rows[k].FindControl("txtItemCode");
                    RadTextBox t1 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtItem");
                    RadTextBox t2 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtFrom");
                    RadTextBox t3 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtPrice");
                    RadTextBox t4 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtMesu");
                    RadTextBox t5 = (RadTextBox)grdMedal0.Rows[k].FindControl("txtOnChargeQty");

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

        protected void btnGetHandStock_Click(object sender, EventArgs e)
        {
            //getHandStock();
            //GetTotalCurrentStock();
            getItemDeductItem();

            btnUpdateStock.Visible = true;
        }

        public void getItemDeductItem()
        {
            Decimal currentQty = 0;

            for (int p = 0; p < grdReport2.Items.Count; p++)
            {

                String itemCode1 = grdReport2.Items[p].Cells[6].Text;
                Decimal SaleQty = Convert.ToDecimal(grdReport2.Items[p].Cells[4].Text);

                for (int n = 0; n < grdMedal0.Rows.Count; n++)
                {

                    RadTextBox t = (RadTextBox)grdMedal0.Rows[n].FindControl("txtItemCode");
                    string itemCode = t.Text;
                    RadTextBox t5 = (RadTextBox)grdMedal0.Rows[n].FindControl("txtOnChargeQty");
                    String stock = t5.Text;

                    if (itemCode == itemCode1)
                    {
                        if (Convert.ToDecimal(stock) > SaleQty)
                        {
                            RadTextBox t7 = (RadTextBox)grdMedal0.Rows[n].FindControl("txtSaleQty");
                            RadTextBox t8 = (RadTextBox)grdMedal0.Rows[n].FindControl("txtCurrentQty");
                            currentQty = Convert.ToDecimal(stock) - SaleQty;
                            t7.Text = SaleQty.ToString();
                            t8.Text = currentQty.ToString();
                            break;

                        }

                        if (Convert.ToDecimal(stock) < SaleQty)
                        {
                            RadTextBox t7 = (RadTextBox)grdMedal0.Rows[n].FindControl("txtSaleQty");
                            RadTextBox t8 = (RadTextBox)grdMedal0.Rows[n].FindControl("txtCurrentQty");

                            currentQty = (Convert.ToDecimal(stock)) - SaleQty;
                            t7.Text = SaleQty.ToString();
                            t8.Text = currentQty.ToString();
                            RadTextBox t7_1 = (RadTextBox)grdMedal0.Rows[n + 1].FindControl("txtSaleQty");


                            SaleQty = -1 * currentQty;

                            if (currentQty < 0)
                            {
                                t8.Text = "0.000";
                            }

                        }

                    }
                }

            }


            for (int n = 0; n < grdMedal0.Rows.Count; n++)
            {

                RadTextBox t = (RadTextBox)grdMedal0.Rows[n].FindControl("txtItemCode");
                string itemCode = t.Text;
                RadTextBox t5 = (RadTextBox)grdMedal0.Rows[n].FindControl("txtOnChargeQty");
                String stock = t5.Text;


                RadTextBox t7 = (RadTextBox)grdMedal0.Rows[n].FindControl("txtSaleQty");
                RadTextBox t8 = (RadTextBox)grdMedal0.Rows[n].FindControl("txtCurrentQty");

                if (t7.Text == "")
                {
                    t7.Text = "0.000";
                    t8.Text = stock.ToString();

                }

            }
        }

        public void getHandStock()
        {

            for (int i = 0; i < grdMedal0.Rows.Count; i++)
            {

                RadTextBox txtsaleQty1 = (RadTextBox)grdMedal0.Rows[i].FindControl("txtSaleQty"); ;

                GridViewRow gvrow = (GridViewRow)txtsaleQty1.NamingContainer;
                int rowid = gvrow.RowIndex;
                RadTextBox txtsaleQty = (RadTextBox)grdMedal0.Rows[rowid].FindControl("txtSaleQty");


                RadTextBox txtitemId1 = (RadTextBox)grdMedal0.Rows[i].FindControl("txtItemCode");

                GridViewRow gvrow1 = (GridViewRow)txtitemId1.NamingContainer;
                int rowid1 = gvrow1.RowIndex;
                RadTextBox txtitemId = (RadTextBox)grdMedal0.Rows[rowid1].FindControl("txtItemCode");

                RadTextBox txtitemCode1 = (RadTextBox)grdMedal0.Rows[i].FindControl("txtID");

                GridViewRow gvrow3 = (GridViewRow)txtitemId1.NamingContainer;
                int rowid3 = gvrow3.RowIndex;
                RadTextBox txtitemCode = (RadTextBox)grdMedal0.Rows[rowid1].FindControl("txtID");

                dtGetSaleItemsQty.Clear();
                //dtGetSaleItemsQty = itemObject.GetSaleItemsQty(strConnString, ddlItem.SelectedValue.ToString(), txtsaleQty.Text, txtitemId.Text);
                dtGetSaleItemsQty = itemObject.GetSaleItemsQty(strConnString, txtitemId.Text, txtsaleQty.Text, txtitemCode.Text);

                RadTextBox txtCurrentQty1 = (RadTextBox)grdMedal0.Rows[i].FindControl("txtCurrentQty");
                txtCurrentQty1.Text = dtGetSaleItemsQty.Rows[0][7].ToString();
                GridViewRow gvrow2 = (GridViewRow)txtitemId1.NamingContainer;
                int rowid2 = gvrow1.RowIndex;
                RadTextBox txtCurrentQty = (RadTextBox)grdMedal0.Rows[rowid2].FindControl("txtCurrentQty");

               

           
                    

            }
        }

        public void GetTotalCurrentStock()
        {

            double sum = 0;
            for (int i = 0; i < grdMedal0.Rows.Count; i++)
            {

                RadTextBox txtCurrentQty = (RadTextBox)grdMedal0.Rows[i].FindControl("txtCurrentQty");

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

                                lblMsg.Text = "Daily Extra Sales Updation Successful";
                                lblMsg.ForeColor = System.Drawing.Color.Green;
                            }

                            offNOList.Clear();
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Enter Official Number/s";
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                    }

                    Label19.Text = "Update Successful";
                    Label19.ForeColor = System.Drawing.Color.Green;

                    // ViewSaleMenuItem();
                

              
        }

        public void update_T_stock_Table()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal0.Rows.Count; i++)
            {
                try
                {

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_Stock]";
                    //RadTextBox itemId = (RadTextBox)grdMedal0.Rows[i].FindControl("txtItemCode");
                    //RadTextBox itemCode = (RadTextBox)grdMedal.Rows[i].FindControl("txtItem");
                    //RadTextBox currenyQty = (RadTextBox)grdMedal0.Rows[i].FindControl("txtCurrentQty");

                    RadTextBox Id = (RadTextBox)grdMedal0.Rows[i].FindControl("txtID");
                    RadTextBox itemId = (RadTextBox)grdMedal0.Rows[i].FindControl("txtItemCode");
                    RadTextBox recFrom = (RadTextBox)grdMedal0.Rows[i].FindControl("txtFrom");
                    RadTextBox unitPrice = (RadTextBox)grdMedal0.Rows[i].FindControl("txtPrice");
                    RadTextBox currenyQty = (RadTextBox)grdMedal0.Rows[i].FindControl("txtCurrentQty");

                    //cmd.Parameters.AddWithValue("@itemId", itemId.Text);
                    //cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                    //cmd.Parameters.AddWithValue("@CurrentQty", currenyQty.Text);

                    cmd.Parameters.AddWithValue("@itemId", Id.Text);
                    cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
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

            for (int i = 0; i < grdMedal0.Rows.Count; i++)
            {
                try
                {

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_StockQty]";

                    RadTextBox itemId = (RadTextBox)grdMedal0.Rows[i].FindControl("txtItemCode");
                    RadTextBox SaleQty = (RadTextBox)grdMedal0.Rows[i].FindControl("txtSaleQty");

                    cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
                    cmd.Parameters.AddWithValue("@currentStock", SaleQty.Text);
                    cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

                    //cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                    //cmd.Parameters.AddWithValue("@currentStock", lblCurrent.Text);
                    //cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

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

        public void insert_T_DailyExtraSales(string offNo, int officerCount)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal0.Rows.Count; i++)
            {
                try
                {
                    RadTextBox itemId = (RadTextBox)grdMedal0.Rows[i].FindControl("txtID");
                    RadTextBox txtItemCode = (RadTextBox)grdMedal0.Rows[i].FindControl("txtItemCode");
                    RadTextBox saleQty = (RadTextBox)grdMedal0.Rows[i].FindControl("txtSaleQty");
                    RadTextBox messurment = (RadTextBox)grdMedal0.Rows[i].FindControl("txtMesu");
                    RadTextBox unitPrice = (RadTextBox)grdMedal0.Rows[i].FindControl("txtPrice");
                    RadTextBox recevedFrom = (RadTextBox)grdMedal0.Rows[i].FindControl("txtFrom");

                    if (saleQty.Text != "")
                    {
                        //decimal saleQtyperPerson = (decimal.Parse(saleQty.Text.ToString()));
                        decimal saleQtyperPerson = (decimal.Parse(saleQty.Text.ToString()) / officerCount);
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_insert_T_DailyExtraSales_Individual]";

                        cmd.Parameters.AddWithValue("@saleDate", dateSaleDate.SelectedDate.ToString());
                        cmd.Parameters.AddWithValue("@itemCode", txtItemCode.Text);
                        cmd.Parameters.AddWithValue("@itemId", itemId.Text);
                        cmd.Parameters.AddWithValue("@saleQty", saleQtyperPerson.ToString());
                        cmd.Parameters.AddWithValue("@unitPrice", unitPrice.Text);
                        cmd.Parameters.AddWithValue("@TotalCost", lblCurrent.Text);
                        cmd.Parameters.AddWithValue("@recevedFrom", recevedFrom.Text);
                        cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@offNo", offNo);
                        cmd.Parameters.AddWithValue("@officerSailor", "O");
                        cmd.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@currentBase", Session["wardRoomName"].ToString());
                        cmd.Parameters.AddWithValue("@permantBase", lblPermanentBase.Text);
                        cmd.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());

                        cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                        cmd.Parameters.AddWithValue("@takenBy", "");
                        cmd.Parameters.AddWithValue("@offNoSailor", "");
                        cmd.Parameters.AddWithValue("@serviceTypeSailor", "");
                        cmd.Parameters.AddWithValue("@osSailor", "");
                        cmd.Parameters.AddWithValue("@rankRate", "");

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

        protected void txtOffNoList_TextChanged(object sender, EventArgs e)
        {
            //getName();
        }

        public void getName()
        {
            string off = txtOffNoList.Text;
            string OSType = ddlOfficerSailor.SelectedItem.Text;
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
                //if (0 < (personal.Tables[0].Rows.Count))
                //{
                //    imgPerson.ImageUrl = personal.Tables[0].Rows[0]["image"].ToString();
                //}


                //if (0 < (personal.Tables[0].Rows.Count))
                //{
                //    lblNic.Text = personal.Tables[0].Rows[0]["nicNo_SSID"].ToString();
                //}
                //else
                //{
                //    lblNic.Text = "No Data";
                //}

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

        protected void btnRemoveMenuItems_Click(object sender, EventArgs e)
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

                    cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@mainItemCode", mealID.Text);
                    cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
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

        protected void ViewIngredientsList_Click(object sender, EventArgs e)
        {
            ViewGropMenuIngredients();
        }

        protected void lnTotalIngredientsList_Click(object sender, EventArgs e)
        {
           

            //DataTable dtb = new DataTable();
            //dtb.Columns.Add("mainItem", typeof(string));
            //dtb.Columns.Add("item", typeof(string));
            //dtb.Columns.Add("qty", typeof(decimal));
            //dtb.Columns.Add("itemMessurment", typeof(string));
            //dtb.Columns.Add("Issueqty", typeof(decimal));
            //DataRow dr;

            //for (int i = 0; i < grdMedal.Rows.Count; i++)
            //{

            //    //int mealId;
            //    //RadTextBox mealIdTxt = (RadTextBox)grdMedal.Rows[i].FindControl("txtMealID");
            //    //mealId = Convert.ToInt32(mealIdTxt.Text);
            //    decimal a = 0;

            //    con.Open();
            //    SqlCommand command = new SqlCommand();
            //    SqlDataAdapter adapter = new SqlDataAdapter();
            //    DataSet ds = new DataSet();

            //    command.Connection = con;
            //    command.CommandType = CommandType.StoredProcedure;
            //    command.CommandText = "[VICTULING_getIngredientsListForCustomizedMenu_Tot]";

            //    command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
            //    command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            //    command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());

            //    if (!string.IsNullOrEmpty(txtOffNoList.Text))
            //    {
            //        List<string> offNOList = txtOffNoList.Text.Split(',').Reverse().ToList();
            //        if (offNOList.Count > 0)
            //        {
            //            for (int x = 0; x < offNOList.Count; x++)
            //            {
            //                int offNo = int.Parse(offNOList[x]);

            //                RadTextBox currenyQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtRemarks");

            //                if (currenyQty.Text != "")
            //                {
            //                    a = decimal.Parse(currenyQty.Text.ToString()) * int.Parse(offNOList.Count.ToString());
            //                    //command.Parameters.AddWithValue("@noOfPerson", ((decimal.Parse(currenyQty.Text.ToString())) * int.Parse(offNOList.Count.ToString())));
            //                }
            //                else
            //                {
            //                    a = int.Parse(offNOList.Count.ToString());
            //                }
            //            }

            //            //offNOList.Clear();
            //        }
            //    }


            //    command.Parameters.AddWithValue("@noOfPerson", a);

            //    command.Parameters.AddWithValue("@vegiNonVegi", ddlVeg.SelectedItem.Text);
            //    command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
            //    //command.Parameters.AddWithValue("@mealId", mealId);
            //    adapter = new SqlDataAdapter(command);
            //    adapter.Fill(ds);

            //    //for (int j = 0; j < ds.Tables[0].Rows.Count; j++)
            //    //{
            //    //    dr = dtb.NewRow();
            //    //    //dr["mainItem"] = ds.Tables[0].Rows[j]["mainItem"].ToString();
            //    //    dr["item"] = ds.Tables[0].Rows[j]["item"].ToString();
            //    //    dr["qty"] = Convert.ToDecimal(ds.Tables[0].Rows[j]["qty"].ToString());
            //    //    dr["itemMessurment"] = ds.Tables[0].Rows[j]["itemMessurment"].ToString();
            //    //    //dr["Issueqty"] = Convert.ToDecimal(ds.Tables[0].Rows[j]["Issueqty"].ToString());
            //    //    dtb.Rows.Add(dr);
            //    //}
            //    con.Close();

            //}

            //grdReport2.DataSource = dtb;

            //grdReport2.DataBind();


            if (txtOffNoList.Text != "")
            {
                for (int i = 0; i < grdMedal.Rows.Count; i++)
                {
                decimal a = 0;

                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForCustomizedMenu_Tot]";

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

                            RadTextBox currenyQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtRemarks");

                            if (currenyQty.Text != "")
                            {
                                a = decimal.Parse(currenyQty.Text.ToString()) * int.Parse(offNOList.Count.ToString());
                                //command.Parameters.AddWithValue("@noOfPerson", ((decimal.Parse(currenyQty.Text.ToString())) * int.Parse(offNOList.Count.ToString())));
                            }
                            else
                            {
                                a = int.Parse(offNOList.Count.ToString());
                            }
                        }

                        //offNOList.Clear();
                    }
                }


                command.Parameters.AddWithValue("@noOfPerson", a);

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

                command.Parameters.AddWithValue("@vegiNonVegi", ddlVeg.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport2.DataSource = ds.Tables[0];

                grdReport2.DataBind();

                con.Close();
            }
        }
            else
            {
                Label15.Text = "Please Enter Official No.";
                Label15.ForeColor = System.Drawing.Color.Red;
            }

            SaveT_MealItemsSaleBySA();

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
                string vegiNonVegi = ddlVeg.SelectedItem.Text;
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
                        cmd.Parameters.AddWithValue("@vegNveg", ddlVeg.SelectedValue.ToString());

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

        protected void grdReport2_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport2.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport2.PageCount) + e.Item.ItemIndex + 1);
            }
        }


        public void ViewSaleMenuItem()
        {
            //lblDate.Visible = true;
            //lblReason.Visible = true;


            //if (dateSaleDate.SelectedDate != null)
            //{
            //    DateTime dat = Convert.ToDateTime(dateSaleDate.SelectedDate.ToString());
            //    lblDate.Text = dat.ToString("yyyy-MM-dd");
            //}

            //lblReason.Text = ddlReason.SelectedItem.Text;
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((dateSaleDate.SelectedDate.ToString() != "") || (ddlReason.SelectedItem.Text != "---Select---"))
            {
                ViewSaleMenuItem();
            }

            else
            {
                Label16.Text = "Please select Date and Reason !";
                Label16.ForeColor = System.Drawing.Color.Red;
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

        protected void grdReport_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void LkBtnTot_Click(object sender, EventArgs e)
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
                SetInitialRow1();

                //string Sport = ddlItem.SelectedValue.ToString();
                string date = dateSaleDate.SelectedDate.ToString();
                string wardroom = Session["wardRoomCode"].ToString();
                string reason = ddlReason.SelectedValue.ToString();
                string menuType = ddlGroupMenu.SelectedValue.ToString();
                string vegNveg = ddlVeg.SelectedValue.ToString();

                dtGetDeductItems.Clear();

                //dtGetExItems = itemObject.GetExcItems(strConnString, Sport);
                dtGetDeductItems = itemObject.GetDeductItems(strConnString, date, wardroom, reason, menuType, vegNveg);
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

                    RadTextBox t = (RadTextBox)grdMedal0.Rows[k].FindControl("txtItemCode");
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

            btnUpdateStock.Visible = false;
        }

       
    }
}