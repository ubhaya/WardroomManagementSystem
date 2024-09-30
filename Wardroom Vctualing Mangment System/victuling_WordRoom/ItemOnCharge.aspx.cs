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
    public partial class ItemOnCharge : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCode = new DataTable();
        public static DataTable dtmainItem = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtItemMes = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dt306Price = new DataTable();

        public static DataTable dtresult = new DataTable();
        public static DataSet ds = new DataSet();

        public static string year = "";
        public static string itemCode = "";
        public static string wardRoomCode = "";

        public static DataSet xx = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();
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
            //ddlWardroom.DataSource = dtWardroom;

            //ddlWardroom.DataTextField = "wardroomName";
            //ddlWardroom.DataValueField = "wardroomCode";
            //ddlWardroom.DataBind();

            //ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            txtWardRoom.Text = Session["wardRoomName"].ToString();


            dtItemMes = itemObject.GetItemMessurment(strConnString);
            ddltemitemMessurment.DataSource = dtItemMes;

            ddltemitemMessurment.DataTextField = "itemMessurment";
            ddltemitemMessurment.DataValueField = "itemMessurmentCode";
            ddltemitemMessurment.DataBind();

            ddltemitemMessurment.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            if ((dateOnCharge.SelectedDate.ToString() == "") || (ddlItemCat.SelectedItem.Text == "---Select---") || (ddlItem.SelectedItem.Text == "---Select---") || (ddlReceivedFrom.SelectedItem.Text == "---Select---") || (txtBillNo.Text == "") || (txtUnitPrice.Text == "") || (txtOnChargeQty.Text == "") || (txtWardRoom.Text == ""))
            {
                lblError.Visible = true;
                lblError.Text = "Save Failed,Fill all the details!";
                lblError.ForeColor = System.Drawing.Color.Red;
            }

            else
            {
                lblError.Visible = false;

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                try
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Save_OnChargeItem]";

                    cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@onChargeDate", dateOnCharge.SelectedDate);
                    cmd.Parameters.AddWithValue("@recevedFrom", ddlReceivedFrom.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@billNo", txtBillNo.Text);
                    cmd.Parameters.AddWithValue("@unitPrice", txtUnitPrice.Text);
                    cmd.Parameters.AddWithValue("@onChargeQty", txtOnChargeQty.Text);
                    cmd.Parameters.AddWithValue("@itemMessurmentCode", ddltemitemMessurment.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@CurrentQty", txtOnChargeQty.Text );
                    cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());
                    cmd.Parameters.AddWithValue("@isActive",0);

                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                    cmd.Parameters.AddWithValue("@reason", ddlReason.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@ToOffNo", txtOffNo.Text);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;
                    lblError.Text = "Save Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;

                }
                catch (Exception)
                {
                }


                //con.Open();
                //SqlCommand command = new SqlCommand();
                //SqlDataAdapter adapter = new SqlDataAdapter();
                //DataSet ds = new DataSet();

                //command.Connection = con;
                //command.CommandType = CommandType.StoredProcedure;
                //command.CommandText = "[VICTULING_GetOnChargeItemList]";

                //command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
                //command.Parameters.AddWithValue("@onChargeDate", dateOnCharge.SelectedDate);
                //command.Parameters.AddWithValue("@recevedFrom", ddlReceivedFrom.SelectedItem.Text);
                //command.Parameters.AddWithValue("@billNo", txtBillNo.Text);

                //adapter = new SqlDataAdapter(command);
                //adapter.Fill(ds);

                //grdReport.DataSource = ds.Tables[0];

                //grdReport.DataBind();

                //con.Close();

                //UpdateT_StockQty();

                bindGrid();
            }


             

        }

        public void bindGrid()

        {

            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetOnChargeItemList]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateOnCharge.SelectedDate);
            command.Parameters.AddWithValue("@recevedFrom", ddlReceivedFrom.SelectedItem.Text);
            command.Parameters.AddWithValue("@billNo", txtBillNo.Text);

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();

            UpdateT_StockQty();
        }


        public void UpdateT_StockQty()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            try
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Update_T_StockQty_forOnCharge]";

                cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@currentStock", txtOnChargeQty.Text);
                cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

                cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                lblError.Visible = true;
                lblError.Text = "Save Success!";
                lblError.ForeColor = System.Drawing.Color.Green;

            }
            catch (Exception)
            {
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

        protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
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

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["itemId"].Text.ToString();

                try
                {
                     string query = "DELETE FROM [dbo].[T_Stock] WHERE [itemId] = '" + int.Parse(id) + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblError.Text = "Delete Successfull";
                    lblError.ForeColor = System.Drawing.Color.Green;

                    bindGrid();
                }
                catch (Exception ex) { }

            }

            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetOnChargeItemList]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateOnCharge.SelectedDate);
            command.Parameters.AddWithValue("@recevedFrom", ddlReceivedFrom.SelectedItem.Text);
            command.Parameters.AddWithValue("@billNo", txtBillNo.Text);

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();

            UpdateT_StockQty_DeleteItem();
            
        }

        public void UpdateT_StockQty_DeleteItem()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            try
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Update_T_StockQty_forDelete]";

                cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@currentStock", txtOnChargeQty.Text);
                cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

                cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);


                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                lblError.Visible = true;
                lblError.Text = "Delete Success!";
                lblError.ForeColor = System.Drawing.Color.Green;

            }
            catch (Exception ex)
            {
            }
        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlItem_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string ReceivedFrom = ddlReceivedFrom.SelectedItem.Text;
            if (ReceivedFrom == "309")
            {
                txtUnitPrice.Enabled = false;
                Get309Dat();
            
            }
        }

        public void Get309Dat()
        {
            string year = dateOnCharge.SelectedDate.ToString();
            string itemCode = ddlItem.SelectedValue.ToString();
            string wardRoomCode = Session["wardRoomCode"].ToString();
            string ReceivedFrom = ddlReceivedFrom.SelectedItem.Text;


            if (ReceivedFrom == "309")
            {

                dt306Price = itemObject.Get309PriceDetails(strConnString, year, itemCode, wardRoomCode);

                if (dt306Price.Rows.Count > 0)
                {
                    Session["ss"] = dt306Price;

                    Publishdata(dt306Price);

                }
                else
                {
                    lblError.Text = "No data found";
                }
            }
        }

        public void Publishdata(DataTable one)
        {

            //DataRow row = one.Rows[0];
            //year = row["year"].ToString();
            //itemCode = row["itemCode"].ToString();
            //wardRoomCode = row["wardRoomCode"].ToString();

            string year = dateOnCharge.SelectedDate.ToString();
            string itemCode = ddlItem.SelectedValue.ToString();
            string wardRoomCode = Session["wardRoomCode"].ToString();

            xx.Clear();
            xx = SearchDeatail(year, itemCode, wardRoomCode);
            GetPersonalData(xx);
            //btnBack.Visible = true;
        }

        private DataSet SearchDeatail(string year, string itemCode, string wardRoomCode)
        {

            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Parameters.Clear();
            cmd = new SqlCommand("VICTULING_GetSelectedItem309Price", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@wordRoomCode", SqlDbType.VarChar).Value = wardRoomCode;
            cmd.Parameters.Add("@year", SqlDbType.VarChar).Value = year;
            cmd.Parameters.Add("@itemCode", SqlDbType.VarChar).Value = itemCode;
            
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
                    txtUnitPrice.Text = personal.Tables[0].Rows[0]["unitPrice"].ToString();
                }
                else
                {
                    txtUnitPrice.Text = "No Data";
                }
            }
        }

        protected void ddlWardroom_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void btnDiscount_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            if (txtDiscount.Text != "")
            {
                try
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Insert_T_DiscountPrice]";

                    cmd.Parameters.AddWithValue("@billNo", txtBillNo.Text);
                    cmd.Parameters.AddWithValue("@recevedFrom", ddlReceivedFrom.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@onChargeDate", dateOnCharge.SelectedDate);
                    cmd.Parameters.AddWithValue("@discountPrice", float.Parse(txtDiscount.Text));

                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;
                    lblError.Text = "Bill Added";
                    lblError.ForeColor = System.Drawing.Color.Green;

                }
                catch (Exception ex) { }
            }
            else
            {
                lblError.Text = "Please enter Discount Value";
            }
        }

        protected void ddlReason_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (ddlReason.Text == "Individual")
            {
                lblOff.Visible = true;
                txtOffNo.Visible = true;
                Label11.Visible = true;
            }
            else
            {
                lblOff.Visible = false;
                txtOffNo.Visible = false;
                Label11.Visible = false;
            }
        }
    }
}