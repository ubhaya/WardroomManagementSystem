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
    public partial class AddPendingRecovery : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItems = new DataTable();
        public static DataTable dtGetSaleItemsQty = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtGetExItemsIndividual = new DataTable();
        public static DataTable dtGetSaleItemsQty_Indi = new DataTable();

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
             
                
            }

           
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string off = txtOfficialNo.Text;
            string OSType = ddlOfficerSailor.SelectedItem.Text.ToString();
            string ServiceType = ddlServiceType.SelectedItem.Text.ToString();

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

                if (0 < (personal.Tables[13].Rows.Count))
                {
                    lblIsActive.Text = personal.Tables[13].Rows[0]["isActive"].ToString();
                }
                else
                {
                    lblIsActive.Text = "No Data";
                }
            }



        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            InsertPendingRecovery();
        }

        public void InsertPendingRecovery()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            try
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_insert_T_PendingRecovery]";

                cmd.Parameters.AddWithValue("@offno", Convert.ToInt32(txtOfficialNo.Text));
                cmd.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@prndingDinning", txtPendingDining.Text);
                cmd.Parameters.AddWithValue("@pendingWine", txtPendingWine.Text);
                cmd.Parameters.AddWithValue("@pendingYear", Convert.ToInt32(ddlYear.SelectedItem.Text));
                cmd.Parameters.AddWithValue("@pendingMonth", ddlMonth.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@recoverDiningAmmount", txtRecDining.Text);
                cmd.Parameters.AddWithValue("@recoverWineAmmount", txtRecWine.Text);
                cmd.Parameters.AddWithValue("@recoverYear", Convert.ToInt32(ddlYear0.SelectedItem.Text));
                cmd.Parameters.AddWithValue("@recoverMonth", ddlMonth0.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                
			
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                lblSaveTotalCost.Visible = true;

                lblSaveTotalCost.Text = "Insert Success!";
                lblSaveTotalCost.ForeColor = System.Drawing.Color.Green;

            }

            catch (Exception ex)
            {
                //lbl_Errormsg.Visible = true;
                //lbl_Errormsg.Text = ex.Message;
            }
        }
    }
}