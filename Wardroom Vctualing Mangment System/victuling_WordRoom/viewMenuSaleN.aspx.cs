
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
    public partial class viewMenuSaleN : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static String wardRoomName, wardRoomCode;
        public static DataTable dtOfficerList = new DataTable();
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

            dtWardroom = itemObject.GetWardroom(strConnString);
            ddlWardroom.DataSource = dtWardroom;

            ddlWardroom.DataTextField = "wardroomName";
            ddlWardroom.DataValueField = "wardroomCode";
            ddlWardroom.DataBind();

            ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            txtWardRoom.Text = Session["wardRoomName"].ToString();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {

            ViewSaleMenuItem();

            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = wardRoomCode;
            string veg = ddlVegi.SelectedItem.Text;

            dtOfficerList = itemObject.GetmenuNameList(strConnString, date, reasonCode, wardroomCode,veg);

            if (dtOfficerList.Rows.Count > 0)
            {
                Session["ss"] = dtOfficerList;
                Publishdata(dtOfficerList, date, reasonCode, wardroomCode,veg);
            }

            costPerHead();
        }

        public void costPerHead()
        {
            double NoOfDays = 0.00;
            double CostPerDay = 0.00;
            double ans5 = 0.00;

            NoOfDays = System.Double.Parse(lblCount.Text);
            CostPerDay = System.Double.Parse(lblTot.Text);


            ans5 = (CostPerDay / NoOfDays);
            lblHed.Text = ans5.ToString();
        }

        public void Publishdata(DataTable one, string date, string reasonCode, string wardroomCode,string veg)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchNameList(date, reasonCode, wardroomCode,veg);

            GetPersonalData(xx);
        }

        private DataSet SearchNameList(string date, string reasonCode, string wardroomCode, string veg)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetMenuItemList_OnDate]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@onChargeDate", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reason", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar).Value = wardroomCode;
            cmd.Parameters.Add("@vegi", SqlDbType.VarChar).Value = veg;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetPersonalData(DataSet xx)
        {

            DataSet personal = xx;
            if (personal.Tables[1].Rows.Count > 0)
            {

                if (0 < (personal.Tables[1].Rows.Count))
                {
                    string V1 = "";
                    for (int i = 0; i < (personal.Tables[1].Rows.Count); i++)
                    {
                        if ((personal.Tables[1].Rows.Count) - 1 > i)
                        {

                            V1 = V1 + personal.Tables[1].Rows[i][0].ToString() + ",";

                        }
                        else
                        {
                            V1 = V1 + personal.Tables[1].Rows[i][0].ToString();
                        }
                        txtOfficerList.Text = V1;
                    }

                }
                else
                {
                    txtOfficerList.Text = "No Data";
                }
            }

            if (0 < (personal.Tables[2].Rows.Count))
            {
                lblCount.Text = personal.Tables[2].Rows[0]["mealCount"].ToString();
            }
            else
            {
                lblCount.Text = "No Data";
            }

            //if (0 < (personal.Tables[0].Rows.Count))
            //{
            //    lblVegetarianCount.Text = personal.Tables[0].Rows[0]["mealCount"].ToString();
            //}
            //else
            //{
            //    lblVegetarianCount.Text = "No Data";
            //}
        }

        public void ViewSaleMenuItem()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMenuItemList_OnDate]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reason", ddlReason.SelectedValue);
            command.Parameters.AddWithValue("@vegi", ddlVegi.SelectedItem.Text);

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];
            grdReport.DataBind();

            decimal tot = 0;
            for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
            {
                tot += decimal.Parse(ds.Tables[0].Rows[x][7].ToString());
            }
            lblTot.Text = tot.ToString();
            lblTot.Visible = true;
            //lblError.Visible = true;
            con.Close();
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
            //if (e.CommandName == "deleteItem")
            //{
            //    GridDataItem x = (GridDataItem)e.Item;
            //    string id = x["transID"].Text.ToString();

            //    try
            //    {
            //        string query = "DELETE FROM [dbo].[T_DailyMenuSales] WHERE [transID] = '" + int.Parse(id) + "'";
            //        SqlCommand cmd = new SqlCommand(query, con);
            //        con.Open();
            //        cmd.ExecuteNonQuery();
            //        con.Close();
            //        lblError.Text = "Delete Successfull";
            //        lblError.ForeColor = System.Drawing.Color.Green;
            //    }
            //    catch (Exception ex) { }


            //    ////Update T_StockQty table

            //    string itemCode = x["itemCode"].Text.ToString();
            //    string itemId = x["transID"].Text.ToString();
            //    string qty = x["saleQty"].Text.ToString();
            //    string recFrom = x["recevedFrom"].Text.ToString();
            //    string iid = x["itemID"].Text.ToString();
            //    string unitPrice = x["unitPrice"].Text.ToString();

            //    try
            //    {
            //        SqlCommand cmd = new SqlCommand();
            //        cmd.Connection = con;

            //        con.Open();
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.CommandText = "[VICTULING_Update_T_StockQty_forMenuSale]";

            //        cmd.Parameters.AddWithValue("@itemCode", itemCode);
            //        cmd.Parameters.AddWithValue("@currentStock", qty);
            //        cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

            //        cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
            //        cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

            //        cmd.ExecuteNonQuery();
            //        cmd.Parameters.Clear();
            //        con.Close();
            //        lblError.Visible = true;

            //        lblError.Text = "Update Success!";
            //        lblError.ForeColor = System.Drawing.Color.Green;


            //    }

            //    catch (Exception ex)
            //    {
            //        //lbl_Errormsg.Visible = true;
            //        //lbl_Errormsg.Text = ex.Message;
            //    }



            //    ////Update T_Stock table

            //    try
            //    {
            //        SqlCommand cmd = new SqlCommand();
            //        cmd.Connection = con;

            //        con.Open();
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.CommandText = "[VICTULING_Update_T_Stock_forMenuSale]";

            //        cmd.Parameters.AddWithValue("@itemCode", itemCode);
            //        //cmd.Parameters.AddWithValue("@itemId", iid);
            //        cmd.Parameters.AddWithValue("@currentStock", qty);
            //        cmd.Parameters.AddWithValue("@unitPrice", unitPrice);
            //        cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());
            //        cmd.Parameters.AddWithValue("@recevedFrom", recFrom);

            //        cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
            //        cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

            //        cmd.ExecuteNonQuery();
            //        cmd.Parameters.Clear();
            //        con.Close();
            //        lblError.Visible = true;

            //        lblError.Text = "Update Success!";
            //        lblError.ForeColor = System.Drawing.Color.Green;


            //    }

            //    catch (Exception ex)
            //    {
            //        //lbl_Errormsg.Visible = true;
            //        //lbl_Errormsg.Text = ex.Message;
            //    }


            //}

            //ViewSaleMenuItem();
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
    }
}