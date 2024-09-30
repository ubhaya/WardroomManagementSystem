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
    public partial class AddNewCurry : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtMealCategory = new DataTable();
        public static DataTable dtmainItem = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtItemMes = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMealPrice = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                LoadBasic();
            }
        }
        public void LoadBasic()
        {
            dtMealCategory = itemObject.GetMealCategory(strConnString);
            ddlMealCat.DataSource = dtMealCategory;

            ddlMealCat.DataTextField = "mainItemCategory";
            ddlMealCat.DataValueField = "mainItemCategoryCode";
            ddlMealCat.DataBind();

            ddlMealCat.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            
        }


        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            if (btnAddItem.Text.Trim() != "Update")
            {
                try
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[Victulling_Save_New_Curry_Item]";

                    cmd.Parameters.AddWithValue("@itemCode", ddlMealCat.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@item", ddlMeal.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@unitPrice", decimal.Parse(txtUnitPrice.Text));
                    cmd.Parameters.AddWithValue("@remarks", txtRemarks.Text);
                    cmd.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                    cmd.Parameters.AddWithValue("@updateUser", "");
                    cmd.Parameters.AddWithValue("@updateDate", "");
                    cmd.Parameters.AddWithValue("@Type", 1);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;
                    lblError.Text = "Added Successfully!";
                    lblError.ForeColor = System.Drawing.Color.Green;

                    txtRemarks.Text = "";
                    txtUnitPrice.Text = "";
                    ddlMeal.SelectedIndex = 0;
                    ddlMealCat.SelectedIndex = 0;

                }
                catch (Exception ex)
                {
                }
            }
            else
            {
            //update currant menu
                try
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[Victulling_Save_New_Curry_Item]";

                    cmd.Parameters.AddWithValue("@itemCode", ddlMealCat.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@item", ddlMeal.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@unitPrice", decimal.Parse(txtUnitPrice.Text));
                    cmd.Parameters.AddWithValue("@remarks", txtRemarks.Text);
                    cmd.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                    cmd.Parameters.AddWithValue("@createdUser", "");
                    cmd.Parameters.AddWithValue("@createdDate", "");
                    cmd.Parameters.AddWithValue("@updateUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@updateDate", System.DateTime.Now);
                    cmd.Parameters.AddWithValue("@Type", 2);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;
                    lblError.Text = "Update Successfully!";
                    lblError.ForeColor = System.Drawing.Color.Green;

                    txtRemarks.Text = "";
                    txtUnitPrice.Text = "";
                    ddlMeal.SelectedIndex = 0;
                    ddlMealCat.SelectedIndex = 0;

                }
                catch (Exception ex)
                {
                }

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

            txtRemarks.Text = "";
            txtUnitPrice.Text = "";
        }

        protected void ddlMeal_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            try
            {
                dtMealPrice = itemObject.GetMealPrice(strConnString,ddlMeal.SelectedValue.ToString());
                if (dtMealPrice.Rows.Count == 1)
                {
                    btnAddItem.Text = "Update";
                    txtUnitPrice.Text = dtMealPrice.Rows[0][0].ToString();
                }
                

            }
            catch (Exception ex)
            {
            }
        }

      
    }
}