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
    public partial class AddGroupMenuItemByCA : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItemsExtraByCA = new DataTable();
        public static int countval = 0;
        public static DataTable dtGetGroupItemsExtraByCA = new DataTable();
        public static DataTable dtGetFinalGroupItemsExtraByCA = new DataTable();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            if (!IsPostBack)
            {
                getMenuReason();
                //SetInitialRow();

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

            if (dtGetExItemsExtraByCA.Rows.Count <= 1)
            {
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
            }

            else
            {
                for (int x = 0; dtGetExItemsExtraByCA.Rows.Count > x; x++)
                {
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
                }
            }

            ViewState["CurrentTable"] = dt;

            grdMedal.DataSource = dt;
            grdMedal.DataBind();
        }

        private void SetNewInitialRow()
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

            if (dtGetFinalGroupItemsExtraByCA.Rows.Count <= 1)
            {
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
            }

            else
            {
                for (int x = 0; dtGetFinalGroupItemsExtraByCA.Rows.Count > x; x++)
                {
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

        protected void btnGroupMenu_Click(object sender, EventArgs e)
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
            command.Parameters.AddWithValue("@wordRoomCode", ddlWardroom.SelectedItem.Text);


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[0];

            grdReport1.DataBind();

            con.Close();
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
                cmd.CommandText = "[VICTULING_Save_T_GroupMenuItemByCA]";


                cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate);
                cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@isActive", 1);
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
            if ((dateMenuDate.SelectedDate.ToString() == "") || (cmbDescription.SelectedItem.Text == "---Select---") || (ddlItemCat.SelectedItem.Text == "---Select---") || (ddlItem.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Date Cannot be Empty and Select Reason,Item Category and Item !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblError.Text = "";
                dtGetExItemsExtraByCA.Clear();

                //dtGetExItemsExtraByCA = itemObject.GetExcItemsExtraByCA(strConnString, sdate, reasonCode, wardroomCode);
                dtGetExItemsExtraByCA = itemObject.GetGroupMenuItemsExtraByCA(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), ddlWardroom.SelectedValue.ToString());

                SetInitialRow();


                string sdate = DateTime.Parse(dateMenuDate.SelectedDate.ToString()).Date.ToShortDateString();
                string[] codes = sdate.Split('/');
                string val = codes[2] + "-" + codes[0] + "-" + codes[1];
                string reasonCode = cmbDescription.SelectedValue.ToString();
                string wardroomCode = ddlWardroom.SelectedValue.ToString();

               

                if (dtGetExItemsExtraByCA.Rows.Count > 0)
                {
                    Session["ss"] = dtGetExItemsExtraByCA;

                    //bindserchdatagv();
                    lblError.Text = "";
                }
                else
                {
                    lblError.Text = "No data found";
                    lblError.ForeColor = System.Drawing.Color.Red;

                }
            }

            int k = 0;
         //   SetInitialRow();

            if (dtGetExItemsExtraByCA.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtGetExItemsExtraByCA.Rows)
                {

                    string ItemCode = row[0].ToString();
                    string Item = row[1].ToString();
                    string Cqty = row[2].ToString();
                    string Measurement = row[3].ToString();
                    string id = row[4].ToString();

                    RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtItemCode");
                    RadTextBox t1 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItem");
                    RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtQty");
                    RadTextBox t3 = (RadTextBox)grdMedal.Rows[k].FindControl("cmbmeasurement");
                    RadTextBox t4 = (RadTextBox)grdMedal.Rows[k].FindControl("txtID");

                    t.Text = ItemCode;
                    t1.Text = Item;
                    t2.Text = Cqty;
                    t3.Text = Measurement;
                    t4.Text = id;

                    k++;
                }

            }
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

        protected void grdMedal_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdMedal.Rows.Count; i++)
            {
                try
                {
                    RadTextBox Id = (RadTextBox)grdMedal.Rows[i].FindControl("txtID");
                    RadTextBox offiNo = (RadTextBox)grdMedal.Rows[i].FindControl("txtOff");
                    RadComboBox serviceType = (RadComboBox)grdMedal.Rows[i].FindControl("txtSer");
                    RadTextBox qty = (RadTextBox)grdMedal.Rows[i].FindControl("txtQuantity");
                    RadTextBox measurement = (RadTextBox)grdMedal.Rows[i].FindControl("cmbmeasurement");
                    CheckBox isActive = (CheckBox)grdMedal.Rows[i].FindControl("SelectCheckBox");

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_GroupMenuItemByCA]";

                    cmd.Parameters.AddWithValue("@id", Id.Text);
                    cmd.Parameters.AddWithValue("@offNo", offiNo.Text);
                    cmd.Parameters.AddWithValue("@serviceType", serviceType.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@qty", qty.Text);
                    cmd.Parameters.AddWithValue("@itemMessurmentCode", measurement.Text);

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

        public void bindFinalItemList()
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
                dtGetFinalGroupItemsExtraByCA.Clear();

                //dtGetExItemsExtraByCA = itemObject.GetExcItemsExtraByCA(strConnString, sdate, reasonCode, wardroomCode);
                dtGetFinalGroupItemsExtraByCA = itemObject.GetFinalGroupMenuItemsExtraByCA(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), ddlWardroom.SelectedValue.ToString());

                SetNewInitialRow();


                string sdate = DateTime.Parse(dateMenuDate.SelectedDate.ToString()).Date.ToShortDateString();
                string[] codes = sdate.Split('/');
                string val = codes[2] + "-" + codes[0] + "-" + codes[1];
                string reasonCode = cmbDescription.SelectedValue.ToString();
                string wardroomCode = ddlWardroom.SelectedValue.ToString();



                if (dtGetFinalGroupItemsExtraByCA.Rows.Count > 0)
                {
                    Session["ss"] = dtGetFinalGroupItemsExtraByCA;

                    //bindserchdatagv();
                    lblError.Text = "";
                }
                else
                {
                    lblError.Text = "No data found";
                    lblError.ForeColor = System.Drawing.Color.Red;

                }
            }

            int k = 0;
            //   SetInitialRow();

            if (dtGetFinalGroupItemsExtraByCA.Rows.Count > 0)
            {
                k = 0;
                foreach (DataRow row in dtGetFinalGroupItemsExtraByCA.Rows)
                {
                    string txtOff = row[0].ToString();
                    string ServiceType = row[1].ToString();
                    string ItemCode = row[2].ToString();
                    string Item = row[3].ToString();
                    string Cqty = row[4].ToString();
                    string Quantity = row[5].ToString();
                    string Measurement = row[6].ToString();
                    string id = row[7].ToString();

                    RadTextBox t = (RadTextBox)grdMedal.Rows[k].FindControl("txtOff");
                    RadComboBox t1 = (RadComboBox)grdMedal.Rows[k].FindControl("txtSer");
                    RadTextBox t2 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItemCode");
                    RadTextBox t3 = (RadTextBox)grdMedal.Rows[k].FindControl("txtItem");
                    RadTextBox t4 = (RadTextBox)grdMedal.Rows[k].FindControl("txtQty");
                    RadTextBox t5 = (RadTextBox)grdMedal.Rows[k].FindControl("txtQuantity");
                    RadTextBox t6 = (RadTextBox)grdMedal.Rows[k].FindControl("cmbmeasurement");
                    RadTextBox t7 = (RadTextBox)grdMedal.Rows[k].FindControl("txtID");

                    t.Text = txtOff;
                    t1.Text = ServiceType;
                    t2.Text = ItemCode;
                    t3.Text = Item;
                    t4.Text = Cqty;
                    t5.Text = Quantity;
                    t6.Text = Measurement;
                    t7.Text = id;

                    k++;
                }

            }
        }

        protected void RadButton2_Click(object sender, EventArgs e)
        {
            bindFinalItemList();
        }
    }
}