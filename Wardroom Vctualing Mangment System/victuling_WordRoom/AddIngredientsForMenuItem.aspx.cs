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
    public partial class AddIngredientsForMenuItem : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMealCategory = new DataTable();
        public static DataTable dtUpdateSportsGrid = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtItemMes = new DataTable();

        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (!IsPostBack)
            {
                getMenuReason();
                //SetInitialRow();
            }
        }

        public void getMenuReason()
        {

            dtItemMes = itemObject.GetItemMessurment(strConnString);
            ddltemitemMessurment.DataSource = dtItemMes;

            ddltemitemMessurment.DataTextField = "itemMessurment";
            ddltemitemMessurment.DataValueField = "itemMessurmentCode";
            ddltemitemMessurment.DataBind();

            ddltemitemMessurment.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = wardRoomName.ToString();
            //txtWardRoom0.Text = wardRoomName.ToString();
           

            dtMealCategory = itemObject.GetMealCategory(strConnString);
            ddlMealCat.DataSource = dtMealCategory;

            ddlMealCat.DataTextField = "mainItemCategory";
            ddlMealCat.DataValueField = "mainItemCategoryCode";
            ddlMealCat.DataBind();

            ddlMealCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            ddlMealCat0.DataSource = dtMealCategory;

            ddlMealCat0.DataTextField = "mainItemCategory";
            ddlMealCat0.DataValueField = "mainItemCategoryCode";
            ddlMealCat0.DataBind();

            ddlMealCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtItemCat = itemObject.GetItemCatagory(strConnString);
            ddlItemCat.DataSource = dtItemCat;

            ddlItemCat.DataTextField = "itemCatagory";
            ddlItemCat.DataValueField = "itemCatagoryCode";
            ddlItemCat.DataBind();

            ddlItemCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtWardroom = itemObject.GetWardroom(strConnString);
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

        protected void ddlMeal_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void ddlItemCat_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string itemValue = ddlItemCat.Text;
            DataTable Entrydt1 = tt.GetItemByCateIngredients(itemValue, strConnString);
            ddlItem.DataSource = Entrydt1;
            ddlItem.DataTextField = "m_item";
            ddlItem.DataValueField = "itemCode";
            ddlItem.DataBind();
            ddlItem.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void ddlItem_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            //VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            //string itemValue = ddlItem.SelectedValue.ToString();
            //DataTable Entrydt1 = tt.GetMessurment(itemValue, strConnString);
            //ddltemitemMessurment.DataSource = Entrydt1;
            //ddltemitemMessurment.DataTextField = "itemMessurment";
            //ddltemitemMessurment.DataValueField = "itemMessurmentCode";
            //ddltemitemMessurment.DataBind();
           
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            if ((ddlMeal.SelectedItem.Text == "---Select---") || (ddlItem.SelectedItem.Text == "---Select---") || (txtQty.Text == "") || (ddltemitemMessurment.SelectedItem.Text == "---Select---"))
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
                    cmd.CommandText = "[VICTULING_Save_IngredientsList]";

                    cmd.Parameters.AddWithValue("@mainItemCode", ddlMeal.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@ingredientsCode", ddlItem.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@qty", txtQty.Text);
                    cmd.Parameters.AddWithValue("@messurment", ddltemitemMessurment.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    //cmd.Parameters.AddWithValue("@isActive", 0);

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
            command.CommandText = "[VICTULING_getIngredientsList]";

            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@mainItem", ddlMeal.SelectedItem.Text);

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();

           
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["id"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[M_Ingredients] WHERE [id] = '" + int.Parse(id) + "'";
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

        protected void ddlMealCat0_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string itemValue = ddlMealCat0.Text;
            DataTable Entrydt1 = tt.GetMealItemByCate(itemValue, strConnString);
            ddlMeal0.DataSource = Entrydt1;
            ddlMeal0.DataTextField = "mainItem";
            ddlMeal0.DataValueField = "mainItemCode";
            ddlMeal0.DataBind();
            ddlMeal0.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void ddlMeal0_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            bindGridNew();

           
        }


        public void bindGridNew()
        {

            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_getIngredientsList]";

            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@mainItem", ddlMeal0.SelectedItem.Text);

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

        protected void grdReport0_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["id"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[M_Ingredients] WHERE [id] = '" + int.Parse(id) + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblError.Text = "Delete Successfull";
                    lblError.ForeColor = System.Drawing.Color.Green;

                    bindGridNew();
                }
                catch (Exception ex) { }

            }
        }
    }
}