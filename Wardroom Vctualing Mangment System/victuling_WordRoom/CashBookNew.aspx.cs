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
using System.Text;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;


namespace victuling_WordRoom
{
    public partial class CashBookNew : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String wardRoomName, wardRoomCode;
        public static  DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String userName = Session["LOGIN_NAME"].ToString();
                wardRoomName = Session["wardRoomName"].ToString();
                wardRoomCode = Session["wardRoomCode"].ToString();
            }
        }

        protected void btnPrepare_Click(object sender, EventArgs e)
        {
            try
            {
               // lblCashBookDate.Text = txtDate.Text.ToString();

                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_PrepareCashBook]";

                command.Parameters.AddWithValue("@dateSelected", DateTime.Parse(txtDate.SelectedDate.ToString()));

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);
                con.Close();

                decimal totPurchasing = 0;
                decimal totBankDeposit = 0;
                for (int x = 0; x < ds.Tables[2].Rows.Count; x++)
                {
                    totPurchasing += decimal.Parse(ds.Tables[2].Rows[x][1].ToString());
                }

                for (int x = 0; x < ds.Tables[1].Rows.Count; x++)
                {
                    totBankDeposit += decimal.Parse(ds.Tables[1].Rows[x][1].ToString());
                }

                lblBBF.Text = ds.Tables[0].Rows[0][1].ToString();
                lblCF.Text = ds.Tables[0].Rows[0][3].ToString(); 
                lblPurchasingTot.Text = totPurchasing.ToString();
                lblBankDeposit.Text = totBankDeposit.ToString();
               
               


            }
            catch (Exception ex) { }
        }

        //public void prepareDesign(DataSet dst)
        //{
        //        //lblBBF.Text =   dst.Tables[0].Rows[0][1].ToString();
        //        //lblCF.Text = dst.Tables[0].Rows[0][3].ToString(); 
        //    //================================================================================
        //        //Building an HTML string.
        //        StringBuilder html = new StringBuilder();

        //        //Table start.
        //        html.Append("<table border = '1'>");

        //        //Building the Header row.
        //        //html.Append("<tr>");
        //        //foreach (DataColumn column in dst.Tables[2].Columns)
        //        //{
        //        //    html.Append("<th>");
        //        //    html.Append(column.ColumnName);
        //        //    html.Append("</th>");
        //        //}
        //        //html.Append("</tr>");

        //        //Building the Data rows.
        //        foreach (DataRow row in dst.Tables[2].Rows)
        //        {
        //            html.Append("<tr>");
        //            foreach (DataColumn column in dst.Tables[2].Columns)
        //            {
        //                html.Append("<td>");
        //                html.Append(row[column.ColumnName]);
        //                html.Append("</td>");
        //            }
        //            html.Append("</tr>");
        //        }

        //        //Table end.
        //        html.Append("</table>");

        //        //Append the HTML string to Placeholder.
        //        PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        //    //================================================================================    
        //        //Building an HTML string.
        //        StringBuilder html1 = new StringBuilder();

        //        //Table start.
        //        html1.Append("<table border = '1'>");

        //        //Building the Header row.
        //        //html1.Append("<tr>");
        //        //foreach (DataColumn column in dst.Tables[1].Columns)
        //        //{
        //        //    html1.Append("<th>");
        //        //    html1.Append(column.ColumnName);
        //        //    html1.Append("</th>");
        //        //}
        //        //html1.Append("</tr>");

        //        //Building the Data rows.
        //        foreach (DataRow row in dst.Tables[1].Rows)
        //        {
        //            html1.Append("<tr>");
        //            foreach (DataColumn column in dst.Tables[1].Columns)
        //            {
        //                html1.Append("<td>");
        //                html1.Append(row[column.ColumnName]);
        //                html1.Append("</td>");
        //            }
        //            html1.Append("</tr>");
        //        }

        //        //Table end.
        //        html1.Append("</table>");

        //        //Append the HTML string to Placeholder.
        //        PlaceHolder1.Controls.Add(new Literal { Text = html1.ToString() });

        //}

        protected void btnViewPurchasing_Click(object sender, EventArgs e)
        {
            viewPurchasing(ds);
            PlaceHolder2.Visible = false;
            PlaceHolder1.Visible = true;
        }

        public void viewPurchasing(DataSet dst)
        {
            //lblBBF.Text =   dst.Tables[0].Rows[0][1].ToString();
            //lblCF.Text = dst.Tables[0].Rows[0][3].ToString(); 
            //================================================================================
            //Building an HTML string.
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table border = '1'>");

            //Building the Header row.
            //html.Append("<tr>");
            //foreach (DataColumn column in dst.Tables[2].Columns)
            //{
            //    html.Append("<th>");
            //    html.Append(column.ColumnName);
            //    html.Append("</th>");
            //}
            //html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dst.Tables[2].Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dst.Tables[2].Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }

            //Table end.
            html.Append("</table>");
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }

        public void viewBankDeposit(DataSet dst)
        {
            //Building an HTML string.
            StringBuilder html1 = new StringBuilder();

            //Table start.
            html1.Append("<table border = '1'>");

            //Building the Header row.
            //html1.Append("<tr>");
            //foreach (DataColumn column in dst.Tables[1].Columns)
            //{
            //    html1.Append("<th>");
            //    html1.Append(column.ColumnName);
            //    html1.Append("</th>");
            //}
            //html1.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dst.Tables[1].Rows)
            {
                html1.Append("<tr>");
                foreach (DataColumn column in dst.Tables[1].Columns)
                {
                    html1.Append("<td>");
                    html1.Append(row[column.ColumnName]);
                    html1.Append("</td>");
                }
                html1.Append("</tr>");
            }

            //Table end.
            html1.Append("</table>");

            //Append the HTML string to Placeholder.
            PlaceHolder2.Controls.Add(new Literal { Text = html1.ToString() });

        }

        protected void btnViewDeposit_Click(object sender, EventArgs e)
        {
            viewBankDeposit(ds);
            PlaceHolder1.Visible = false;
            PlaceHolder2.Visible = true;
        }

       
       
    }
}