using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using VICTULING_DLL.Account;
using System.Data.OleDb;
using System.IO;

using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

namespace victuling_WordRoom
{
    public partial class AddBarRecovery : System.Web.UI.Page
    {
        public static string fullpath = "";
        public static DataTable dt = new DataTable();

        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string connectionString2 = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        public static DataTable dtArea = new DataTable();
        public static DataTable dtSRankRate = new DataTable();
        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();

            }
        }
            
        public void LoadBasic()
        {
            dtArea = itemObject.GetArea(strConnString);
            ddlArea.DataSource = dtArea;

            ddlArea.DataTextField = "areaName";
            ddlArea.DataValueField = "areaCode";
            ddlArea.DataBind();

            ddlArea.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

            
        

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            //ListBox1.Items.Clear();
            if (FileUpload1.HasFile)
            {

                try
                {


                    string filename = Path.GetFileName(FileUpload1.FileName);
                    string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    //FileUpload1.SaveAs(Server.MapPath("D:/hrms_images/") + filename + extension);
                    //ProfileImage = "D:/hrms_images/" + filename + extension;
                    FileUpload1.SaveAs(Server.MapPath("~/BarRecovery/") + filename);
                    fullpath = "~/BarRecovery/" + filename;

                    StatusLabel.Text = "Upload status:  Successfully Uploaded!";
                    StatusLabel.ForeColor = System.Drawing.Color.Green;

                    {

                        GridView1.DataSource = new string[] { };
                        GridView1.Rebind();
                    }


                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    StatusLabel.ForeColor = System.Drawing.Color.Red;
                    //StatusLabel2.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }

        protected void ddlArea_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

            string baseValue = ddlArea.Text;
            DataTable Entrydt1 = itemObject.GetBase(baseValue, strConnString);
            cmbBase.DataSource = Entrydt1;
            cmbBase.DataTextField = "baseName";
            cmbBase.DataValueField = "baseCode";
            cmbBase.DataBind();
            cmbBase.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void RadButton2_Click(object sender, EventArgs e)
        {
            //ListBox1.Items.Clear();
            using (OleDbConnection conn = new OleDbConnection())
            {
                dt.Clear();
                string Import_FileName = Server.MapPath(fullpath);
                //Import_FileName = System.IO.Path.GetDirectoryName(file_path);
                string fileExtension = Path.GetExtension(Import_FileName);
               //if (fileExtension == ".xlsx")
                    conn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Import_FileName + ";" + "Extended Properties='Excel 12.0 Xml;HDR=YES;'";
                using (OleDbCommand comm = new OleDbCommand())
                {
                    comm.CommandText = "Select OfficialNumber,Rank,Initials,Name,ThisMonthBarBill,Base,Year,Month,Insert from [MonthlyReturns$]";
                    comm.Connection = conn;
                    using (OleDbDataAdapter da = new OleDbDataAdapter())
                    {
                        da.SelectCommand = comm;
                        da.Fill(dt);

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            dt.Rows[i]["Base"] = cmbBase.SelectedValue.ToString();
                            dt.Rows[i]["Year"] = ddlYear.SelectedValue.ToString();
                            dt.Rows[i]["Month"] = ddlMonth.SelectedValue.ToString();
                        }




                        GridView1.Columns.Clear();
                        if (dt.Rows.Count > 0)
                        {
                            GridView1.DataSource = dt;
                            GridView1.Rebind();
                        }
                        else
                        {

                            GridView1.DataSource = new string[] { };
                            GridView1.Rebind();
                        }
                        if (dt.Rows.Count > 0)
                        {
                            GridView1.DataSource = dt;
                            GridView1.Rebind();
                        }
                        else
                        {

                            GridView1.DataSource = new string[] { };
                            GridView1.Rebind();
                        }
                    }
                }
            }
        }

        protected void RadButton3_Click(object sender, EventArgs e)
        {
        

            SqlConnection updateSelectedPersonsCon2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            SqlCommand updateSelectedPersonsCommand2;
            updateSelectedPersonsCon2.Open();
           
            for (int i = 0; i < dt.Rows.Count; i++)
            {
               
                string officialNO = "";
                string rank = "";
                string initial = "";
                string name = "";
                string barBill = "";
                string Bbase = "";
                string year = "";
                string month = "";
                string insert = "";


                officialNO = dt.Rows[i]["OfficialNumber"].ToString();
                rank = dt.Rows[i]["Rank"].ToString();
                initial = dt.Rows[i]["Initials"].ToString();
                name = dt.Rows[i]["Name"].ToString();
                barBill = dt.Rows[i]["ThisMonthBarBill"].ToString();
                Bbase = dt.Rows[i]["Base"].ToString();
                year = dt.Rows[i]["Year"].ToString();
                month = dt.Rows[i]["Month"].ToString();
                insert = dt.Rows[i]["Insert"].ToString();


                try
                {

                    {
                        updateSelectedPersonsCommand2 = new SqlCommand("VICTULING_InsertMonthlyBarBill", updateSelectedPersonsCon2);

                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@offno", officialNO);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@rank", rank);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@initial", initial);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@name", name);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@barBill", barBill);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@baseCode", Bbase);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@year", year);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@month", month);
                        //updateSelectedPersonsCommand2.Parameters.AddWithValue("@insert", 1);

                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                        updateSelectedPersonsCommand2.CommandType = CommandType.StoredProcedure;
                        updateSelectedPersonsCommand2.ExecuteNonQuery();

                    }

                    lblSave.Visible = true;
                    lblSave.Text = "Uploading is successed!";
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    dt.Rows[i]["Insert"] = "YES";
                }
                catch
                {
                    //ListBox1.Items.Add("*" + barnch + "-" + off + "-" + os);
                    //Label1.Visible = true;
                    //Label1.Text = "Uploading not is successed!";
                    //Label1.ForeColor = System.Drawing.Color.Red;
                    dt.Rows[i]["Insert"] = "NO";
                    continue;
                }

                GridView1.Columns.Clear();
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.Rebind();
                }
                else
                {

                    GridView1.DataSource = new string[] { };
                    GridView1.Rebind();
                }
            }

            updateSelectedPersonsCon2.Close();

         
        }

       

        protected void GridView1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            //if (e.Item is GridDataItem)
            //{
            //    int strIndex = GridView1.MasterTableView.CurrentPageIndex;

            //    Label lbl = e.Item.FindControl("lblSn") as Label;
            //    lbl.Text = Convert.ToString((strIndex * GridView1.PageCount) + e.Item.ItemIndex + 1);
            //}
        }
    }
}