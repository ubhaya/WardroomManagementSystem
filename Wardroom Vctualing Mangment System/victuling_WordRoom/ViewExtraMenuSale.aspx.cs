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
    public partial class ViewExtraMenuSale : System.Web.UI.Page
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
        public static DataTable dtGroupMenuCount = new DataTable();
        public static DataTable dtGetDeductItems = new DataTable();
        public static int countval = 0;
        public static DataTable dtSalebySA = new DataTable();
        public static DataTable dtTotalMenuCost = new DataTable();
        public static DataTable dtGetGroupMEx = new DataTable();

        public static string nic = "";
        public static string OS = "";
        public static string nicNo_SSID = "";
        public static string officialNo = "";
        public static string serviceType = "";

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();

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
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMenuCcstomizeMealItemList]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedItem.Text);
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            //command.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);            
            //command.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);

            //adapter = new SqlDataAdapter(command);
            adapter.SelectCommand = command;
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[0];

            grdReport0.DataBind();

            con.Close();

            if (ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {
                view_GroupMenu();
            }

            if (ddlVegi.SelectedItem.Text == "Vegetarian")
            {
                view_VegGroupMenu();
            }

            ViewGroupMenuAttendanceList();
            //view_ItemList();

            getGroupMenuCount();
            //ViewGropMenuIngredients();
        }

        public void view_GroupMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyMenu]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[0];

            grdReport2.DataBind();

            con.Close();
        }

        public void view_VegGroupMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyMenu_Veg]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[0];

            grdReport2.DataBind();

            con.Close();
        }

        public void ViewGroupMenuAttendanceList()
        {
            if (ddlVegi.SelectedItem.Text == "Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_GetGroupMealAttendanceList_vegetarian]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@GroupMenuCode", ddlGroupMenu.SelectedValue.ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport3.DataSource = ds.Tables[0];

                grdReport3.DataBind();

                con.Close();

                ///////////
                //string date = dateSelected.SelectedDate.ToString();
                //string reasonCode = cmbDescription.SelectedValue.ToString();
                //string wardroomCode = wardRoomCode;

                //dtVegetarian = itemObject.GetVegiCount(strConnString, date, reasonCode, wardroomCode);

                //if (dtVegetarian.Rows.Count > 0)
                //{
                //    Session["ss"] = dtVegetarian;
                //    PublishdataVegi(dtVegetarian, date, reasonCode, wardroomCode);
                //}
            }

            else if (ddlVegi.SelectedItem.Text == "Non-Vegetarian")
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_GetGroupMealAttendanceList_NonVegetarian]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@GroupMenuCode", ddlGroupMenu.SelectedValue.ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport3.DataSource = ds.Tables[0];

                grdReport3.DataBind();

                con.Close();

                //    //////////

                //    string date = dateSelected.SelectedDate.ToString();
                //    string reasonCode = cmbDescription.SelectedValue.ToString();
                //    string wardroomCode = wardRoomCode;

                //    dtNonVegetarian = itemObject.GetNonVegiCount(strConnString, date, reasonCode, wardroomCode);

                //    if (dtNonVegetarian.Rows.Count > 0)
                //    {
                //        Session["ss"] = dtNonVegetarian;
                //        Publishdata(dtNonVegetarian, date, reasonCode, wardroomCode);
                //    }
            }
        }

        //public void view_ItemList()
        //{
        //    con.Open();
        //    SqlCommand command = new SqlCommand();
        //    SqlDataAdapter adapter = new SqlDataAdapter();
        //    DataSet ds = new DataSet();

        //    command.Connection = con;
        //    command.CommandType = CommandType.StoredProcedure;
        //    command.CommandText = "[VICTULING_GetMenuCcstomizeItemList]";

        //    command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
        //    command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
        //    command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
        //    //command.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
        //    command.Parameters.AddWithValue("@officerSailor", "O");
        //    command.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);

        //    adapter.SelectCommand = command;
        //    adapter.Fill(ds);

        //    grdReport1.DataSource = ds.Tables[0];

        //    grdReport1.DataBind();

        //    con.Close();


        //}

        protected void ViewIngredientsList_Click(object sender, EventArgs e)
        {
            ViewGropMenuIngredients();
        }

        public void ViewGropMenuIngredients()
        {
            int a = 0;
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_getIngredientsListForGroupMenu]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
            if (!string.IsNullOrEmpty(txtOffNoList.Text))
            {
                List<string> offNOList = txtOffNoList.Text.Split(',').Reverse().ToList();
                if (offNOList.Count > 0)
                {
                    for (int x = 0; x < offNOList.Count; x++)
                    {
                        int offNo = int.Parse(offNOList[x]);
                        a = int.Parse(offNOList.Count.ToString());

                    }


                }
            }
            command.Parameters.AddWithValue("@noOfPerson", a);
            command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport4.DataSource = ds.Tables[0];

            grdReport4.DataBind();

            con.Close();


        }

        public void getGroupMenuCount()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string reasonCode = ddlReason.SelectedValue.ToString();
            string wardroomCode = wardRoomCode.ToString().Trim();
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
                        txtOffNoList.Text = V1;
                    }

                }
                else
                {
                    txtOffNoList.Text = "No Data";
                }


            }
        }

        protected void lnTotalIngredientsList_Click(object sender, EventArgs e)
        {
            if (txtOffNoList.Text != "")
            {
                int a = 0;

                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_getIngredientsListForGroupMenu_Tot]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
                if (!string.IsNullOrEmpty(txtOffNoList.Text))
                {
                    List<string> offNOList = txtOffNoList.Text.Split(',').Reverse().ToList();
                    if (offNOList.Count > 0)
                    {
                        for (int x = 0; x < offNOList.Count; x++)
                        {
                            int offNo = int.Parse(offNOList[x]);
                            a = int.Parse(offNOList.Count.ToString());

                        }
                    }
                }
                command.Parameters.AddWithValue("@noOfPerson", a);
                //command.Parameters.AddWithValue("@noOfPerson", lblGroupMenuCount.Text);
                command.Parameters.AddWithValue("@vegiNonVegi", ddlVegi.SelectedItem.Text);
                command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport5.DataSource = ds.Tables[0];

                grdReport5.DataBind();

                con.Close();
            }
            else
            {
                Label15.Text = "Please Enter Official No.";
                Label15.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void grdReport2_ItemCommand(object sender, GridCommandEventArgs e)
        {

           
        }

        protected void grdReport3_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport3.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn3") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport3.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport4_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport4.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn4") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport4.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport3_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport3.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn3") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport3.PageCount) + e.Item.ItemIndex + 1);
            }
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

        protected void grdReport4_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport4.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn4") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport4.PageCount) + e.Item.ItemIndex + 1);
            }
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

        protected void grdReport5_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport5.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn5") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport5.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport2_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport2.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport2.PageCount) + e.Item.ItemIndex + 1);
            }
        }
    }
}