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
    public partial class ViewGroupMenuItemList : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItems = new DataTable();
        public static DataTable dtGetSaleItemsQty = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
        public static int countval = 0;
        public static DataTable dtGroupMenuCount = new DataTable();

        public static DataTable dtOfficerList = new DataTable();
        public static DataTable dtGetGroupMenuList = new DataTable();

        public static string nic = "";
        public static string OS = "";
        public static string nicNo_SSID = "";
        public static string officialNo = "";
        public static string serviceType = "";
        public static String wardRoomCode;

        public static DataSet xx = new DataSet();
        public static DataSet xx1 = new DataSet();
        public static DataSet xx2 = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();
                //SetInitialRow();
            }

            //lblDate.Visible = false;
            //lblReason.Visible = false;
        }

        public void LoadBasic()
        {

        
            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = Session["wardRoomName"].ToString();
    

            dtMenuReason = itemObject.GetManuReason(strConnString);
            ddlReason.DataSource = dtMenuReason;

            ddlReason.DataTextField = "reason";
            ddlReason.DataValueField = "reasonCode";
            ddlReason.DataBind();
            ddlReason.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            ddlGroupMenu.DataSource = dtGroupMenuNew;

            ddlGroupMenu.DataTextField = "GroupMenu";
            ddlGroupMenu.DataValueField = "GroupMenuCode";
            ddlGroupMenu.DataBind();
            ddlGroupMenu.Items.Insert(0, new RadComboBoxItem("---Select---", ""));
        }

        protected void btnViewExtra_Click(object sender, EventArgs e)
        {


            //if (dateSaleDate.SelectedDate != null)
            //{
            //    DateTime dat = Convert.ToDateTime(dateSaleDate.SelectedDate.ToString());
            //    dateSaleDate.Text = dat.ToString("yyyy-MM-dd");
            //}

            //ddlReason.Text = ddlReason.SelectedItem.Text;
            con.Close();
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            //command.CommandText = "[VICTULING_GetIndividualItemList_OnDate]";
            command.CommandText = "[VICTULING_GetGroupMenuIngedientList_Total]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue);
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue);
            command.Parameters.AddWithValue("@vegNonVeg", ddlVegi.SelectedValue);

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            getGroupMenuCount();

            decimal tot = 0;
            for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
            {
                tot += decimal.Parse(ds.Tables[0].Rows[x][5].ToString());
            }
            lblTot.Text = tot.ToString();

            int count = 0;
            decimal totaPrice = 0;

            count = System.Int32.Parse(lblGroupMenuCount.Text);
            
            totaPrice = (tot);
            lblTot.Text = totaPrice.ToString();
            
            lblTot.Visible = true;
            Label2.Visible = true;

            con.Close();

            
            costPerHead();
            GetGroupMenuNameList();
        }

        public void GetGroupMenuNameList()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = wardRoomCode;
            string veg = ddlVegi.SelectedItem.Text;
            string groupMenu = ddlGroupMenu.SelectedValue.ToString();

            dtGetGroupMenuList = itemObject.GetGroupmenuNameList(strConnString, date, reasonCode, wardroomCode, veg, groupMenu);

            if (dtGetGroupMenuList.Rows.Count > 0)
            {
                Session["ss"] = dtGetGroupMenuList;
                PublishdataData(dtGetGroupMenuList, date, reasonCode, wardroomCode, veg, groupMenu);
            }
        }

        public void PublishdataData(DataTable one, string date, string reasonCode, string wardroomCode, string veg, string groupMenu)
        {

            DataRow row = one.Rows[0];

            xx1.Clear();
            xx1 = SearchNameList(date, reasonCode, wardroomCode, veg, groupMenu);

            GetPersonalData1(xx1);
        }

        private DataSet SearchNameList(string date, string reasonCode, string wardroomCode, string veg, string groupMenu)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetGroupMenuOffNoList]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@onChargeDate", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar).Value = wardroomCode;
            cmd.Parameters.Add("@vegNonVeg", SqlDbType.VarChar).Value = veg;
            cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar).Value = groupMenu;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetPersonalData1(DataSet xx)
        {

            DataSet personal = xx1;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    string V1 = "";
                    for (int i = 0; i < (personal.Tables[0].Rows.Count); i++)
                    {
                        if ((personal.Tables[0].Rows.Count) - 1 > i)
                        {

                            V1 = V1 + personal.Tables[0].Rows[i][0].ToString() + ",";

                        }
                        else
                        {
                            V1 = V1 + personal.Tables[0].Rows[i][0].ToString();
                        }
                        txtOfficerList.Text = V1;
                    }

                }
                else
                {
                    txtOfficerList.Text = "No Data";
                }
            }
        }

        public void costPerHead()
        {
            double NoOfDays = 0.00;
            double CostPerDay = 0.00;
            double ans5 = 0.00;

            NoOfDays = System.Double.Parse(lblGroupMenuCount.Text);
            CostPerDay = System.Double.Parse(lblTot.Text);


            ans5 = (CostPerDay / NoOfDays);
            Label20.Text = ans5.ToString();
        }

        public void getGroupMenuCount()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();
            string groupMenuCode = ddlGroupMenu.SelectedValue.ToString();
            string vegNonVeg = ddlVegi.SelectedItem.Text;

            dtGroupMenuCount = itemObject.GetGroupMenuCount(strConnString, date, reasonCode, wardroomCode, groupMenuCode, vegNonVeg);

            if (dtGroupMenuCount.Rows.Count > 0)
            {
                Session["ss"] = dtGroupMenuCount;
                Publishdata(dtGroupMenuCount, date, reasonCode, wardroomCode, groupMenuCode, vegNonVeg);
            }
        }

        public void Publishdata(DataTable one, string date, string reasonCode, string wardroomCode, string groupMenuCode, string vegNonVeg)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchGroupMenuCount(date, reasonCode, wardroomCode, groupMenuCode, vegNonVeg);

            GetGroupMenuCount(xx);
        }

        private DataSet SearchGroupMenuCount(string date, string reasonCode, string wardroomCode, string groupMenuCode, string vegNonVeg)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetGroupMealAttendanceCount]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar).Value = reasonCode;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;
            cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 250).Value = groupMenuCode;
            cmd.Parameters.Add("@vegNonVeg", SqlDbType.VarChar, 250).Value = vegNonVeg;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetGroupMenuCount(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblGroupMenuCount.Text = personal.Tables[0].Rows[0]["mealCount"].ToString();
                }
                else
                {
                    lblGroupMenuCount.Text = "No Data";
                }

            
            }
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

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void ddlVegi_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }
    }
}