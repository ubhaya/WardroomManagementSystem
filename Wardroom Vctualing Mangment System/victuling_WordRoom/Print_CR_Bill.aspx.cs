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
using CrystalDecisions.CrystalReports.Engine;

namespace victuling_WordRoom
{
    public partial class Print_CR_Bill : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        public static String wardRoomName, wardRoomCode;
        public static DataTable dtselect = new DataTable();

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
        }

        protected void btnPrintBill_Click(object sender, EventArgs e)
        {

            crystalData();


        }
        protected void crystalData()
        {
            try
            {
                ReportDocument rptDoc2 = new ReportDocument();

                rptDoc2.Load(Server.MapPath("printBill.rpt"));
                rptDoc2.SetDatabaseLogon("sa", "SDUAdmin@2019", "10.10.1.237", "VICTULING");
                // rptDoc2.DataSourceConnections[0].SetConnection("10.10.1.237", "VICTULING", "sa", "SDUAdmin@2019");

                DataSet dataset = new DataSet();
                SqlCommand myCommand = new SqlCommand("[VICTULING_PrintIndividualSaleItem]");
                myCommand.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
                myCommand.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate.ToString());
                myCommand.Parameters.AddWithValue("@offNo", txtOfficialNo.Text);
                myCommand.Parameters.AddWithValue("@serviceType", ddlServiceType.Text);
                myCommand.Parameters.AddWithValue("@NewBillID", ddlBill.SelectedItem.Text);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter(myCommand);
                da.Fill(dataset);

                rptDoc2.SetDataSource(dataset.Tables[0]);
                Session["Report"] = rptDoc2;



                CrystalReportViewer1.ReportSource = rptDoc2;
                // CrystalReportViewer1.RefreshReport();
                //rptDoc2.SetParameterValue("@wardroomName", wardRoomName);
                //rptDoc2.SetParameterValue("@onChargeDate", dateSaleDate.SelectedDate.ToString());
                //rptDoc2.SetParameterValue("@offNo", txtOfficialNo.Text);
                //rptDoc2.SetParameterValue("@serviceType", ddlServiceType.Text);

                //// rptDoc2.SetDatabaseLogon("sa","SDUAdmin@2019", "10.10.1.237","VICTULING");
                //rptDoc2.SetDatabaseLogon("sa", "SDUAdmin@2019", "10.10.1.237", "VICTULING");
                CrystalReportViewer1.DataBind();
            }

            catch (Exception x)
            {
            
            }
           
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("IndividualSaleNew.aspx");
        }

        protected void dateSaleDate_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        {
           
        }

        protected void ddlServiceType_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string wardroom = Session["wardRoomCode"].ToString();
            string saleDate = dateSaleDate.SelectedDate.ToString();
            string offNo = txtOfficialNo.Text;
            string serviceType = ddlServiceType.Text;

            DataTable Entrydt1 = tt.GetBillNoByDate(saleDate,wardroom,  offNo, serviceType, strConnString);
            ddlBill.DataSource = Entrydt1;
            ddlBill.DataTextField = "NewBillID";
            ddlBill.DataValueField = "NewBillID";
            ddlBill.DataBind();
            ddlBill.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }
    }
}