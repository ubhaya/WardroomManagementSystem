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
using System.Collections;

namespace victuling_WordRoom
{
    public partial class CalCostForeMeal : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtView = new DataTable();
        public static DataTable dtVegiView = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();

        public static DataSet xx = new DataSet();

        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {

            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (!IsPostBack)
            {
                getMenuReason();
                
            }
        }

        public void getMenuReason()
        {

            txtWardRoom.Text = Session["wardRoomName"].ToString();

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

            dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            ddlGroupMenu.DataSource = dtGroupMenuNew;

            ddlGroupMenu.DataTextField = "GroupMenu";
            ddlGroupMenu.DataValueField = "GroupMenuCode";
            ddlGroupMenu.DataBind();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            if(ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {

                //lblMenuCost0.Text = "";
                //lblCount0.Text = "";
                //lblMenuCostP0.Text = "";

            string date = dateSelected.SelectedDate.ToString();
            string reasonCode = cmbDescription.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();
            string groupType = ddlGroupMenu.SelectedValue.ToString();

            dtView = itemObject.GetCount(strConnString, date, reasonCode, wardroomCode, groupType);

            if (dtView.Rows.Count > 0)
            {
                Session["ss"] = dtView;
                Publishdata(dtView, date, reasonCode, wardroomCode, groupType);
            }

            }

            else if(ddlVegi.SelectedItem.Text == "Vegetarian")
            {
                //lblMenuCost.Text = "";
                //lblCount.Text = "";
                //lblMenuCostP.Text = "";

                string date = dateSelected.SelectedDate.ToString();
                string reasonCode = cmbDescription.SelectedValue.ToString();
                string wardroomCode = Session["wardRoomCode"].ToString();
                string groupType = ddlGroupMenu.SelectedValue.ToString();

                dtVegiView = itemObject.GetVegitaCount(strConnString, date, reasonCode, wardroomCode, groupType);
                    
                if (dtVegiView.Rows.Count > 0)
                {
                    Session["ss"] = dtView;
                    PublishdataVegi(dtVegiView, date, reasonCode, wardroomCode, groupType);
                }
            }

           
        }


        public void update_T_TotalMenuCost()
        {


            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            for (int i = 0; i < grdReport0.Items.Count; i++)
            {

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[VICTULING_Update_TotalMenuCostPerPerson]";


            CheckBox chkbox1 = (CheckBox)grdReport0.Items[i].FindControl("cbxSelect");

                if (chkbox1.Checked)
                {
                    
                    cmd.Parameters.AddWithValue("@date", grdReport0.Items[i].Cells[4].Text.ToString());
                    cmd.Parameters.AddWithValue("@reason", cmbDescription.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    cmd.Parameters.AddWithValue("@vegi", ddlVegi.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@noOfPersons", grdReport0.Items[i].Cells[6].Text.ToString());
                    cmd.Parameters.AddWithValue("@costPerPerson", grdReport0.Items[i].Cells[7].Text.ToString());
                    cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@lastModifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastModifiedDate", System.DateTime.Now);
                    cmd.Parameters.AddWithValue("@isAuthrized", 1);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    }


                    lblError.Visible = true;
                    lblError.ForeColor = System.Drawing.Color.Green;
                    lblError.Text = "Authorized Sucessfully !";
                //}
            }

        
        }

 

        protected void ToggleSelectedState(object sender, EventArgs e)
        {
            CheckBox headerCheckBox = (sender as CheckBox);
            foreach (GridDataItem dataItem in grdReport0.MasterTableView.Items)
            {
                (dataItem.FindControl("cbxSelect") as CheckBox).Checked = headerCheckBox.Checked;
                dataItem.Selected = headerCheckBox.Checked;

            }
        }

        protected void ToggleRowSelection(object sender, EventArgs e)
        {
            ((sender as CheckBox).NamingContainer as GridItem).Selected = (sender as CheckBox).Checked;
            bool checkHeader = true;
            foreach (GridDataItem dataItem in grdReport0.MasterTableView.Items)
            {
                if (!(dataItem.FindControl("cbxSelect") as CheckBox).Checked)
                {
                    checkHeader = false;
                    break;
                }
            }
            GridHeaderItem headerItem = grdReport0.MasterTableView.GetItems(GridItemType.Header)[0] as GridHeaderItem;
            (headerItem.FindControl("headerChkbox") as CheckBox).Checked = checkHeader;

        }

        public void Publishdata(DataTable one, string date, string reasonCode, string wardroomCode, string groupType)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchDetils(date, reasonCode, wardroomCode, groupType);

            GetData(xx);
        }

        public void PublishdataVegi(DataTable one, string date, string reasonCode, string wardroomCode, string groupType)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchDetilsVegi(date, reasonCode, wardroomCode, groupType);

            GetDataVegi(xx);
        }

        public void GetData(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    decimal totalCost = decimal.Parse(personal.Tables[0].Rows[0]["totalCost"].ToString()) ;
                    lblMenuCost.Text = Math.Round(totalCost ,2).ToString() ;
                }
                else
                {
                    lblMenuCost.Text = "No Data";
                }

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblCount.Text = personal.Tables[0].Rows[0]["mealCount"].ToString();
                }
                else
                {
                    lblCount.Text = "No Data";
                }

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    decimal menuCost = decimal.Parse(personal.Tables[0].Rows[0]["cost"].ToString());
                    lblMenuCostP.Text = Math.Round(menuCost, 2).ToString();
                }
                else
                {
                    lblMenuCostP.Text = "No Data";
                }

            }
        }

        public void GetDataVegi(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    decimal totalCostVegi = decimal.Parse(personal.Tables[0].Rows[0]["totalCost"].ToString()) ;
                    lblMenuCost.Text = Math.Round(totalCostVegi,2).ToString() ;
                }
                else
                {
                    lblMenuCost.Text = "No Data";
                }

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblCount.Text = personal.Tables[0].Rows[0]["mealCount"].ToString();
                }
                else
                {
                    lblCount.Text = "No Data";
                }

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    decimal menuCostVegi = decimal.Parse(personal.Tables[0].Rows[0]["cost"].ToString());
                    lblMenuCostP.Text = Math.Round(menuCostVegi,2).ToString() ;
                }
                else
                {
                    lblMenuCostP.Text = "No Data";
                }

            }
        }

        private DataSet SearchDetils(string date, string reasonCode, string wardroomCode, string groupType)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetMenuCost]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;
            cmd.Parameters.Add("@groupType", SqlDbType.VarChar).Value = groupType;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }


        private DataSet SearchDetilsVegi(string date, string reasonCode, string wardroomCode, string groupType)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetMenuCostVegetarian]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;
            cmd.Parameters.Add("@groupType", SqlDbType.VarChar).Value = groupType;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        protected void ddlVegi_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            
            update_T_TotalMenuCost();
            getData();
        }

        protected void RadButton2_Click(object sender, EventArgs e)
        {

            getData();
           
        }

        public void getData()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMenuCostVegetarian_ForMonth]";

            command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@groupType", ddlGroupMenu.SelectedValue.ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());
            command.Parameters.AddWithValue("@vegi", ddlVegi.SelectedItem.Text);


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[0];

            grdReport0.DataBind();

            con.Close();
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {

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


    

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void grdReport0_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick")
            {
                int index = e.Item.ItemIndex;
                GridDataItem item = (GridDataItem)grdReport0.Items[index];
                //Get the values from the row uaing the columnUniqueName 
                string id = item["cbxSelect"].Text;
            }
        }
    }
}