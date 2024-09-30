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
    public partial class printpage : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            {

                CrystalReportViewer1.ReportSource = (ReportDocument)Session["Report"];
                CrystalReportViewer1.RefreshReport();
                CrystalReportViewer1.DataBind();

            }


            DataSet dataset = new DataSet();
            test1 rptDoc = new test1();
            CrystalReportViewer1.ReportSource = rptDoc;
            SqlCommand myCommand = new SqlCommand("[VICTULING_PrintIndividualSaleItem]");
            myCommand.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            myCommand.Parameters.AddWithValue("@onChargeDate",System.DateTime.Now.ToString());
            myCommand.Parameters.AddWithValue("@offNo", "3144");
            myCommand.Parameters.AddWithValue("@serviceType", "RNF");

            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(myCommand);
            da.Fill(dataset);
            ReportDocument rptDoc2 = new ReportDocument();
            rptDoc2.Load(Server.MapPath("printBill.rpt"));
            rptDoc2.SetDataSource(dataset.Tables[0]);
            Session["Report"] = rptDoc2;
            CrystalReportViewer1.ReportSource = rptDoc2;
            CrystalReportViewer1.RefreshReport();
            CrystalReportViewer1.DataBind();
        }
    }
}