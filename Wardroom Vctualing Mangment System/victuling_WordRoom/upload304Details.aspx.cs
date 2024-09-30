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
    public partial class upload304Details : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string connectionString2 = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        public static DataTable dtArea = new DataTable();
        public static DataTable dtSRankRate = new DataTable();

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        LoginAccess dataAccess = new LoginAccess();
        DataSet dt = new DataSet();



        protected void Page_Load(object sender, EventArgs e)
        {
            dtArea = itemObject.GetArea(strConnString);
            ddlArea.DataSource = dtArea;

            ddlArea.DataTextField = "areaName";
            ddlArea.DataValueField = "areaName";
            ddlArea.DataBind();

            ddlArea.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            
        }

        void getData()
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter sqlAdp = new SqlDataAdapter();
            DataSet dsItem = new DataSet();
            try
            {              
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "Select_Base";
                    cmd.Connection = con;
                    con.Open();
                    sqlAdp.SelectCommand = cmd;
                    sqlAdp.Fill(dsItem);
                    if (dsItem.Tables[0].Rows.Count > 0)
                    {
                        cmbBase.DataSource = dsItem.Tables[0];
                        cmbBase.DataTextField = "baseName";
                        cmbBase.DataValueField = "baseCode";
                        cmbBase.DataBind();
                        cmbBase.Items.Insert(0, new RadComboBoxItem("--Select--", "0"));                    
                        
                    }
                
            }
            catch (Exception show_error)
            {
                throw show_error;
            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }

        }

        protected void rbtUpload_Click(object sender, EventArgs e)
        {
            //Upload and save the file
            string excelPath = Server.MapPath("~/Document/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(excelPath);

            string conString = string.Empty;
            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            switch (extension)
            {
                case ".xls": //Excel 97-03
                    conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                    break;
                case ".xlsx": //Excel 07 or higher
                    conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                    break;

            }
            conString = string.Format(conString, excelPath);
            using (OleDbConnection excel_con = new OleDbConnection(conString))
            {
                excel_con.Open();
                string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                System.Data.DataTable dtExcelData = new System.Data.DataTable();

                //[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
                dtExcelData.Columns.AddRange(new DataColumn[8] { new DataColumn("O/S", typeof(string)),
                new DataColumn("S/T", typeof(string)),
                new DataColumn("OFFNO", typeof(string)),
                new DataColumn("S/A", typeof(Int32)),
                new DataColumn("RA",typeof(Int32)) ,
                new DataColumn("T/A", typeof(Int32)),
                new DataColumn("VIC", typeof(Int32)),
                new DataColumn("P/DAY", typeof(Int32))});

                using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
                {
                    oda.Fill(dtExcelData);
                }
                excel_con.Close();

                string consString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


                using (SqlConnection con1 = new SqlConnection(consString))
                {
                    string sql = @"DELETE FROM dbo.TempMonthly304Data;";
                    SqlCommand cmd = new SqlCommand(sql, con1);
                    con1.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con1))
                    {
                        ////Set the database table name
                        sqlBulkCopy.DestinationTableName = "TempMonthly304Data";
                        ////[OPTIONAL]: Map the Excel columns with that of the database table
                        sqlBulkCopy.ColumnMappings.Add("O/S", "O/S");
                        sqlBulkCopy.ColumnMappings.Add("S/T", "S/T");
                        sqlBulkCopy.ColumnMappings.Add("OFFNO", "OFFNO");
                        sqlBulkCopy.ColumnMappings.Add("S/A", "S/A");
                        sqlBulkCopy.ColumnMappings.Add("RA", "RA");
                        sqlBulkCopy.ColumnMappings.Add("T/A", "T/A");
                        sqlBulkCopy.ColumnMappings.Add("VIC", "VIC");
                        sqlBulkCopy.ColumnMappings.Add("P/DAY", "P/DAY");
                        sqlBulkCopy.WriteToServer(dtExcelData);
                    }
                    SqlCommand command = new SqlCommand(sql, con1);
                    //con1.Open();
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "Update_Upload_Date_BaseCode";
                    command.Parameters.AddWithValue("@baseCode", cmbBase.SelectedValue);
                    command.Connection = con1;
                    command.ExecuteNonQuery();
                    con1.Close();


                    //con.Open();
                    //cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.CommandText = "[VICTULING_Save_DailyCustomizedMenuItems]";

                    //cmd.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
                    //cmd.Parameters.AddWithValue("@mealCategory", ddlMealCat.SelectedValue.ToString());
                    //cmd.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                    //if (ddlGroupMenu.SelectedItem.Text != "---Select---")
                    //{
                    //    cmd.Parameters.AddWithValue("@groupMenuCode", ddlGroupMenu.SelectedValue.ToString());
                    //}
                    //else
                    //{
                    //    cmd.Parameters.AddWithValue("@groupMenuCode", "");
                    //}
                    //cmd.Parameters.AddWithValue("@mainItemCode", ddlMeal.SelectedValue.ToString());
                    //cmd.Parameters.AddWithValue("@wardroomCode", wardRoomCode.ToString().Trim());
                    //cmd.Parameters.AddWithValue("@vegiNonVegi", ddlVeg.SelectedItem.Text);
                    //cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    //cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                    //cmd.Parameters.AddWithValue("@isAuthorized", 1);
                    //cmd.Parameters.AddWithValue("@isActive", 1);

                    //cmd.ExecuteNonQuery();
                    //cmd.Parameters.Clear();
                    //con.Close();
                }
            }
        }


        protected void cmbArea_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter sqlAdp = new SqlDataAdapter();
            DataSet dsItem = new DataSet();
            try
            {
                if (cmbArea.SelectedItem.Text != "Naval Headquarters")
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "Select_Base_In_Area";
                    cmd.Parameters.AddWithValue("@areaCode", cmbArea.SelectedValue.ToString());
                    cmd.Connection = con;
                    con.Open();
                    sqlAdp.SelectCommand = cmd;
                    sqlAdp.Fill(dsItem);
                    if (dsItem.Tables[0].Rows.Count > 0)
                    {
                        cmbBase.DataSource = dsItem.Tables[0];
                        cmbBase.DataTextField = "baseName";
                        cmbBase.DataValueField = "baseCode";
                        cmbBase.DataBind();
                    }
                }

            }
            catch (Exception show_error)
            {
                throw show_error;
            }
            finally
            {
                cmd.Dispose();
                con.Close();
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
           
    }
}