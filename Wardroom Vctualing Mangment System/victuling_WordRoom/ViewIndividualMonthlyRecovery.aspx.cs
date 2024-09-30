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
    public partial class ViewIndividualMonthlyRecovery : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtTotalIndividualMenuCost = new DataTable();

        public static int countval = 0;

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
            txtWardRoom.Text = Session["wardRoomName"].ToString();

         
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string off = txtOfficialNo.Text;
            string OSType = "Officer";
            //string ServiceType = ddlServiceType.SelectedItem.Text.ToString();

            dtOfficerSailor.Clear();

            if (OSType == "Sailor")
            {
                OS = "S";

                dtOfficerSailor = itemObject.GetAllOfficerDetails(strConnString2, OS, off);
                if (dtOfficerSailor.Rows.Count > 0)
                {
                    Session["ss"] = dtOfficerSailor;
                    Session["OS"] = OS;

                    Publishdata(dtOfficerSailor);

                }
                else
                {
                    lblError.Text = "No data found";
                }
            }

            else if (OSType == "Officer")
            {
                OS = "O";

                dtOfficerSailor = itemObject.GetAllOfficerDetails(strConnString2, OS, off);
                if (dtOfficerSailor.Rows.Count > 0)
                {
                    Session["ss"] = dtOfficerSailor;
                    Session["OS"] = OS;

                    Publishdata(dtOfficerSailor);
                    lblError.Text = "";
                }
                else
                {
                    lblError.Text = "No data found";
                }
            }
        }

        public void Publishdata(DataTable one)
        {

            DataRow row = one.Rows[0];
            nicNo_SSID = row["nicNo_SSID"].ToString();
            officialNo = row["officialNo"].ToString();
            serviceType = row["serviceType"].ToString();

            xx.Clear();
            xx = SearchPesonalDeatailBySelectedNew(nicNo_SSID, officialNo, OS, serviceType);
            GetPersonalData(xx);
            //btnBack.Visible = true;
        }

        private DataSet SearchPesonalDeatailBySelectedNew(string SelectedNic, string SelectedOff, string SelectedOS, string SelectedST)
        {

            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Parameters.Clear();
            cmd = new SqlCommand("HRIS_PersonalRecord_PersonalDetailsSelect2", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@nicNo_SSID", SqlDbType.VarChar).Value = SelectedNic;
            cmd.Parameters.Add("@off", SqlDbType.VarChar).Value = SelectedOff;
            cmd.Parameters.Add("@OS", SqlDbType.VarChar).Value = SelectedOS;
            cmd.Parameters.Add("@st", SqlDbType.VarChar).Value = SelectedST;
            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);

            return dst;
        }


        public void GetPersonalData(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {
                if (0 < (personal.Tables[0].Rows.Count))
                {
                    imgPerson.ImageUrl = personal.Tables[0].Rows[0]["image"].ToString();
                }


                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblNic.Text = personal.Tables[0].Rows[0]["nicNo_SSID"].ToString();
                }
                else
                {
                    lblNic.Text = "No Data";
                }

                if (0 < (personal.Tables[16].Rows.Count))
                {
                    lblRank.Text = personal.Tables[16].Rows[0]["description"].ToString();
                }
                else
                {
                    lblRank.Text = "No Data";
                }

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblFullName.Text = personal.Tables[0].Rows[0]["fullName"].ToString();
                }
                else
                {
                    lblFullName.Text = "No Data";
                }

                if (0 < (personal.Tables[20].Rows.Count))
                {
                    lblPermanentBase.Text = personal.Tables[20].Rows[0]["baseName"].ToString();
                }
                else
                {
                    lblPermanentBase.Text = "No Data";
                }


            }

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            if ((txtOfficialNo.Text == "") || (ddlYear.SelectedItem.Text == "---Select---") || (ddlMonth.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Official No. Cannot be Empty and Select Service Type,O/S,Year,Month and Wardroom !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                GetMonthlyTeaCostFromDataBase();
                MenuIndividualSales();
                GetTotalMenuCost();

                ExtraIndividualSales();
                PartyIndividualCost();
                TeaIndividualSales();
                GetTotalTeaCost();
                IndividualBarRecovery();
                GetTotalBarCost();
                GetTotalCost();
               

            }
        }

        private void GetMonthlyTeaCostFromDataBase()
        {
            try
            {
                lblErrorTotIndi.Visible = false;
                var sqlCommand = new SqlCommand();
                
                var ds = new DataTable();

                sqlCommand.Connection = con;
                sqlCommand.CommandText = "GetMonthlyTeaCost";
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
                sqlCommand.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
                sqlCommand.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());

                var sqlDa = new SqlDataAdapter(sqlCommand);
                sqlDa.Fill(ds);

                txtPTeaCost.Text = ds.Rows[0]["plainTeaCost"].ToString();
                txtTeaCost.Text = ds.Rows[0]["teaCost"].ToString();
            }
            catch (Exception ex)
            {
                lblErrorTotIndi.Visible = false;
                lblErrorTotIndi.Text = ex.Message;
                lblErrorTotIndi.ForeColor = System.Drawing.Color.Red;
            }
        }

        public void MenuIndividualSales()
        {
            lblError.Visible = false;
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetIndividualMealDates]";

            command.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
            command.Parameters.AddWithValue("@officerSailor", "O");
            //command.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);
            command.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
            command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
        }

        public void GetTotalMenuCost()
        {
            string officialNo = txtOfficialNo.Text;
            string os = "O";
            //string serviceType = ddlServiceType.SelectedItem.Text;
            string year = ddlYear.SelectedItem.Text;
            string month = ddlMonth.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();

            dtTotalIndividualMenuCost = itemObject.GetTotalMenuCostIndividual(strConnString, officialNo, os, year, month, wardroomCode);

            if (dtTotalIndividualMenuCost.Rows.Count > 0)
            {
                Session["ss"] = dtTotalIndividualMenuCost;
                Publishdata(dtTotalIndividualMenuCost, officialNo, os, year, month, wardroomCode);
            }
        }

        public void ExtraIndividualSales()
        {
            lblError.Visible = false;
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyIndividualSales]";

            command.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
            command.Parameters.AddWithValue("@officerSailor", "O");
            //command.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);
            command.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
            command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[0];

            grdReport0.DataBind();

            con.Close();
        }

        public void GetTotalCost()
        {
            if ((lblTotalMenuCost.Text != "") && (lblTotalExtra.Text != "") && (lblTeaCost.Text != "") && (lblPlainTeaCost.Text != ""))
            {

                lblErrorTotIndi.Visible = false;

                double MenuCost;
                double ExtraCost;
                double TeaCost;
                double PlainTeaCost;
                double PartyCost;
                double BarCost;
                double ans4;
                double ans5;

                MenuCost = System.Double.Parse(lblTotalMenuCost.Text);
                ExtraCost = System.Double.Parse(lblTotalExtra.Text);
                TeaCost = System.Double.Parse(lblTeaCost.Text);
                PlainTeaCost = System.Double.Parse(lblPlainTeaCost.Text);
                PartyCost = Convert.ToDouble(lblPartyCost.Text);
                BarCost = Convert.ToDouble(lblTotBarCost.Text);

                ans4 = MenuCost + ExtraCost + PartyCost + TeaCost + PlainTeaCost + BarCost;
                lblTotalIndividualCost.Text = ans4.ToString();

                ans5 = MenuCost + ExtraCost + PartyCost + TeaCost + PlainTeaCost;
                lblTotDiningCost.Text = ans5.ToString();
            }

            else
            {
                lblErrorTotIndi.Visible = true;
                lblErrorTotIndi.Text = "Menu Cost,Extra Cost and Total Tea Cost Cannot be Empty !";
                lblErrorTotIndi.ForeColor = System.Drawing.Color.Red;
            }
        }

     

        public void Publishdata(DataTable one, string officialNo, string os, string year, string month, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchTotalMEnuCost(officialNo, os, year, month, wardroomCode);

            GetTotalCost(xx);
        }

        private DataSet SearchTotalMEnuCost(string officialNo, string os, string year, string month, string wardroomCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetTotalIndividualMealCost]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
            cmd.Parameters.AddWithValue("@officerSailor", "O");
            //cmd.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetTotalCost(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {
                //double PlainTeaCount;
                //if (string.IsNullOrEmpty(lblPlainTeaCount.Text))
                //{
                //    PlainTeaCount = 0;
                //}
                //else
                //{
                //    PlainTeaCount = System.Double.Parse(lblPlainTeaCount.Text);
                //}


                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblTotalMenuCost.Text = personal.Tables[0].Rows[0]["TotalMenucost"].ToString();
                }
                else
                {
                    lblTotalMenuCost.Text = "0";
                }

                if (0 < (personal.Tables[1].Rows.Count))
                {
                    lblTotalExtra.Text = personal.Tables[1].Rows[0]["TotalExtracost"].ToString();
                }
                else
                {
                    lblTotalExtra.Text = "0";
                }

                if ((0 < (personal.Tables[5].Rows.Count)))
                {
                    lblPartyCost.Text = personal.Tables[5].Rows[0]["perHeadCost"].ToString();
                }
                else
                {
                    lblPartyCost.Text = "0";
                }

                if (0 < (personal.Tables[2].Rows.Count))
                {
                    lblPlainTeaCount.Text = personal.Tables[2].Rows[0]["plainTeaCount"].ToString();
                }
                else
                {
                    lblPlainTeaCount.Text = "0";
                }

                if (0 < (personal.Tables[3].Rows.Count))
                {
                    lblTeaCount.Text = personal.Tables[3].Rows[0]["teaCount"].ToString();
                }
                else
                {
                    lblTeaCount.Text = "0";
                }

                if (0 < (personal.Tables[6].Rows.Count))
                {
                    lblBillBar.Text = personal.Tables[6].Rows[0]["total"].ToString();
                }
                else
                {
                    lblBillBar.Text = "0";
                }

                if (0 < (personal.Tables[7].Rows.Count))
                {
                    lblCashSaleBar.Text = personal.Tables[7].Rows[0]["Amount"].ToString();
                }
                else
                {
                    lblCashSaleBar.Text = "0";
                }

            }
        }

        public void PartyIndividualCost()
        {
            lblError.Visible = false;
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyIndividualPartyCost]";

            command.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
            command.Parameters.AddWithValue("@officerSailor", "O");
            //command.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);
            command.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
            command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[0];

            grdReport2.DataBind();

            con.Close();
        }

        public void GetTotalTeaCost()
        {

            if ((txtTeaCost.Text != "") && (txtPTeaCost.Text != ""))
            {
                lblErrorTTea.Visible = false;

                ///Cal Plain Tea Cost
                double PlainTeaCount;
                if (string.IsNullOrEmpty(lblPlainTeaCount.Text))
                {
                    PlainTeaCount = 0;
                }
                else
                {
                    PlainTeaCount = System.Double.Parse(lblPlainTeaCount.Text);
                }

                double PTeaCost = System.Double.Parse(txtPTeaCost.Text);

                double ans1 = PlainTeaCount * PTeaCost;
                lblPlainTeaCost.Text = ans1.ToString();

                ///Cal Tea Cost
                double TeaCount;
                if (string.IsNullOrEmpty(lblTeaCount.Text))
                {
                    TeaCount = 0;
                }
                else
                {
                    TeaCount = System.Double.Parse(lblTeaCount.Text);
                }

                double TeaCost = System.Double.Parse(txtTeaCost.Text);

                double ans2 = TeaCount * TeaCost;
                lblTeaCost.Text = ans2.ToString();

                ///Cal Total Tea Cost
                double TeaCosts = System.Double.Parse(lblTeaCost.Text);
                double PlainTeaCost = System.Double.Parse(lblPlainTeaCost.Text);

                double ans3 = TeaCosts + PlainTeaCost;
                lblTotalTeaCost.Text = ans3.ToString();
            }

            else
            {
                lblErrorTTea.Visible = true;
                lblErrorTTea.Text = "Tea Cost/Plain Tea Cost Cannot be Empty !";
                lblErrorTTea.ForeColor = System.Drawing.Color.Red;
            }
        }

        public void GetTotalBarCost()
        {
            double CostBar = System.Double.Parse(lblBillBar.Text);
            double CashBar = System.Double.Parse(lblCashSaleBar.Text);
            //double TotalBar = System.Double.Parse(lblTotBarCost.Text);

            double ansBar = (CostBar - CashBar);
            lblTotBarCost.Text = ansBar.ToString();
            
          
        }

        public void TeaIndividualSales()
        {
            lblError.Visible = false;
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyIndividualTea]";

            command.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
            command.Parameters.AddWithValue("@officerSailor", "O");
            //command.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);
            command.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
            command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[0];

            grdReport1.DataBind();

            con.Close();
        }

        public void IndividualBarRecovery()
        {
            lblError.Visible = false;
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyIndividualBarBill]";

            command.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
            command.Parameters.AddWithValue("@officerSailor", "O");
            //command.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);
            command.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
            command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReportBar.DataSource = ds.Tables[0];

            grdReportBar.DataBind();

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

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport.PageCount) + e.Item.ItemIndex + 1);
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

        protected void grdReport2_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport2.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport2.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport2_ItemDataBound1(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport2.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport2.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReportBar_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReportBar.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn3") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReportBar.PageCount) + e.Item.ItemIndex + 1);
            }
        }
    }
}