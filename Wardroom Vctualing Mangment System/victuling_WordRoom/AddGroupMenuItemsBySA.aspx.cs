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
    public partial class AddGroupMenuItemsBySA : System.Web.UI.Page
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

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();

        public static int countval = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();
                //SetInitialRow();
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
        }

        //private void SetInitialRow()
        //{
        //    DataTable dt = new DataTable();
        //    DataRow dr = null;

        //    dt.Columns.Add(new DataColumn("ItemCode", typeof(string)));
        //    dt.Columns.Add(new DataColumn("Item", typeof(string)));
        //    dt.Columns.Add(new DataColumn("From", typeof(string)));
        //    dt.Columns.Add(new DataColumn("Price", typeof(string)));
        //    dt.Columns.Add(new DataColumn("OnChargeQty", typeof(string)));
        //    dt.Columns.Add(new DataColumn("SaleQty", typeof(string)));
        //    dt.Columns.Add(new DataColumn("CurrentQty", typeof(string)));

        //    if (dtGetExItemsExtraByCA.Rows.Count <= 1)
        //    {

        //        dr = dt.NewRow();

        //        dr["ItemCode"] = string.Empty;
        //        dr["Item"] = string.Empty;
        //        dr["From"] = string.Empty;
        //        dr["Price"] = string.Empty;
        //        dr["OnChargeQty"] = string.Empty;
        //        dr["SaleQty"] = string.Empty;
        //        dr["CurrentQty"] = string.Empty;


        //        dt.Rows.Add(dr);
        //    }

        //    else
        //    {
        //        for (int x = 0; dtGetExItemsExtraByCA.Rows.Count > x; x++)
        //        {
        //            dr = dt.NewRow();

        //            dr["ItemCode"] = string.Empty;
        //            dr["Item"] = string.Empty;
        //            dr["From"] = string.Empty;
        //            dr["Price"] = string.Empty;
        //            dr["OnChargeQty"] = string.Empty;
        //            dr["SaleQty"] = string.Empty;
        //            dr["CurrentQty"] = string.Empty;

        //            dt.Rows.Add(dr);
        //        }
        //    }

        //        ViewState["CurrentTable"] = dt;

        //        grdMedal.DataSource = dt;
        //        grdMedal.DataBind();
            
        //}

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetAndBindGroupMenuAttendance]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
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
            command.CommandText = "[VICTULING_GetAndBindFinalGroupMenuItemByCA]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());
            //command.Parameters.AddWithValue("@vegi", ddlVegi.SelectedItem.Text);

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

        }
    }
}