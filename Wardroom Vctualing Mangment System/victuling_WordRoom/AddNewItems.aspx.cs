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
    public partial class AddNewItems : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCode = new DataTable();
        public static DataTable dtmainItem = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtItemMes = new DataTable();
        public static DataTable dtWardroom = new DataTable();

        public static DataSet xx = new DataSet();

        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();
            //try
            //{
            //    //Session["LOGIN_NAME"] = "kal";
            //    String userName = Session["LOGIN_NAME"].ToString();
            //    if (userName == "")
            //    {
            //        Response.Redirect("~/Login.aspx");
            //    }
            //    else
            //    {

            //    }
            //}
            //catch
            //{
            //    Response.Redirect("~/Login.aspx");
            //}

            if (IsPostBack != true)
            {
                LoadBasic();
            }

            if (txtItemCode.Text == "")
            {
                btnSaveNewItem.Visible = false;
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


            dtItemMes = itemObject.GetItemMessurment(strConnString);
            ddltemitemMessurment.DataSource = dtItemMes;

            ddltemitemMessurment.DataTextField = "itemMessurment";
            ddltemitemMessurment.DataValueField = "itemMessurmentCode";
            ddltemitemMessurment.DataBind();

            ddltemitemMessurment.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = wardRoomName.ToString();
            //ddlWardroom.DataSource = dtWardroom;

            //ddlWardroom.DataTextField = "wardroomName";
            //ddlWardroom.DataValueField = "wardroomCode";
            //ddlWardroom.DataBind();

            //ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            if ((txtItemDes.Text == ""))
            {
                lblError.Visible = true;
                lblError.Text = "Item Description Cannot be Empty !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }

            else
            {
                string itemName = txtItemDes.Text;

                dtItemCode.Clear();

                dtItemCode = itemObject.GetItemCode(strConnString, itemName);


                if (dtItemCode.Rows.Count > 0)
                {
                    //Session["ss"] = dtCourseBasic;
                    Publishdata(dtItemCode, itemName);

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
            cmd = new SqlCommand("[VICTULING_GetItemList]", con);

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
            dtItemCode = itemObject.GetItemCode(strConnString, txtItemDes.Text);
            grdReport.DataSource = dtItemCode;
            grdReport.DataBind();
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
                string id = x["itemCode"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[M_Item] WHERE [itemCode] = '" + int.Parse(id) + "'";
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

        protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void btnGetItemCode_Click(object sender, EventArgs e)
        {
            if (txtItemCode.Text == "")
           {
            DataSet getvalues = new DataSet();
            getvalues.Clear();

            getvalues = itemObject.FindMaxItemCode(strConnString);

            int val = int.Parse(getvalues.Tables[0].Rows[0][0].ToString());
            txtItemCode.Text = (val + 1).ToString();
            txtItemCode.ReadOnly = true;

            btnSaveNewItem.Visible = true;
           }
           else
           {
               btnSaveNewItem.Visible = false;
           }
        }

        protected void btnCreateNewCode_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewItems.aspx");
        }


        protected void btnSaveNewItem_Click(object sender, EventArgs e)
        {
            if ((txtItemCode.Text == "") && (txtItem.Text ==""))
            {
                lblError.Visible = true;
                lblError1.Text = "Save Failed,Fill Item Code, Item !";
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
                    cmd.CommandText = "[VICTULING_Save_Item]";

                    cmd.Parameters.AddWithValue("@itemCode", txtItemCode.Text);
                    cmd.Parameters.AddWithValue("@item", txtItem.Text);
                    cmd.Parameters.AddWithValue("@itemCatagoryCode", ddlItemCat.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@itemMessurmentCode", ddltemitemMessurment.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@m_item", txtItem.Text);
                    cmd.Parameters.AddWithValue("@isIngredients", 1);

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

                AddNewItem_T_StockQty();
            }
        }


        public void AddNewItem_T_StockQty()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            try
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Save_T_StockQty]";

                cmd.Parameters.AddWithValue("@itemCode", txtItemCode.Text);
                cmd.Parameters.AddWithValue("@wordRoomCode", wardRoomCode.ToString());
                

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
        }

        protected void txtItemDes_TextChanged(object sender, EventArgs e)
        {

        }

        protected void RadPanelBar3_ItemClick(object sender, RadPanelBarEventArgs e)
        {

        }

        protected void ddlWardroom_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }


    }
}