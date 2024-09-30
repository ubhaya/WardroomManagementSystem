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
    public partial class AddMenuCost : System.Web.UI.Page
    {

        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItems = new DataTable();
        public static DataTable dtGetSaleItemsQty = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtTotalMenuCost = new DataTable();
        public static DataTable dtNonVegetarian = new DataTable();
        public static DataTable dtVegetarian = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
        public static DataTable dtSalebySA = new DataTable();
        public static DataTable dtGetDeductItems = new DataTable();

        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();
               
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
        }

        protected void btnSaveTotalCost_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            try
            {

                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_insert_T_TotalMenuCost]";

                cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                cmd.Parameters.AddWithValue("@reason", ddlReason.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@totalCost", lblTotalCost.Text);
                cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                //con.Close();
                lblSaveTotalCost.Visible = true;

                Label11.Text = "Save Success!";
                Label11.ForeColor = System.Drawing.Color.Green;

            }

            catch (Exception ex)
            {
                //lbl_Errormsg.Visible = true;
                //lbl_Errormsg.Text = ex.Message;
            }

            UpdateTotalCost();
        }

        public void UpdateTotalCost()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            try
            {
                //con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Update_TotalMenuCost_Missed]";

                cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                cmd.Parameters.AddWithValue("@reason", ddlReason.SelectedValue.ToString());

                cmd.Parameters.AddWithValue("@totalCost", lblTotalCost.Text);
                cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@lastModifiedUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@lastModifiedDate", System.DateTime.Now);


                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                lblSaveTotalCost.Visible = true;

                lblSaveTotalCost.Text = "Update Success!";
                lblSaveTotalCost.ForeColor = System.Drawing.Color.Green;

            }

            catch (Exception ex)
            {
                //lbl_Errormsg.Visible = true;
                //lbl_Errormsg.Text = ex.Message;
            }
        }
    }
}