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
    public partial class Add309PriceList : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCode = new DataTable();
        public static DataTable dtmainItem = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtItemMes = new DataTable();
        public static DataTable dtWardroom = new DataTable();

        public static DataTable dtresult = new DataTable();
        public static DataSet ds = new DataSet();

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

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            if ((dateOnCharge.SelectedDate.ToString() == "") || (ddlItemCat.SelectedItem.Text == "---Select---") || (ddlYear.SelectedItem.Text == "---Select---") || (ddlItem.SelectedItem.Text == "---Select---") || (txtUnitPrice.Text == "") || (ddltemitemMessurment.SelectedItem.Text == "---Select---"))
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
                    cmd.CommandText = "[VICTULING_Save_309PriceList]";

                    cmd.Parameters.AddWithValue("@itemCode", ddlItem.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@unitPrice", txtUnitPrice.Text);
                    cmd.Parameters.AddWithValue("@denomination", txtDenomination.Text);
                    cmd.Parameters.AddWithValue("@itemMessurmentCode", ddltemitemMessurment.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@onChargeDate", dateOnCharge.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@recevedFrom", lblReceivedFrom.Text);
                    cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());                  
                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                    cmd.Parameters.AddWithValue("@isActive", 1);
        

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    //con.Close();
                    lblError.Visible = true;
                    lblError.Text = "Save Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;

                }
                catch (Exception)
                {
                }


                
                bindGrid();
            }
        }

        public void bindGrid()
        {

            //con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetOnCharge309ItemList]";

            command.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

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
                    string query = "DELETE FROM [dbo].[T_309AnnualPriceList] WHERE [itemId] = '" + int.Parse(id) + "'";
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

            bindGrid();
        }
    }
}