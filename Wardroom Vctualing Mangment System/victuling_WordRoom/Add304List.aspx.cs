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
    public partial class Add304List : System.Web.UI.Page
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

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {

                try
                {


                    string filename = Path.GetFileName(FileUpload1.FileName);
                    string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    //FileUpload1.SaveAs(Server.MapPath("D:/hrms_images/") + filename + extension);
                    //ProfileImage = "D:/hrms_images/" + filename + extension;
                    FileUpload1.SaveAs(Server.MapPath("~/304List/") + filename);
                    fullpath = "~/304List/" + filename;

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

        protected void RadButton2_Click(object sender, EventArgs e)
        {
            using (OleDbConnection conn = new OleDbConnection())
            {
                string Import_FileName = Server.MapPath(fullpath);
                //Import_FileName = System.IO.Path.GetDirectoryName(file_path);
                string fileExtension = Path.GetExtension(Import_FileName);
                conn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Import_FileName + ";" + "Extended Properties='Excel 12.0 Xml;HDR=YES;'";
                dt.Clear();
               
                conn.Open();
               // if (fileExtension == ".xlsx")
                   
                using (OleDbCommand comm = new OleDbCommand())
                {
                    comm.CommandText = "Select SN,OS,ST,NAME,INITIAL,OFFNO,RANK,SM,INDATE,OUTDATE,INFORM,OUTTO,SC,SA,RA,TA,VIC,BASE,YEAR,MONTH,INSERT from [Sheet1$]";
                    comm.Connection = conn;
                  
                    using (OleDbDataAdapter da = new OleDbDataAdapter())
                    {
                        da.SelectCommand = comm;
                        da.Fill(dt);

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            dt.Rows[i]["BASE"] = cmbBase.SelectedValue.ToString();
                            dt.Rows[i]["YEAR"] = ddlYear.SelectedValue.ToString();
                            dt.Rows[i]["MONTH"] = ddlMonth.SelectedValue.ToString();
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
                conn.Close();
            }
            
        }

        protected void RadButton3_Click(object sender, EventArgs e)
        {
            SqlConnection updateSelectedPersonsCon2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            SqlCommand updateSelectedPersonsCommand2;
            updateSelectedPersonsCon2.Open();

            for (int i = 0; i < dt.Rows.Count; i++)
            {

                string SN = "";
                string OS = "";
                string ST = "";
                string NAME = "";
                string INITIAL = "";
                string OFFNO = "";
                string RANK = "";
                string SM = "";
                string INDATE = "";
                string OUTDATE = "";
                string INFORM = "";
                string OUTTO = "";
                string SC = "";
                string SA = "";
                string RA = "";
                string TA = "";
                string VIC = "";
                string BASE = "";
                string YEAR = "";
                string MONTH = "";
                
                SN = dt.Rows[i]["SN"].ToString();
                OS = dt.Rows[i]["OS"].ToString();
                ST = dt.Rows[i]["ST"].ToString();
                NAME = dt.Rows[i]["NAME"].ToString();
                INITIAL = dt.Rows[i]["INITIAL"].ToString();
                OFFNO = dt.Rows[i]["OFFNO"].ToString();
                RANK = dt.Rows[i]["RANK"].ToString();
                SM = dt.Rows[i]["SM"].ToString();
                INDATE = dt.Rows[i]["INDATE"].ToString();
                OUTDATE = dt.Rows[i]["OUTDATE"].ToString();
                INFORM = dt.Rows[i]["INFORM"].ToString();
                OUTTO = dt.Rows[i]["OUTTO"].ToString();
                SC = dt.Rows[i]["SC"].ToString();
                SA = dt.Rows[i]["SA"].ToString();
                RA = dt.Rows[i]["RA"].ToString();
                TA = dt.Rows[i]["TA"].ToString();
                VIC = dt.Rows[i]["VIC"].ToString();
                BASE = dt.Rows[i]["BASE"].ToString();
                YEAR = dt.Rows[i]["YEAR"].ToString();
                MONTH = dt.Rows[i]["MONTH"].ToString();


                try
                {

                    {
                        updateSelectedPersonsCommand2 = new SqlCommand("VICTULING_Insert304List", updateSelectedPersonsCon2);

                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@SN", SN);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@OS", OS);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@ST", ST);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@NAME", NAME);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@INITIAL", INITIAL);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@OFFNO", OFFNO);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@RANK", RANK);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@SM", SM);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@INDATE", INDATE);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@OUTDATE", OUTDATE);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@INFORM", INFORM);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@OUTTO", OUTTO);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@SC", SC);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@SA", SA);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@RA", RA);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@TA", TA);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@VIC", VIC);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@baseCode", BASE);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@year", YEAR);
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@month", MONTH);

                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        updateSelectedPersonsCommand2.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                        updateSelectedPersonsCommand2.CommandType = CommandType.StoredProcedure;
                        updateSelectedPersonsCommand2.ExecuteNonQuery();

                    }

                    lblSave.Visible = true;
                    lblSave.Text = "Uploading is successed!";
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    dt.Rows[i]["INSERT"] = "YES";
                }
                catch
                {
                    //ListBox1.Items.Add("*" + barnch + "-" + off + "-" + os);
                    //Label1.Visible = true;
                    //Label1.Text = "Uploading not is successed!";
                    //Label1.ForeColor = System.Drawing.Color.Red;
                    dt.Rows[i]["INSERT"] = "NO";
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
    }
}