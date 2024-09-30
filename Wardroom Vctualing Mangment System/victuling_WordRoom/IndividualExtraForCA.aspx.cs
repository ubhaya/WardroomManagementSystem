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
    public partial class IndividualExtraForCA : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItems = new DataTable();
        public static DataTable dtGetExItemsExtraByCA = new DataTable();
        public static DataTable dtMenuReason = new DataTable();        
        public static int countval = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();
                SetInitialRow();
            }
        }

        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("OffNo", typeof(string)));
            dt.Columns.Add(new DataColumn("ServiceType", typeof(string)));
            dt.Columns.Add(new DataColumn("ItemCode", typeof(string)));
            dt.Columns.Add(new DataColumn("Item", typeof(string)));
            dt.Columns.Add(new DataColumn("Cqty", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
            dt.Columns.Add(new DataColumn("Measurement", typeof(string)));
            dt.Columns.Add(new DataColumn("id", typeof(string)));

            dr = dt.NewRow();

            dr["OffNo"] = string.Empty;
            dr["ServiceType"] = string.Empty;
            dr["ItemCode"] = string.Empty;
            dr["Item"] = string.Empty;
            dr["Cqty"] = string.Empty;
            dr["Quantity"] = string.Empty;
            dr["Measurement"] = string.Empty;
            dr["id"] = string.Empty;

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
                        RadTextBox box1 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[1].FindControl("txtOff");
                        RadComboBox box2 = (RadComboBox)grdMedal.Rows[rowIndex].Cells[2].FindControl("txtSer");
                        RadTextBox box3 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[3].FindControl("txtItemCode");
                        RadTextBox box4 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("txtItem");
                        RadTextBox box5 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[5].FindControl("txtQty");
                        RadTextBox box6 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[6].FindControl("txtQuantity");
                        RadTextBox box7 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[7].FindControl("cmbmeasurement");
                        RadTextBox box8 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[7].FindControl("txtID");

                        drCurrentRow = dtCurrentTable.NewRow();

                        drCurrentRow["OffNo"] = box1.Text;
                        drCurrentRow["ServiceType"] = box2.Text;
                        drCurrentRow["ItemCode"] = box3.Text;
                        drCurrentRow["Item"] = box4.Text;
                        drCurrentRow["Cqty"] = box5.Text;
                        drCurrentRow["Quantity"] = box6.Text;
                        drCurrentRow["Measurement"] = box7.Text;
                        drCurrentRow["id"] = box7.Text;

                        rowIndex++;
                    }

                    dtCurrentTable.Rows.Add(drCurrentRow);
                    for (int i = 1; i < countval - 1; i++)
                    {
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["OffNo"] = string.Empty;
                        drCurrentRow["ServiceType"] = string.Empty;
                        drCurrentRow["ItemCode"] = string.Empty;
                        drCurrentRow["Item"] = string.Empty;
                        drCurrentRow["Cqty"] = string.Empty;
                        drCurrentRow["Quantity"] = string.Empty;
                        drCurrentRow["Measurement"] = string.Empty;
                        drCurrentRow["id"] = string.Empty;

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
                        RadTextBox box3 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[1].FindControl("txtItemCode");
                        RadTextBox box4 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[2].FindControl("txtItem");
                        RadTextBox box5 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[2].FindControl("txtQty");
                        RadTextBox box6 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("txtQuantity");
                        RadTextBox box7 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("cmbmeasurement");
                        RadTextBox box8 = (RadTextBox)grdMedal.Rows[rowIndex].Cells[4].FindControl("txtID");

                        box1.Text = dt.Rows[i]["OffNo"].ToString();
                        box2.Text = dt.Rows[i]["ServiceType"].ToString();
                        box3.Text = dt.Rows[i]["ItemCode"].ToString();
                        box4.Text = dt.Rows[i]["Item"].ToString();
                        box5.Text = dt.Rows[i]["Cqty"].ToString();
                        box6.Text = dt.Rows[i]["Quantity"].ToString();
                        box7.Text = dt.Rows[i]["Measurement"].ToString();
                        box8.Text = dt.Rows[i]["id"].ToString();


                        rowIndex++;
                    }
                }
            }
        }

        public void LoadBasic()
        {

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

            dtMenuReason = itemObject.GetManuReason(strConnString);
            ddlReason.DataSource = dtMenuReason;

            ddlReason.DataTextField = "reason";
            ddlReason.DataValueField = "reasonCode";
            ddlReason.DataBind();
            ddlReason.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void btnViewExtra_Click(object sender, EventArgs e)
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
            command.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());
      

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

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {

        }

        protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

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
            command.Parameters.AddWithValue("@wordRoomCode", ddlWardroom.SelectedValue.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[0];

            grdReport1.DataBind();

            con.Close();
        }

        protected void grdReport0_ItemCommand(object sender, GridCommandEventArgs e)
        {

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

        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }


        protected void grdMedal_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {           
            saveItemList();
            bindItemList();            
        }


        public void saveItemList()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;          
            //for (int i = 0; i < grdMedal.Rows.Count; i++)
            //{
                try
                {
                    //RadTextBox txtItemCode = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");
                    //RadTextBox txtQty = (RadTextBox)grdMedal.Rows[i].FindControl("txtQty");
                    //RadTextBox cmbmeasurement = (RadTextBox)grdMedal.Rows[i].FindControl("cmbmeasurement");
                    

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Save_T_IndividualExtraItemByCA]";


                    cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
                    cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                    //cmd.Parameters.AddWithValue("@qty", txtQty.Text);
                    //cmd.Parameters.AddWithValue("@itemMessurmentCode", cmbmeasurement.Text);

                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

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
            //}
        }

        public void bindItemList()
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


                string sdate = DateTime.Parse(dateSaleDate.SelectedDate.ToString()).Date.ToShortDateString();
                string[] codes = sdate.Split('/');
                string val = codes[2] + "-" + codes[0] + "-" + codes[1];
                string reasonCode = ddlReason.SelectedValue.ToString();
                string wardroomCode = ddlWardroom.SelectedValue.ToString();

                dtGetExItemsExtraByCA.Clear();

                dtGetExItemsExtraByCA = itemObject.GetExcItemsExtraByCA(strConnString, sdate, reasonCode, wardroomCode);
                if (dtGetExItemsExtraByCA.Rows.Count > 0)
                {
                    Session["ss"] = dtGetExItemsExtraByCA;

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

            if (dtGetExItemsExtraByCA.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtGetExItemsExtraByCA.Rows)
                {
                    string offNo = row[0].ToString();
                    string itemCode = row[1].ToString();
                    string item = row[2].ToString();
                    string Cqty = row[3].ToString();
                    string qty = row[4].ToString();
                    string messu = row[5].ToString();
                    string id = row[6].ToString();


                    //string itemCode = row[0].ToString();
                    //string item = row[1].ToString();
                    //string Cqty = row[2].ToString();
                    //string messu = row[3].ToString();
                    //string id = row[4].ToString();

                    RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtOff");
                    RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItemCode");
                    RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItem");
                    RadTextBox t3 = (RadTextBox)grdMedal.Rows[k].FindControl("txtQty");  
                    RadTextBox t4 = (RadTextBox)grdMedal.Rows[k].FindControl("txtQuantity");
                    RadTextBox t5 = (RadTextBox)grdMedal.Rows[k].FindControl("cmbmeasurement");           
                    RadTextBox t6 = (RadTextBox)grdMedal.Rows[k].FindControl("txtID");

                    //RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtItemCode");
                    //RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItem");
                    //RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtQty");
                    //RadTextBox t3 = (RadTextBox)grdMedal.Rows[k].FindControl("cmbmeasurement");
                    //RadTextBox t4 = (RadTextBox)grdMedal.Rows[k].FindControl("txtID");

                    //t.Text = itemCode;
                    //t1.Text = item;
                    //t2.Text = Cqty;
                    //t3.Text = messu;
                    //t4.Text = id;

                    t.Text = offNo;
                    t1.Text = itemCode;
                    t2.Text = item;
                    t3.Text = Cqty;
                    t4.Text = qty;
                    t5.Text = messu;
                    t6.Text = id;

                    k++;
                }

            }
        }

        public void bindserchdatagv()
        {
            dtGetExItemsExtraByCA.Clear();
            dtGetExItemsExtraByCA = itemObject.GetExcItemsExtraByCA(strConnString, dateSaleDate.SelectedDate.ToString(), ddlReason.SelectedValue.ToString(), ddlWardroom.SelectedValue.ToString());

            if (dtGetExItemsExtraByCA.Rows.Count > 0)
            {
                grdMedal.DataSource = dtGetExItemsExtraByCA;
                grdMedal.DataBind();
            }
        }

        protected void btnSaveItem_Click(object sender, EventArgs e)
        {

            int offNo;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = con;

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {
                    RadTextBox Id = (RadTextBox)grdMedal.Rows[i].FindControl("txtID");
                    RadTextBox offiNo = (RadTextBox)grdMedal.Rows[i].FindControl("txtOff");
                    RadComboBox serviceType = (RadComboBox)grdMedal.Rows[i].FindControl("txtSer");
                    RadTextBox qty = (RadTextBox)grdMedal.Rows[i].FindControl("txtQuantity");
                    RadTextBox itemMes = (RadTextBox)grdMedal.Rows[i].FindControl("cmbmeasurement");
                    CheckBox isActive = (CheckBox)grdMedal.Rows[i].FindControl("SelectCheckBox");
                    RadTextBox itemId = (RadTextBox)grdMedal.Rows[i].FindControl("txtItemCode");



                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_Update_T_IndividualExtraItemByCA]";

                        cmd.Parameters.AddWithValue("@id", Id.Text);
                        cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                        cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@offNo", offiNo.Text);
                        cmd.Parameters.AddWithValue("@serviceType", serviceType.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@itemCode", itemId.Text);
                        cmd.Parameters.AddWithValue("@qty", qty.Text);
                        cmd.Parameters.AddWithValue("@itemMessurmentCode", itemMes.Text);



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

                        lblError0.Text = "Update Menu Items Successfully!";
                        lblError0.ForeColor = System.Drawing.Color.Green;


                



                    //get id,date,reasonCode,wardroomCode
                    //if (!string.IsNullOrEmpty(offiNo.Text))
                    //{
                    //    List<string> names = offiNo.Text.Split(',').Reverse().ToList();
                    //    if (names.Count >= 1)
                    //    {
                    //        for (int x = 0; x < names.Count; x++)
                    //        {
                    //            offNo = int.Parse(names[x]);
                    //            con.Open();
                    //            cmd1.CommandType = CommandType.StoredProcedure;
                    //            cmd1.CommandText = "VICTULING_Save_T_IndividualExtraItemByCA_New";

                    //            cmd1.Parameters.AddWithValue("@serviceType", serviceType.Text);
                    //            cmd1.Parameters.AddWithValue("@offNo", int.Parse((offNo.ToString())));
                    //            cmd1.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                    //            cmd1.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                    //            cmd1.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());
                    //            cmd1.Parameters.AddWithValue("@itemCode", itemId.Text);
                    //            cmd1.Parameters.AddWithValue("@qty", qty.Text);
                    //            cmd1.Parameters.AddWithValue("@itemMessurmentCode", itemMes.Text);
                    //            if (isActive.Checked == true)
                    //            {
                    //                cmd1.Parameters.AddWithValue("@isActive", 0);
                    //            }
                    //            else
                    //            {
                    //                cmd1.Parameters.AddWithValue("@isActive", 1);
                    //            }
                    //            cmd1.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    //            cmd1.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                    //            cmd1.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    //            cmd1.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);
                    //            cmd1.Parameters.AddWithValue("@id", Id.Text);

                    //            cmd1.ExecuteNonQuery();
                    //            cmd1.Parameters.Clear();
                    //            con.Close();
                    //            lblError.Visible = true;

                    //            lblError0.Text = "Update Menu Items Successfully!";
                    //            lblError0.ForeColor = System.Drawing.Color.Green;

                    //            //delete blank records
                    //          deleteBlankRecords(DateTime.Parse(dateSaleDate.SelectedDate.ToString()), ddlReason.SelectedValue.ToString(), ddlWardroom.SelectedValue.ToString(), itemId.Text.ToString());

                    //        }
                    //    }
                    //}
                    //else 
                    //{
                    //    lblError0.Text = "Enter Official NO/Nos";
                    //    lblError0.ForeColor = System.Drawing.Color.Red;
                    //}
                    


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }

            }
        }

        public void deleteBlankRecords(DateTime date,string reason,string wardRoom,string item)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "VICTULING_Delete_T_IndividualExtraItemByCA";

            cmd.Parameters.AddWithValue("@date",date);
            cmd.Parameters.AddWithValue("@reasonCode",reason);
            cmd.Parameters.AddWithValue("@wardroomCode",wardRoom);
            cmd.Parameters.AddWithValue("@itemCode",item);
        
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
        }

        protected void ddlReason_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {

        }
    }
}