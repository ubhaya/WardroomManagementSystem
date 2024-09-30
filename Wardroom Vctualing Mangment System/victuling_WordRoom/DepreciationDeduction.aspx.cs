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
    public partial class DepreciationDeduction : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItems = new DataTable();
        public static DataTable dtGetSaleItemsQty = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtTotalMenuCost = new DataTable();
        public static DataTable dtTotalDepreciationCost = new DataTable();
        public static DataTable dtGetExItemsIndividual = new DataTable();

        public static int countval = 0;

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
                           string messu = row[4].ToString();
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

               protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
               {

               }

               protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
               {

               }

               protected void grdMedal_SelectedIndexChanged(object sender, EventArgs e)
               {

               }

               protected void btnNewItem_Click(object sender, EventArgs e)
               {

               }

               protected void btnGetHandStock_Click(object sender, EventArgs e)
               {
               //    if (ddlWardroom.SelectedItem.Text == "---Select---")
               //    {
               //        lblErrorWardRoom.Visible = true;
               //        lblErrorWardRoom.Text = "Select Wardroom !";
               //        lblErrorWardRoom.ForeColor = System.Drawing.Color.Red;
               //    }

               //    else
               //    {
                       lblErrorWardRoom.Text = "";

                       for (int i = 0; i < grdMedal.Rows.Count; i++)
                       {

                           RadTextBox txtsaleQty1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty"); ;

                           GridViewRow gvrow = (GridViewRow)txtsaleQty1.NamingContainer;
                           int rowid = gvrow.RowIndex;
                           RadTextBox txtsaleQty = (RadTextBox)grdMedal.Rows[rowid].FindControl("txtSaleQty");


                           RadTextBox txtitemId1 = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");

                           GridViewRow gvrow1 = (GridViewRow)txtitemId1.NamingContainer;
                           int rowid1 = gvrow1.RowIndex;
                           RadTextBox txtitemId = (RadTextBox)grdMedal.Rows[rowid1].FindControl("txtItemCode");

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
                   //}
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
                           insert_T_DepreciationItems();
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

                   //for (int i = 0; i < grdMedal.Rows.Count; i++)
                   //{
                       try
                       {

                           con.Open();
                           cmd.CommandType = CommandType.StoredProcedure;
                           cmd.CommandText = "[VICTULING_Update_T_StockQty_Depreciation]";

                           //RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");
                           //RadTextBox SaleQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtSaleQty");

                           //cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
                           //cmd.Parameters.AddWithValue("@currentStock", SaleQty.Text);
                           //cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

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
                  // }
               }

               public void insert_T_DepreciationItems()
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

                           Double cost = ((Convert.ToDouble(saleQty.Text)) * (Convert.ToDouble(unitPrice.Text)));


                           if (saleQty.Text != "")
                           {
                               con.Open();
                               cmd.CommandType = CommandType.StoredProcedure;
                               cmd.CommandText = "[VICTULING_insert_T_DepreciationItems]";

                               cmd.Parameters.AddWithValue("@depreciationDate", dateSaleDate.SelectedDate.ToString());
                               cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                               cmd.Parameters.AddWithValue("@depreciationQty", saleQty.Text);
                               cmd.Parameters.AddWithValue("@unitPrice", unitPrice.Text);
                               cmd.Parameters.AddWithValue("@price", cost);
                               cmd.Parameters.AddWithValue("@recevedFrom", recFrom.Text);
                               cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                               cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

                               cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                               cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                               cmd.Parameters.AddWithValue("@remarks", txtRemrks.Text);
                               cmd.Parameters.AddWithValue("@billNo", txtBillNo.Text);

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
                   lblDate.Visible = true;
                   lblReason.Visible = true;


                   if (dateSaleDate.SelectedDate != null)
                   {
                       DateTime dat = Convert.ToDateTime(dateSaleDate.SelectedDate.ToString());
                       lblDate.Text = dat.ToString("yyyy-MM-dd");
                   }

                   lblReason.Text = ddlReason.SelectedItem.Text;

                   con.Open();
                   SqlCommand command = new SqlCommand();
                   SqlDataAdapter adapter = new SqlDataAdapter();
                   DataSet ds = new DataSet();

                   command.Connection = con;
                   command.CommandType = CommandType.StoredProcedure;
                   command.CommandText = "[VICTULING_GetDepreciationItemList_OnDate]";

                   command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
                   command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate);
                   command.Parameters.AddWithValue("@reason", ddlReason.SelectedValue.ToString());
        

                   adapter = new SqlDataAdapter(command);
                   adapter.Fill(ds);

                   grdReport.DataSource = ds.Tables[0];

                   grdReport.DataBind();

                   con.Close();
               }

               public void GetTotalMenuCost()
               {
                   string date = dateSaleDate.SelectedDate.ToString();
                   string reasonCode = ddlReason.SelectedValue.ToString();
                   string wardroomCode = Session["wardRoomCode"].ToString();


                   dtTotalDepreciationCost = itemObject.GetTotalDepreciationCost(strConnString, date, reasonCode, wardroomCode);

                   if (dtTotalDepreciationCost.Rows.Count > 0)
                   {
                       Session["ss"] = dtTotalMenuCost;
                       Publishdata(dtTotalDepreciationCost, date, reasonCode, wardroomCode);
                   }
               }

               public void Publishdata(DataTable one, string date, string reasonCode, string wardroomCode)
               {

                   DataRow row = one.Rows[0];

                   xx.Clear();
                   xx = SearchTotalDepreciationCost(date, reasonCode, wardroomCode);

                   GetTotalCost(xx);
               }

               private DataSet SearchTotalDepreciationCost(string date, string reasonCode, string wardroomCode)
               {
                   SqlDataAdapter sqlda = new SqlDataAdapter();
                   DataSet dst = new DataSet();

                   string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                   SqlConnection con = new SqlConnection(ConnectionString);
                   SqlCommand cmd = new SqlCommand();
                   con.Open();
                   //cmd.Parameters.Clear();
                   cmd = new SqlCommand("[VICTULING_GetTotalDepreciationCost]", con);

                   cmd.CommandType = CommandType.StoredProcedure;

                   cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
                   cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
                   cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;
                   

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

               protected void dateSaleDate_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
               {

               }

               protected void btnSaveTotalCost_Click(object sender, EventArgs e)
               {
                  
               }

               protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
               {

               }

               protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
               {

               }

               protected void grdReport_ItemDataBound(object sender, GridItemEventArgs e)
               {

               }

               protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
               {

               }

        }
    }
