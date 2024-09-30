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
    public partial class MealInOutByMA : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static int countval = 0;

        public static string nic = "";
        public static string OS = "";
        public static string nicNo_SSID = "";
        public static string officialNo = "";
        public static string serviceType = "";

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();

        public static DataTable dtArea = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
        public static String wardRoomName, wardRoomCode;

        public static DataTable dtRankRate = new DataTable();

        public static DataTable dtselectpersons = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (!IsPostBack)
            {
                getMenuReason();
                SetInitialRow();
            }
            
        }

        public void getMenuReason()
        {
            dtMenuReason = itemObject.GetManuReason(strConnString);
            cmbDescription.DataSource = dtMenuReason;

            cmbDescription.DataTextField = "reason";
            cmbDescription.DataValueField = "reasonCode";
            cmbDescription.DataBind();
            cmbDescription.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));


            dtGroupMenuNew = itemObject.GetGroupMenu(strConnString);
            ddlGroupMenu.DataSource = dtGroupMenuNew;

            ddlGroupMenu.DataTextField = "GroupMenu";
            ddlGroupMenu.DataValueField = "GroupMenuCode";
            ddlGroupMenu.DataBind();
           

            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = wardRoomName.ToString();

            //dtArea = itemObject.GetArea(strConnString);
            //ddlArea.DataSource = dtArea;

            //ddlArea.DataTextField = "areaName";
            //ddlArea.DataValueField = "areaName";
            //ddlArea.DataBind();

            //ddlArea.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            //ddlArea.Items.Insert(1, new RadComboBoxItem("All", "1"));

            dtRankRate = itemObject.GetRankRateAll(strConnString);
            ddlRankRate.DataSource = dtRankRate;

            ddlRankRate.DataTextField = "description";
            ddlRankRate.DataValueField = "rankRateCode";
            ddlRankRate.DataBind();

            ddlRankRate.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            ddlRankRate.Items.Insert(1, new RadComboBoxItem("All", "1"));

        }

        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            
            dt.Columns.Add(new DataColumn("serviceType", typeof(string)));
            dt.Columns.Add(new DataColumn("branchID", typeof(string)));
            dt.Columns.Add(new DataColumn("officialNo", typeof(string)));
            dt.Columns.Add(new DataColumn("rankRate", typeof(string)));
            dt.Columns.Add(new DataColumn("name", typeof(string)));
            //dt.Columns.Add(new DataColumn("result", typeof(string)));

            dr = dt.NewRow();
           
            dr["serviceType"] = string.Empty;
            dr["branchID"] = string.Empty;
            dr["officialNo"] = string.Empty;
            dr["rankRate"] = string.Empty;
            dr["name"] = string.Empty;
            //dr["result"] = string.Empty;

            //dr["Year"] = string.Empty;
            dt.Rows.Add(dr);

            dt = (DataTable)ViewState["CurrentTable"];

            grdSports.DataSource = dt;
            grdSports.DataBind();
        }


        private void SetPreviousData()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 1; i < dt.Rows.Count; i++)
                    {
                        RadTextBox box1 = (RadTextBox)grdSports.Rows[rowIndex].Cells[1].FindControl("txtServiceType");
                        RadTextBox box2 = (RadTextBox)grdSports.Rows[rowIndex].Cells[2].FindControl("txtBanch");
                        RadTextBox box3 = (RadTextBox)grdSports.Rows[rowIndex].Cells[3].FindControl("txtOfficialNo");
                        RadTextBox box4 = (RadTextBox)grdSports.Rows[rowIndex].Cells[4].FindControl("txtRankRate");
                        RadTextBox box5 = (RadTextBox)grdSports.Rows[rowIndex].Cells[5].FindControl("txtName");


                        box1.Text = dt.Rows[i]["serviceType"].ToString();
                        box2.Text = dt.Rows[i]["branchID"].ToString();
                        box3.Text = dt.Rows[i]["officialNo"].ToString();
                        box4.Text = dt.Rows[i]["rankRate"].ToString();
                        box5.Text = dt.Rows[i]["name"].ToString();
                      

                        rowIndex++;
                    }
                }
            }
        }

        private void AddNewRowToGrid()
        {
            int rowIndex = 0;

            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {

                        RadTextBox box1 = (RadTextBox)grdSports.Rows[rowIndex].Cells[1].FindControl("txtServiceType");
                        RadTextBox box2 = (RadTextBox)grdSports.Rows[rowIndex].Cells[2].FindControl("txtBanch");
                        RadTextBox box3 = (RadTextBox)grdSports.Rows[rowIndex].Cells[3].FindControl("txtOfficialNo");
                        RadTextBox box4 = (RadTextBox)grdSports.Rows[rowIndex].Cells[4].FindControl("txtRankRate");
                        RadTextBox box5 = (RadTextBox)grdSports.Rows[rowIndex].Cells[5].FindControl("txtName");


                        drCurrentRow = dtCurrentTable.NewRow();

                        //drCurrentRow["RowNumber"] = i + 1;
                        drCurrentRow["serviceType"] = box1.Text;
                        drCurrentRow["branchID"] = box2.Text;
                        drCurrentRow["officialNo"] = box3.Text;
                        drCurrentRow["rankRate"] = box4.Text;
                        drCurrentRow["name"] = box5.Text;

                        rowIndex++;
                    }

                    dtCurrentTable.Rows.Add(drCurrentRow);
                    for (int i = 1; i < countval - 1; i++)
                    {
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["serviceType"] = string.Empty;
                        drCurrentRow["branchID"] = string.Empty;
                        drCurrentRow["officialNo"] = string.Empty;
                        drCurrentRow["rankRate"] = string.Empty;
                        drCurrentRow["name"] = string.Empty;

                        //  drCurrentRow.Rows.Add(drCurrentRow);
                        dtCurrentTable.Rows.Add(drCurrentRow);
                    }

                    //dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["CurrentTable"] = dtCurrentTable;

                    grdSports.DataSource = dtCurrentTable;
                    grdSports.DataBind();


                }
            }
            else
            {
                Response.Write("ViewState is null");
            }
            //Set Previous Data on Postbacks
            SetPreviousData();
        }

        protected void btnVewMenu_Click(object sender, EventArgs e)
        {
            getMenuNon_Veg();
            getMenuVeg();
        }

        public void getMenuNon_Veg()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyMenu]";

            command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
        }


        public void getMenuVeg()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDailyMenu_Veg]";

            command.Parameters.AddWithValue("@date", dateSelected.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
            command.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[0];

            grdReport0.DataBind();

            con.Close();
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

    

        protected void grdReport0_ItemDataBound(object sender, GridItemEventArgs e)
        {

            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport0.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn0") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport0.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void ddlArea_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string baseValue = ddlArea.Text;
            DataTable Entrydt1 = tt.GetBase(baseValue, strConnString);
            ddlBase.DataSource = Entrydt1;
            ddlBase.DataTextField = "baseDescription";
            ddlBase.DataValueField = "baseCode";
            ddlBase.DataBind();
            //ddlBase.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            //ddlBase.Items.Insert(1, new RadComboBoxItem("All", "1")); 
            //ddlBase.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void ddlRankRate_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void txtOfficialNo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            if ((ddlBaseNew.SelectedItem.Text == "---Select---") || (ddlRankRate.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Select Navy Base and Rank !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                string sbase = ddlBaseNew.SelectedValue.ToString();
                string srank = ddlRankRate.SelectedValue.ToString();

                dtselectpersons.Clear();

                dtselectpersons = itemObject.GetPersonsBaseVise(strConnString, sbase, srank);
                if (dtselectpersons.Rows.Count > 0)
                {
                    // SetInitialRow();
                    Session["ss"] = dtselectpersons;
                    PublishdataPerson(sbase, srank);

                    //bindserchdatagv();
                    lblError.Text = "";

                }
                else
                {
                    lblError.Text = "No data found";
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
            }

            int k = 0;

            if (dtselectpersons.Rows.Count > 0)
            {
                ViewState["CurrentTable"] = dtselectpersons;
                SetInitialRow();
                k = 0;
                foreach (DataRow row in dtselectpersons.Rows)
                {

                    string service_Type = row[0].ToString();
                    string branch = row[1].ToString();
                    string official_no = row[2].ToString();
                    string rankRate = row[3].ToString();
                    string name = row[4].ToString();

                    RadTextBox t = (RadTextBox)grdSports.Rows[k].FindControl("txtServiceType");
                    RadTextBox t1 = (RadTextBox)grdSports.Rows[k].FindControl("txtBanch");
                    RadTextBox t2 = (RadTextBox)grdSports.Rows[k].FindControl("txtOfficialNo");
                    RadTextBox t3 = (RadTextBox)grdSports.Rows[k].FindControl("txtRankRate");
                    RadTextBox t4 = (RadTextBox)grdSports.Rows[k].FindControl("txtName");

                    t.Text = service_Type;
                    t1.Text = branch;
                    t2.Text = official_no;
                    t3.Text = rankRate;
                    t4.Text = name;

                    k++;
                }


            }
        }

        private void PublishdataPerson(string sbase, string srank)
        {
            // DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchPersonDetils(sbase, srank);

            //GetExamData(xx);
        }

        private DataSet SearchPersonDetils(string sbase, string srank)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_Get_BaseVisePersons]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@base", SqlDbType.VarChar).Value = sbase;
            cmd.Parameters.Add("@rank", SqlDbType.VarChar).Value = srank;


            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {

            if ((dateSelected.SelectedDate.ToString() == "") || (cmbDescription.SelectedItem.Text == "---Select---") || (ddlBase.SelectedItem.Text == "---Select---") || (ddlRankRate.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Select Date,Reason,Base and Rank !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                string x = "";

                for (int i = 0; i < grdSports.Rows.Count; i++)
                {
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("VICTULING_EAST_Save_T_MealAttendance", con);
                        cmd.CommandType = CommandType.StoredProcedure;

                        DataSet RepresentPosition = new DataSet();
                        SqlDataAdapter sqlda = new SqlDataAdapter();


                        RadTextBox t = (RadTextBox)grdSports.Rows[i].FindControl("txtServiceType");
                        RadTextBox t1 = (RadTextBox)grdSports.Rows[i].FindControl("txtBanch");
                        RadTextBox t2 = (RadTextBox)grdSports.Rows[i].FindControl("txtOfficialNo");
                        RadTextBox t3 = (RadTextBox)grdSports.Rows[i].FindControl("txtRankRate");
                        RadTextBox t4 = (RadTextBox)grdSports.Rows[i].FindControl("txtName");
                        RadComboBox t5 = (RadComboBox)grdSports.Rows[i].FindControl("cmbMealCount"); 
                        CheckBox t6 = (CheckBox)grdSports.Rows[i].FindControl("CheckBoxMealInOut");
                        CheckBox t7 = (CheckBox)grdSports.Rows[i].FindControl("CheckBoxNVeg");
                        CheckBox t8 = (CheckBox)grdSports.Rows[i].FindControl("CheckBoxVeg");
                        CheckBox t9 = (CheckBox)grdSports.Rows[i].FindControl("CheckBoxOther");

                        cmd.Parameters.AddWithValue("@mealDate", dateSelected.SelectedDate);
                        cmd.Parameters.AddWithValue("@officialNo", t2.Text);
                        cmd.Parameters.AddWithValue("@officerSailor", 'O');
                        cmd.Parameters.AddWithValue("@serviceType", t.Text);
                        cmd.Parameters.AddWithValue("@reason", cmbDescription.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                        //cmd.Parameters.AddWithValue("@vegetarian", t7.Checked.ToString());
                        //cmd.Parameters.AddWithValue("@noneVegetarian", t6.Checked.ToString());

                        if (t8.Checked == true)
                        {
                            cmd.Parameters.AddWithValue("@vegetarian", 1);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@vegetarian", 0);
                        }

                        if (t7.Checked == true)
                        {
                            cmd.Parameters.AddWithValue("@noneVegetarian", 1);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@noneVegetarian", 0);
                        }

                        if (t6.Checked == true)
                        {
                            cmd.Parameters.AddWithValue("@mealIn", 1);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@mealIn", 0);                          
                        }

                        if (t6.Checked == false)
                        {
                            cmd.Parameters.AddWithValue("@mealOut", 0);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@mealOut", 1);
                        }
                        
                        
                        cmd.Parameters.AddWithValue("@mealCount", t5.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@baseCode", ddlBase.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                        cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                       
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(RepresentPosition);


                        lblError.Visible = true;
                        lblError.Text = "Record has been updated successfully !";
                        lblError.ForeColor = System.Drawing.Color.Green;
                    }

                    catch (SqlException ex)
                    {
                    }
                    con.Close();
                }

            }
        }

        protected void ddlBase_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void ddlAreaNew_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void ddlBaseNew_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }
    }
}