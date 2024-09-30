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
using CrystalDecisions.CrystalReports.Engine;


//using WebApplication1.TrainingManagment.ExamCenter;
//using WebApplication1.TrainingManagment.CourseSelection;

namespace victuling_WordRoom
{
    public partial class IndividualSaleNew : System.Web.UI.Page
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
        public static DataTable dtGetExItemsIndividual = new DataTable();
        public static DataTable dtGetSaleItemsQty_Indi = new DataTable();

        public static int countval = 0;

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

           
            //wardRoomName = Session["wardRoomName"].ToString();
            //wardRoomCode = Session["wardRoomCode"].ToString();
        }

        public void LoadBasic()
        {
            txtWardRoom.Text = Session["wardRoomName"].ToString();

            //dtWardroom = itemObject.GetWardroom(strConnString);
            //txtWardRoom.Text = wardRoomName.ToString();

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

            dtBaseAll = itemObject.GetAllBase(strConnString2);
            ddlBaseAll.DataSource = dtBaseAll;

            ddlBaseAll.DataTextField = "baseDescription";
            ddlBaseAll.DataValueField = "baseCode";
            ddlBaseAll.DataBind();

            //ddlBaseAll.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void ddlItem_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
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

                    string itemCode = row[0].ToString();
                    string item = row[1].ToString();
                    string from = row[2].ToString();
                    string price = row[3].ToString();
                    string messu = row[5].ToString();
                    string stock = row[4].ToString();
                    string toOff = row[7].ToString();

                    RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtItemCode");
                    RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItem");
                    RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtFrom");
                    RadTextBox t3 = (RadTextBox)grdMedal.Rows[k].FindControl("txtPrice");
                    RadTextBox t4 = (RadTextBox)grdMedal.Rows[k].FindControl("txtMesu");
                    RadTextBox t5 = (RadTextBox)grdMedal.Rows[k].FindControl("txtOnChargeQty");
                    RadTextBox t6 = (RadTextBox)grdMedal.Rows[k].FindControl("txtToOff");

                    t.Text = itemCode;
                    t1.Text = item;
                    t2.Text = from;
                    t3.Text = price;
                    t4.Text = messu;
                    t5.Text = stock;
                    t6.Text = toOff;

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

        protected void btnGetHandStock_Click(object sender, EventArgs e)
        {
            if (txtWardRoom.Text == "")
            {
                lblErrorWardRoom.Visible = true;
                lblErrorWardRoom.Text = "Select Wardroom !";
                lblErrorWardRoom.ForeColor = System.Drawing.Color.Red;
            }

            else
            {
                lblErrorWardRoom.Text = "";

                for (int i = 0; i < grdMedal.Rows.Count; i++)
                {

                    RadTextBox txtsaleQty1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty"); 

                    GridViewRow gvrow = (GridViewRow)txtsaleQty1.NamingContainer;
                    int rowid = gvrow.RowIndex;
                    RadTextBox txtsaleQty = (RadTextBox)grdMedal.Rows[rowid].FindControl("txtSaleQty");


                    RadTextBox txtitemId1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");

                    GridViewRow gvrow1 = (GridViewRow)txtitemId1.NamingContainer;
                    int rowid1 = gvrow1.RowIndex;
                    RadTextBox txtitemId = (RadTextBox)grdMedal.Rows[rowid1].FindControl("txtItemCode");


                    dtGetSaleItemsQty_Indi.Clear();
                    dtGetSaleItemsQty_Indi = itemObject.GetSaleItemsQty_Individual(strConnString, txtitemId.Text, txtsaleQty.Text);
                   

                    RadTextBox txtCurrentQty1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");
                    txtCurrentQty1.Text = dtGetSaleItemsQty_Indi.Rows[0][7].ToString();
                    GridViewRow gvrow2 = (GridViewRow)txtitemId1.NamingContainer;
                    int rowid2 = gvrow1.RowIndex;
                    RadTextBox txtCurrentQty = (RadTextBox)grdMedal.Rows[rowid2].FindControl("txtCurrentQty");



                }
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

            float sum = 0;
            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {

                RadTextBox txtCurrentQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");

                if (txtCurrentQty.Text != "")
                {
                    sum += float.Parse(txtCurrentQty.Text);

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
                    insert_T_DailyExtraSales();

                    ViewSaleMenuItem();
                


              
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
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@groupMenuCode", "70000023");
            //command.Parameters.AddWithValue("@NewBillID", Session["wardRoomName"].ToString().Trim() + dateSaleDate.SelectedDate.ToString() + txtBillNo.Text);

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

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_Stock]";
                    RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");
                    //RadTextBox itemCode = (RadTextBox)grdMedal.Rows[i].FindControl("txtItem");
                    RadTextBox currenyQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtCurrentQty");

                    cmd.Parameters.AddWithValue("@itemId", itemId.Text);
                    cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
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
                    //cmd.CommandText = "[VICTULING_Update_T_StockQty]";
                    cmd.CommandText = "[VICTULING_Update_T_StockQty_Individual]";

                    cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@currentStock", lblCurrent.Text);
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

        public void insert_T_DailyExtraSales()
        {
            string billNo = "";
            //create bill no
            Class1 getBill = new Class1();
            billNo = getBill.GetbillCode(strConnString, ddlWardroom.SelectedValue.ToString());

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            
            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {
                    RadTextBox itemID = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");
                    RadTextBox saleQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty");
                    RadTextBox messurment = (RadTextBox)grdMedal.Rows[i].FindControl("txtMesu");
                    RadTextBox unitPrice = (RadTextBox)grdMedal.Rows[i].FindControl("txtPrice");
                    RadTextBox recevedFrom = (RadTextBox)grdMedal.Rows[i].FindControl("txtFrom");
                    Double TotalCost = 0;
                    if (saleQty.Text != "")
                    {
                        TotalCost = Convert.ToDouble(saleQty.Text) * Convert.ToDouble(unitPrice.Text);

                        //else if (saleQty.Text == "")
                        //{
                        //    saleQty.Text = "0";
                        //    TotalCost = Convert.ToDouble(saleQty.Text) * Convert.ToDouble(unitPrice.Text);
                        //}

                        //if (saleQty.Text != "")
                        //{

                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_insert_T_DailyExtraSales_Individual]";

                        cmd.Parameters.AddWithValue("@saleDate", dateSaleDate.SelectedDate.ToString());
                        cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@itemId", itemID.Text);
                        cmd.Parameters.AddWithValue("@saleQty", saleQty.Text);
                        cmd.Parameters.AddWithValue("@unitPrice", unitPrice.Text);
                        cmd.Parameters.AddWithValue("@TotalCost", TotalCost.ToString());
                        cmd.Parameters.AddWithValue("@recevedFrom", recevedFrom.Text);
                        cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@groupMenuCode", "70000023");
                        cmd.Parameters.AddWithValue("@offNo", txtOfficialNo.Text);
                        cmd.Parameters.AddWithValue("@officerSailor", ddlOfficerSailor.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@currentBase", ddlBaseAll.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@permantBase", lblPermanentBase.Text);
                        cmd.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                        cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                        //cmd.Parameters.AddWithValue("@billNo", billNo);
                        //cmd.Parameters.AddWithValue("@isPrinted", 'N');

                        cmd.Parameters.AddWithValue("@takenBy", lblName.Text);
                        cmd.Parameters.AddWithValue("@offNoSailor", txtOffNoSailor.Text);
                        cmd.Parameters.AddWithValue("@serviceTypeSailor", ddlServiceType0.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@osSailor", ddlOfficerSailor0.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@rankRate", lblRate.Text);
                        cmd.Parameters.AddWithValue("@NewBillID", Session["wardRoomName"].ToString().Trim() + dateSaleDate.SelectedDate.ToString() + txtBillNo.Text);

                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        con.Close();
                        lblError.Visible = true;

                        lblError.Text = "Update Success!";
                        lblError.ForeColor = System.Drawing.Color.Green;

                        //insert To bill table

                    }
                    }
                //}

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }

            }
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

        protected void ddlOfficerSailor_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

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
            //cmd.ExecuteNonQuery();
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

        protected void dateSaleDate_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        {

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
                string qty = x["saleQty"].Text.ToString();
                string recFrom = x["recevedFrom"].Text.ToString();


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

        protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

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

        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("IndividualSale.aspx");
        }

        protected void linkBtnPrint_Click(object sender, EventArgs e)
        {

            DateTime dt = DateTime.Parse(dateSaleDate.SelectedDate.ToString());
            String on = txtOfficialNo.Text;
            string os = ddlOfficerSailor.SelectedValue.ToString();
            string wr = ddlWardroom.SelectedValue.ToString();

            Response.Redirect("PrintIndividualIssues.aspx?on=" + on + "&os=" + os + "&dt=" + dt + "&wr=" + wr + "");
        }

        protected void txtWardRoom_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            string off = txtOffNoSailor.Text;
            string OSType = ddlOfficerSailor0.SelectedItem.Text.ToString();
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

                    PublishdataName(dtOfficerSailor);

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

                    PublishdataName(dtOfficerSailor);
                    lblError.Text = "";
                }
                else
                {
                    lblError.Text = "No data found";
                }
            }
        }

        public void PublishdataName(DataTable one)
        {

            DataRow row = one.Rows[0];
            nicNo_SSID = row["nicNo_SSID"].ToString();
            officialNo = row["officialNo"].ToString();
            serviceType = row["serviceType"].ToString();

            xx.Clear();
            xx = SearchPesonalDeatailBySelectedNew(nicNo_SSID, officialNo, OS, serviceType);
            GetPersonalDataName(xx);
            //btnBack.Visible = true;
        }

        public void GetPersonalDataName(DataSet xy)
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
                    lblRate.Text = personal.Tables[16].Rows[0]["description"].ToString();
                }
                else
                {
                    lblRate.Text = "No Data";
                }

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblName.Text = personal.Tables[0].Rows[0]["fullName"].ToString();
                }
                else
                {
                    lblName.Text = "No Data";
                }

                if (0 < (personal.Tables[20].Rows.Count))
                {
                    lblBase.Text = personal.Tables[20].Rows[0]["baseName"].ToString();
                }
                else
                {
                    lblBase.Text = "No Data";
                }


            }



        }

        protected void btnPrintBill_Click(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //{

            //    CrystalReportViewer1.ReportSource = (ReportDocument)Session["Report"];
            //    CrystalReportViewer1.RefreshReport();
            //    CrystalReportViewer1.DataBind();

            //}


            //DataSet dataset = new DataSet();
            //test1 rptDoc = new test1();
            //CrystalReportViewer1.ReportSource = rptDoc;
            //SqlCommand myCommand = new SqlCommand("[VICTULING_PrintIndividualSaleItem]");
            //myCommand.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            //myCommand.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate.ToString());
            //myCommand.Parameters.AddWithValue("@offNo", txtOfficialNo.Text);
            //myCommand.Parameters.AddWithValue("@serviceType", ddlServiceType.Text);

            //myCommand.CommandType = CommandType.StoredProcedure;
            //myCommand.Connection = con;
            //SqlDataAdapter da = new SqlDataAdapter(myCommand);
            //da.Fill(dataset);
            //ReportDocument rptDoc2 = new ReportDocument();
            //rptDoc2.Load(Server.MapPath("printBill.rpt"));
            //rptDoc2.SetDataSource(dataset.Tables[0]);
            //Session["Report"] = rptDoc2;
            //CrystalReportViewer1.ReportSource = rptDoc2;
            //CrystalReportViewer1.RefreshReport();
            //CrystalReportViewer1.DataBind();

            Response.Redirect("Print_CR_Bill.aspx");
            //ReportDocument rptDoc2 = new ReportDocument();
            //rptDoc2.Load(Server.MapPath("CrystalReport2.rpt"));                   
            //CrystalReportViewer1.ReportSource = rptDoc2;
            //CrystalReportViewer1.RefreshReport();
            //CrystalReportViewer1.DataBind();
            //CrystalReport2.rpt
        }

        protected void ddlServiceType_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

    }
}