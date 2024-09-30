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
    public partial class UpdateMealInOut : System.Web.UI.Page
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
        public static DataTable dtUpdselectpersons = new DataTable();
       
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

            dtArea = itemObject.GetArea(strConnString);
            ddlArea.DataSource = dtArea;

            ddlArea.DataTextField = "areaName";
            ddlArea.DataValueField = "areaName";
            ddlArea.DataBind();

            ddlArea.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            //ddlArea.Items.Insert(1, new RadComboBoxItem("All", "1"));

            dtRankRate = itemObject.GetRankRateAll(strConnString);
            ddlRankRate.DataSource = dtRankRate;

            ddlRankRate.DataTextField = "description";
            ddlRankRate.DataValueField = "rankRateCode";
            ddlRankRate.DataBind();

            ddlRankRate.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            ddlRankRate.Items.Insert(1, new RadComboBoxItem("All", "1"));

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
        }

        protected void ddlRankRate_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
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
                string mealDate = dateSelected.SelectedDate.ToString();
                string reason = cmbDescription.SelectedValue.ToString();
                string groupMenuCode = ddlGroupMenu.SelectedValue.ToString();

                dtUpdselectpersons.Clear();

                dtUpdselectpersons = itemObject.GetUpdatePersonsBaseVise(strConnString, sbase, srank,mealDate,reason,groupMenuCode);
                if (dtUpdselectpersons.Rows.Count > 0)
                {
                    // SetInitialRow();
                    Session["ss"] = dtUpdselectpersons;
                    UpdatedataPerson(sbase, srank, mealDate, reason, groupMenuCode);

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

            if (dtUpdselectpersons.Rows.Count > 0)
            {
                ViewState["CurrentTable"] = dtUpdselectpersons;
                SetInitialRow();
                k = 0;
                foreach (DataRow row in dtUpdselectpersons.Rows)
                {

                    string service_Type = row[0].ToString();
                    string branch = row[1].ToString();
                    string official_no = row[2].ToString();
                    string rankRate = row[3].ToString();
                    string name = row[4].ToString();
                    string mealIn = row[6].ToString();
                    string mealOut = row[7].ToString();
                    string mealCount = row[8].ToString();
                    string nVeg = row[9].ToString();
                    string veg = row[10].ToString();

                    RadTextBox t = (RadTextBox)grdSports.Rows[k].FindControl("txtServiceType");
                    RadTextBox t1 = (RadTextBox)grdSports.Rows[k].FindControl("txtBanch");
                    RadTextBox t2 = (RadTextBox)grdSports.Rows[k].FindControl("txtOfficialNo");
                    RadTextBox t3 = (RadTextBox)grdSports.Rows[k].FindControl("txtRankRate");
                    RadTextBox t4 = (RadTextBox)grdSports.Rows[k].FindControl("txtName");
                    CheckBox t5 = (CheckBox)grdSports.Rows[k].FindControl("CheckBoxMealInOut");
                    RadComboBox t6 = (RadComboBox)grdSports.Rows[k].FindControl("cmbMealCount");
                    CheckBox t7 = (CheckBox)grdSports.Rows[k].FindControl("CheckBoxNVeg");
                    CheckBox t8 = (CheckBox)grdSports.Rows[k].FindControl("CheckBoxVeg");

                    t.Text = service_Type;
                    t1.Text = branch;
                    t2.Text = official_no;
                    t3.Text = rankRate;
                    t4.Text = name;
                    if (mealIn =="True")
                    {
                        t5.Checked = true;
                    }
                    else 
                    {
                        t5.Checked = false;
                    }

                    t6.SelectedItem.Text = mealCount;

                    if (nVeg == "True")
                    {
                        t7.Checked = true;
                    }
                    else 
                    {
                        t7.Checked = false;
                    }

                    if (veg == "True")
                    {
                        t8.Checked = true;
                    }
                    else 
                    {
                        t8.Checked = false;
                    }


                    k++;
                }


            }
        }

        private void UpdatedataPerson(string sbase, string srank, string mealDate, string reason, string groupMenuCode)
        {
            // DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchUpdatePersonDetils(sbase, srank, mealDate, reason, groupMenuCode);

            //GetExamData(xx);
        }

        private DataSet SearchUpdatePersonDetils(string sbase, string srank, string mealDate, string reason, string groupMenuCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_Get_UpdateBaseVisePersons]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@base", SqlDbType.VarChar).Value = sbase;
            cmd.Parameters.Add("@rank", SqlDbType.VarChar).Value = srank;
            cmd.Parameters.Add("@mealDate", SqlDbType.VarChar).Value = mealDate;
            cmd.Parameters.Add("@reason", SqlDbType.VarChar).Value = reason;
            cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar).Value = groupMenuCode;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        protected void txtOfficialNo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdSports.Rows.Count; i++)
            {
                try
                {
                    RadTextBox txtService = (RadTextBox)grdSports.Rows[i].FindControl("txtServiceType");
                    RadTextBox txtOff = (RadTextBox)grdSports.Rows[i].FindControl("txtOfficialNo");
                    RadTextBox txtRank = (RadTextBox)grdSports.Rows[i].FindControl("txtRankRate"); 
                    CheckBox chkMealInOut = (CheckBox)grdSports.Rows[i].FindControl("CheckBoxMealInOut");
                    RadComboBox chkMealCount = (RadComboBox)grdSports.Rows[i].FindControl("cmbMealCount");
                    CheckBox chkNVeg = (CheckBox)grdSports.Rows[i].FindControl("CheckBoxNVeg");
                    CheckBox chkVeg = (CheckBox)grdSports.Rows[i].FindControl("CheckBoxVeg");


                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_MealAttendance]";

                    cmd.Parameters.AddWithValue("@mealDate", dateSelected.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@officialNo", txtOff.Text);
                    cmd.Parameters.AddWithValue("@officerSailor", 'O');
                    cmd.Parameters.AddWithValue("@serviceType", txtService.Text);
                    cmd.Parameters.AddWithValue("@reason", cmbDescription.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    if (chkMealInOut.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@mealIn", 1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@mealIn", 0);
                    }

                    if (chkMealInOut.Checked == false)
                    {
                        cmd.Parameters.AddWithValue("@mealOut", 1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@mealOut", 0);
                    }

                    cmd.Parameters.AddWithValue("@mealCount", chkMealCount.SelectedValue.ToString());

                    if (chkNVeg.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@noneVegetarian", 1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@noneVegetarian", 0);
                    }

                    if (chkVeg.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@vegetarian", 1);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@vegetarian", 0);
                    }
                    cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Update Meal Attendance Successfully!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }

            }
        }
    }
}