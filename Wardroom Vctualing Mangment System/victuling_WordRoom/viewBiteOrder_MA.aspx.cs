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
using CrystalDecisions.CrystalReports.Engine;

namespace victuling_WordRoom
{
    public partial class viewBiteOrder_MA : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtViewBiteOrder = new DataTable();
        public static DataTable dt = new DataTable();
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

            if (IsPostBack)
            {

                CrystalReportViewer1.ReportSource = (ReportDocument)Session["Report"];
                CrystalReportViewer1.RefreshReport();
                CrystalReportViewer1.DataBind();

            }
        }

        public void LoadBasic()
        {

            txtWardRoom.Text = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            getOrder();
        }

        public void getOrder()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_viewBiteMenu_MA]";

            command.Parameters.AddWithValue("@type", 1);
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
            command.Parameters.AddWithValue("@reasonCode", "30000023");


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {

            if (e.CommandName == "Test")
            {
                GridDataItem item = (GridDataItem)e.Item;
                string groupType = item["groupType"].Text;
                dtViewBiteOrder = itemObject.GetBiteOrder(strConnString, dateMenuDate.SelectedDate.ToString(), cmbDescription.SelectedValue.ToString(), Session["wardRoomCode"].ToString(), groupType);

                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("VICTULING_viewBiteMenuDetails", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                da.SelectCommand.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                da.SelectCommand.Parameters.AddWithValue("@reasonCode", "30000023");
                da.SelectCommand.Parameters.AddWithValue("@groupType", groupType);

                DataSet ds = new DataSet();
                da.Fill(ds);
                grdReport0.DataSource = ds;
                grdReport0.DataBind();
                con.Close();


                getOrder();

                //////////////////////

                ReportDocument rptDoc2 = new ReportDocument();

                rptDoc2.Load(Server.MapPath("PrintBiteOrder.rpt"));
                rptDoc2.SetDatabaseLogon("sa", "SDUAdmin@2019", "10.10.1.237", "VICTULING");

                DataSet dataset = new DataSet();
                SqlCommand myCommand = new SqlCommand("VICTULING_viewBiteMenuDetails");
                myCommand.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                myCommand.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                myCommand.Parameters.AddWithValue("@reasonCode", "30000023");
                myCommand.Parameters.AddWithValue("@groupType", groupType);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.Connection = con;
                SqlDataAdapter da1 = new SqlDataAdapter(myCommand);
                da1.Fill(dataset);

                rptDoc2.SetDataSource(dataset.Tables[0]);
                Session["Report"] = rptDoc2;



                CrystalReportViewer1.ReportSource = rptDoc2;

                CrystalReportViewer1.DataBind();
            }
        }

        protected void ToggleRowSelection(object sender, EventArgs e)
        {
            ((sender as CheckBox).NamingContainer as GridItem).Selected = (sender as CheckBox).Checked;
            bool checkHeader = true;
            foreach (GridDataItem dataItem in grdReport.MasterTableView.Items)
            {
                if (!(dataItem.FindControl("cbxSelect") as CheckBox).Checked)
                {
                    checkHeader = false;
                    break;
                }
            }
            GridHeaderItem headerItem = grdReport.MasterTableView.GetItems(GridItemType.Header)[0] as GridHeaderItem;
            (headerItem.FindControl("headerChkbox") as CheckBox).Checked = checkHeader;
        }

        protected void ToggleSelectedState(object sender, EventArgs e)
        {
            CheckBox headerCheckBox = (sender as CheckBox);
            foreach (GridDataItem dataItem in grdReport.MasterTableView.Items)
            {
                (dataItem.FindControl("cbxSelect") as CheckBox).Checked = headerCheckBox.Checked;
                dataItem.Selected = headerCheckBox.Checked;

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

        protected void grdReport_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void btnBiteOrder_Click(object sender, EventArgs e)
        {
            crystalData();
        }
        protected void crystalData()
        {
            try
            {
                

                string type = "1";
                string wardroomCode = Session["wardRoomCode"].ToString();
                string date = dateMenuDate.SelectedDate.ToString();
                string reason = "30000023";

                
                dt = itemObject.GetBiteOrderPrint(strConnString, type, wardroomCode, date, reason);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
               
                    string groupType = "";

                    groupType = dt.Rows[i]["groupType"].ToString();


                    ReportDocument rptDoc2 = new ReportDocument();

                    rptDoc2.Load(Server.MapPath("PrintBiteOrder.rpt"));
                    rptDoc2.SetDatabaseLogon("sa", "SDUAdmin@2019", "10.10.1.237", "VICTULING");
                    // rptDoc2.DataSourceConnections[0].SetConnection("10.10.1.237", "VICTULING", "sa", "SDUAdmin@2019");

                    DataSet dataset = new DataSet();
                    SqlCommand myCommand = new SqlCommand("VICTULING_viewBiteMenuDetails");
                    myCommand.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                    myCommand.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                    myCommand.Parameters.AddWithValue("@reasonCode", "30000023");
                    myCommand.Parameters.AddWithValue("@groupType", groupType);

                    myCommand.CommandType = CommandType.StoredProcedure;
                    myCommand.Connection = con;
                    SqlDataAdapter da = new SqlDataAdapter(myCommand);
                    da.Fill(dataset);

                    rptDoc2.SetDataSource(dataset.Tables[0]);
                    Session["Report"] = rptDoc2;



                    CrystalReportViewer1.ReportSource = rptDoc2;

                    CrystalReportViewer1.DataBind();
                }
            }
            catch (Exception x)
            {

            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }


        //public void updateNonVegMenuCost()
        //{
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = con;


        //    string wardroomCode = Session["wardRoomCode"].ToString();
        //    string year = ddlYear.SelectedValue.ToString();
        //    string month = ddlMonth.SelectedValue.ToString();

        //    dt = itemObject.GetAuthorizedNonMenuCostList(strConnString, wardroomCode, year, month);


        //    for (int i = 0; i < dt.Rows.Count; i++)
        //    {
        //        string serviceType = "";
        //        string branch = "";
        //        string offNo = "";
        //        string rankRate = "";
        //        string name = "";
        //        string cost = "";


        //        serviceType = dt.Rows[i]["serviceType"].ToString();
        //        branch = dt.Rows[i]["branchID"].ToString();
        //        offNo = dt.Rows[i]["officialNo"].ToString();
        //        rankRate = dt.Rows[i]["rankRate"].ToString();
        //        name = dt.Rows[i]["name"].ToString();
        //        cost = dt.Rows[i]["cost"].ToString();

        //        SqlCommand sqlcmd = new SqlCommand();
        //        sqlcmd.Connection = con;
        //        try
        //        {

        //            con.Open();
        //            sqlcmd.CommandType = CommandType.StoredProcedure;
        //            sqlcmd.CommandText = "VICTULING_Update_allOfficersMenuCost";

        //            sqlcmd.Parameters.AddWithValue("@serviceType", serviceType);
        //            sqlcmd.Parameters.AddWithValue("@branch", branch);
        //            sqlcmd.Parameters.AddWithValue("@offNo", offNo);
        //            sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
        //            sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
        //            sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
        //            sqlcmd.Parameters.AddWithValue("@nVegMenuCost", cost);
        //            sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
        //            sqlcmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


        //            sqlcmd.ExecuteNonQuery();
        //            con.Close();
        //            lblSave.Visible = true;
        //            lblSave.ForeColor = System.Drawing.Color.Green;
        //            lblSave.Text = "Save Success !";

        //        }
        //        catch
        //        {

        //        }
        //    }
        //}
    }
}