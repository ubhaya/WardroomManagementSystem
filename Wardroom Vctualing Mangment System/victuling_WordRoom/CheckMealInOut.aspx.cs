using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using VICTULING_DLL.AddNewItems;
using Telerik.Web.UI;
namespace victuling_WordRoom
{
    public partial class CheckMealInOut : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static int countval = 0;

        public static string nic = "";
        public static string OS = "";
        public static string nicNo_SSID = "";
        public static string officialNo = "";
        public static string serviceType = "";

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();

        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
        public static String wardRoomName, wardRoomCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();


            lblNic.Visible = false;

            searchPerson();
        }

        public void searchPerson()
        {
            var MyProperty = Request.QueryString["param1"];

            if (MyProperty != null)
            {
                //var decryptdata = DecryptString(key, MyProperty);
                //var decryptdata = "O RNF 3700";

                var words = MyProperty.Split(' ');
                var ServiceTypee = words[2];
                var OfficerSailor = words[1];
                var OfficialNumber = words[3];

                //string off = txtOfficialNo.Text;
                //string OSType = ddlOfficerSailor.SelectedItem.Text.ToString();
                //string ServiceType = ddlServiceType.SelectedItem.Text.ToString();

                string off = OfficialNumber;
                string OSType = OfficerSailor;
                string ServiceType = ServiceTypee;

                dtOfficerSailor.Clear();

                if (OSType == "S")
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

                else if (OSType == "O")
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
                    imgPerson.ImageUrl = personal.Tables[0].Rows[0]["image"].ToString();
                }


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

                if (0 < (personal.Tables[14].Rows.Count))
                {
                    lblBranch.Text = personal.Tables[14].Rows[0]["branchID"].ToString();
                }
                else
                {
                    lblBranch.Text = "No Data";
                }

                if (0 < (personal.Tables[13].Rows.Count))
                {
                    txtOfficialNumber.Text = personal.Tables[13].Rows[0]["officialNo"].ToString();
                }
                else
                {
                    txtOfficialNumber.Text = "No Data";
                }

                //if (0 < (personal.Tables[13].Rows.Count))
                //{
                //    lblIsActive.Text = personal.Tables[13].Rows[0]["isActive"].ToString();
                //}
                //else
                //{
                //    lblIsActive.Text = "No Data";
                //}
            }



        }

        [WebMethod]
        public static string GetNavalPerson(string contentcame)
        {
            var key = "b14ca5898a4e4133bbce2ea2315a1918";
            //Clear();

            var DecryptData = DecryptString(key, contentcame);


            return DecryptData;
        }

        public static string DecryptString(string key, string cipherText)
        {

            byte[] iv = new byte[16];
            byte[] buffer = Convert.FromBase64String(cipherText);

            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = iv;
                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

                using (MemoryStream memoryStream = new MemoryStream(buffer))
                {
                    using (CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader streamReader = new StreamReader((Stream)cryptoStream))
                        {
                            return streamReader.ReadToEnd();
                        }
                    }
                }
            }
        }
    }
}