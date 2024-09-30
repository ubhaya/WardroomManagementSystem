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
    public partial class viewBiteOrder : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtViewBiteOrder = new DataTable();

        public static String wardRoomName, wardRoomCode;
        public static DataTable dt = new DataTable();

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

            //lblReason.Text = ddlReason.SelectedItem.Text;
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
            command.CommandText = "[VICTULING_viewBiteMenu]";

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

        protected void grdReport_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        private Hashtable CustomersChecked
        {
            get
            {
                object res = ViewState["_cc"];
                if (res == null)
                {
                    res = new Hashtable();
                    ViewState["_cc"] = res;
                }

                return (Hashtable)res;
            }
        }

        protected void btnDeleteGrid1_Click(object sender, EventArgs e)
        {
                
            updateBiteOrder();
            getOrder();
        }

        public void updateBiteOrder()
        {
            for (int i = 0; i < grdReport.Items.Count; i++)
            {

                CheckBox chkbox1 = (CheckBox)grdReport.Items[i].FindControl("CheckBox1");

                GridDataItem item = (GridDataItem)chkbox1.NamingContainer;
                System.Collections.Hashtable target = null;

                target = CustomersChecked;

                string groupType = item["groupType"].Text;

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {
                    if (chkbox1.Checked == true)
                    {
                        con.Open();
                        sqlcmd.CommandType = CommandType.StoredProcedure;
                        sqlcmd.CommandText = "VICTULING_T_BiteMenue";


                        //if (chkbox1.Checked == true)
                        //{
                        //    sqlcmd.Parameters.AddWithValue("@isOrderCompleted", 1);
                        //}
                        //else
                        //{
                        //    sqlcmd.Parameters.AddWithValue("@isOrderCompleted", 0);
                        //}
                        sqlcmd.Parameters.AddWithValue("@lastModifiedUser", Session["LOGIN_NAME"].ToString());
                        sqlcmd.Parameters.AddWithValue("@lastModifiedDate", System.DateTime.Now);
                        sqlcmd.Parameters.AddWithValue("@date", dateMenuDate.SelectedDate.ToString());
                        sqlcmd.Parameters.AddWithValue("@reason", "30000023");
                        sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                        sqlcmd.Parameters.AddWithValue("@groupType", groupType);
                        sqlcmd.Parameters.AddWithValue("@isOrderCompleted", 1);


                        sqlcmd.ExecuteNonQuery();
                        con.Close();
                        lblSave.Visible = true;
                        lblSave.ForeColor = System.Drawing.Color.Green;
                        lblSave.Text = "Update Success !";
                    }

                }
                catch
                {

                }
            }
            //}
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
            }

            getOrder();


           
       
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

        protected void grdReport0_ItemCommand(object sender, GridCommandEventArgs e)
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

        protected void btnBiteOrder_Click(object sender, EventArgs e)
        {
            //Response.Redirect("PrintBiteOrder.aspx");
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
                    SqlCommand myCommand = new SqlCommand("[VICTULING_viewBiteMenuDetail]");
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
    }
}