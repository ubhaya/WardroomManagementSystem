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
    public partial class AddNewMenuItems : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCode = new DataTable();
        public static DataTable dtmainItem = new DataTable();
        public static DataTable dtItemMes = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMenuItemCat = new DataTable();

        public static String wardRoomName, wardRoomCode;

        public static DataSet xx = new DataSet();

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

            dtMenuItemCat = itemObject.GetMenuItemCatagory(strConnString);
            ddlItemCat0.DataSource = dtMenuItemCat;

            ddlItemCat0.DataTextField = "mainItemCategory";
            ddlItemCat0.DataValueField = "mainItemCategoryCode";
            ddlItemCat0.DataBind();

            ddlItemCat0.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));


            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = wardRoomName.ToString();
            //ddlWardroom0.DataSource = dtWardroom;

            //ddlWardroom0.DataTextField = "wardroomName";
            //ddlWardroom0.DataValueField = "wardroomCode";
            //ddlWardroom0.DataBind();

            //ddlWardroom0.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            if ((txtItemDes0.Text == ""))
            {
                lblError.Visible = true;
                lblError.Text = "Menu Item Description Cannot be Empty !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }

            else
            {
                string itemName = txtItemDes0.Text;

                dtMenuItemCat.Clear();

                dtMenuItemCat = itemObject.GetMenuItemCatagory(strConnString, itemName);


                if (dtMenuItemCat.Rows.Count > 0)
                {
                    //Session["ss"] = dtCourseBasic;
                    Publishdata(dtMenuItemCat, itemName);

                    lblError.Text = "";
                }
                else
                {
                    lblError.Text = "No Data Found";
                    lblError.ForeColor = System.Drawing.Color.Red;

                }
            }
        }

        public void Publishdata(DataTable one, string sportName)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchitemDetils(sportName);

            GetPersonalData(xx);
        }

        private DataSet SearchitemDetils(string itemName)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetMenuItemList]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@item", SqlDbType.VarChar).Value = itemName;


            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetPersonalData(DataSet xy)
        {
            DataSet personal = xy;
            GetReport();
        }

        public void GetReport()
        {
            dtMenuItemCat = itemObject.GetMenuItemCatagory(strConnString, txtItemDes0.Text);
            grdReport0.DataSource = dtMenuItemCat;
            grdReport0.DataBind();
        }

        protected void grdReport_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport0.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport0.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["mainItemCode"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[M_MainItem] WHERE [mainItemCode] = '" + int.Parse(id) + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblError.Text = "Delete Successfull";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex) { }
            }

            GetReport();
        }

       

        protected void rgdBoardAssessment_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void ddlWardroom_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void btnGetItemCode_Click(object sender, EventArgs e)
        {

            DataSet getvalues = new DataSet();
            getvalues.Clear();

            getvalues = itemObject.FindMaxMenuItemCode(strConnString);

            int val = int.Parse(getvalues.Tables[0].Rows[0][0].ToString());
            txtItemCode0.Text = (val + 1).ToString();
            txtItemCode0.ReadOnly = true;
        }

        protected void btnSaveNewItem_Click(object sender, EventArgs e)
        {
            if (txtItemCode0.Text == "")
            {
                lblError.Visible = true;
                lblError1.Text = "Save Failed,Fill Item Code !";
                lblError1.ForeColor = System.Drawing.Color.Red;
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
                    cmd.CommandText = "[VICTULING_Save_MenuItem]";

                    cmd.Parameters.AddWithValue("@mainItemCode", txtItemCode0.Text);
                    cmd.Parameters.AddWithValue("@mainItem", txtItem0.Text);
                    cmd.Parameters.AddWithValue("@mainItemCategoryCode", ddlItemCat0.SelectedValue.ToString());

                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError1.Visible = true;
                    lblError1.Text = "Save Success!";
                    lblError1.ForeColor = System.Drawing.Color.Green;

                }
                catch (Exception ex)
                {
                }

               /// AddNewItem_T_StockQty();
            }
        }

        protected void btnCreateNewCode_Click(object sender, EventArgs e)
        {

        }

        protected void txtItemDes_TextChanged(object sender, EventArgs e)
        {

        }

        protected void RadPanelBar3_ItemClick(object sender, Telerik.Web.UI.RadPanelBarEventArgs e)
        {

        }

        protected void txtItem0_TextChanged(object sender, EventArgs e)
        {

        }
    }
}