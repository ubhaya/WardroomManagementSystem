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
using System.Xml;
using System.Threading;
using System.IO;


namespace victuling_WordRoom
{
    public partial class FinalMonthlyRecoveryReport : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dt = new DataTable();
        public static String wardRoomName, wardRoomCode;
        Thread XMLFileThread; 

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            if (IsPostBack != true)
            {
               

            }
            wardRoomCode = Session["wardRoomCode"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            txtWardRoom.Text = wardRoomName;
        }

        public void bindRecovery()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetFinalMonthlyRecovery_DinnigAndWine]";

            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[0];

            grdReport1.DataBind();

            con.Close();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            bindRecovery();
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

        protected void btnAuthorized_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();

            dt = itemObject.GetFinalRecovery_Pay(strConnString, wardroomCode, year, month);


            for (int i = 0; i < dt.Rows.Count; i++)
            {

                string branchID = "";
                string officialNo = "";
                string rankRate = "";
                string name = "";
                string individualTotalCost = "";
                string creditDebit = "";
                string Messsub = "";
                string barBill = "";
                string TotRecovery = "";
                string priority = "";
                string noOfDays = "";

                branchID = dt.Rows[i]["branchID"].ToString();
                officialNo = dt.Rows[i]["officialNo"].ToString();
                rankRate = dt.Rows[i]["rankRate"].ToString();
                name = dt.Rows[i]["name"].ToString();
                individualTotalCost = dt.Rows[i]["individualTotalCost"].ToString();
                creditDebit = dt.Rows[i]["creditDebit"].ToString();
                Messsub = dt.Rows[i]["Messsub"].ToString();
                barBill = dt.Rows[i]["barBill"].ToString();
                TotRecovery = dt.Rows[i]["TotRecovery"].ToString();
                priority = dt.Rows[i]["priority"].ToString();
                noOfDays = dt.Rows[i]["noOfDays"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "VICTULING_insert_T_FinalRecovery_Pay";

                    sqlcmd.Parameters.AddWithValue("@branchID", branchID);
                    sqlcmd.Parameters.AddWithValue("@officialNo", officialNo);
                    sqlcmd.Parameters.AddWithValue("@rankRate", rankRate);
                    sqlcmd.Parameters.AddWithValue("@name", name);
                    sqlcmd.Parameters.AddWithValue("@individualTotalCost", individualTotalCost);
                    sqlcmd.Parameters.AddWithValue("@creditDebit", creditDebit);
                    sqlcmd.Parameters.AddWithValue("@barBill", barBill);
                    sqlcmd.Parameters.AddWithValue("@TotRecovery", TotRecovery);
                    sqlcmd.Parameters.AddWithValue("@priority", priority);
                    sqlcmd.Parameters.AddWithValue("@noOfDays", noOfDays);
                    sqlcmd.Parameters.AddWithValue("@Messsub", "0.00");


                    sqlcmd.Parameters.AddWithValue("@isAuthorized", 1);
                    sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());

                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success";

                }
                catch
                {

                }
            }
        }

        protected void btnXML_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dst = new DataSet();
            try
            {
                con.Open();
                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "VICTULING_GetFinalMonthlyRecovery_DinnigAndWine_ForXML";

                command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());

                //command.Parameters.AddWithValue("@year", Convert.ToDateTime(dtpMonthYear.SelectedDate).Year);
                //command.Parameters.AddWithValue("@month", Convert.ToDateTime(dtpMonthYear.SelectedDate).Month);

                adapter = new SqlDataAdapter(command);
                adapter.Fill(dst);
                con.Close();

                string xmlFileName = "StudentDetails.xml";
                DataSet ds = new DataSet();

                DataTable dt = dst.Tables[0];


                XmlDocument doc = new XmlDocument();
                XmlNode docNode = doc.CreateXmlDeclaration("1.0", null, null);
                doc.AppendChild(docNode);

                XmlNode mainNode = doc.CreateElement("document");
                doc.AppendChild(mainNode);


                for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
                {
                    XmlNode childNode = doc.CreateElement("row");
                    mainNode.AppendChild(childNode);

                    XmlNode osSection = doc.CreateElement("SysCode");
                    osSection.AppendChild(doc.CreateTextNode(dst.Tables[0].Rows[i]["serviceType"].ToString()));
                    childNode.AppendChild(osSection);

                    XmlNode offNoSection = doc.CreateElement("CatCode");
                    offNoSection.AppendChild(doc.CreateTextNode(dst.Tables[0].Rows[i]["officerSailor"].ToString()));
                    childNode.AppendChild(offNoSection);

                    XmlNode catogarySection = doc.CreateElement("OfficerCode");
                    catogarySection.AppendChild(doc.CreateTextNode(dst.Tables[0].Rows[i]["officialNo"].ToString()));
                    childNode.AppendChild(catogarySection);

                    XmlNode TotRecoverySection = doc.CreateElement("Amount");
                    TotRecoverySection.AppendChild(doc.CreateTextNode(dst.Tables[0].Rows[i]["TotRecovery"].ToString()));
                    childNode.AppendChild(TotRecoverySection);

                    
                }

                dst.WriteXml(Server.MapPath("~/" + doc));
                //    lblmsg.Text = "Gridview data exported successfully to StudentDetails.xml file";

                String reportName = "_" + "_" + "WRReport";

                string strFullPath = Server.MapPath("~/" + reportName + ".xml");
                doc.Save(strFullPath);
                string strContents = null;
                System.IO.StreamReader objReader = default(System.IO.StreamReader);
                objReader = new System.IO.StreamReader(strFullPath);
                strContents = objReader.ReadToEnd();
                objReader.Close();

                string attachment = "attachment; filename=" + reportName + ".xml";
                Response.ClearContent();
                Response.ContentType = "application/xml";
                Response.AddHeader("content-disposition", attachment);
                Response.Write(strContents);
                lblSaveSucess.Text = "XML file sucessfully downloaded to your computer.. Check Default Download Location";
                lblSaveSucess.Visible = true;
                //  Response.End();    

                Response.Flush();
                //    Response.End();

            }

            catch
            {

                // lblSaveSucess.Text = ex.ToString();
                con.Close();
            }

        }
    }
}