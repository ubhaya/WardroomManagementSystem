using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections.Specialized;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace VICTULING_DLL.Account
{
    public class LoginAccess
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        private static readonly byte[] initVectorBytes = Encoding.ASCII.GetBytes("tu89geji340t89u2");
        private const int keysize = 256;
        public static string msg;

        public static DataSet dt = new DataSet();

        /// <summary>
        /// Lit KRDJ Somasiri
        /// Use for Create New UserAccount
        /// </summary>
        public void userRegistration(string insertUpdate, string NIC, string initial, string surName,
            string rankCode, string branchCode, string offNo, string serviceType, string email,
                string userName, string password, string conPassword, string createUser, string roll, string wardroomCode, string wardroom)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_UserRegistration]";

                cmd.Parameters.AddWithValue("@inserUpdate", insertUpdate);

                cmd.Parameters.AddWithValue("@NicNo", NIC);
                cmd.Parameters.AddWithValue("@Initial", initial);
                cmd.Parameters.AddWithValue("@SurName", surName);
                cmd.Parameters.AddWithValue("@RankCode", rankCode);
                cmd.Parameters.AddWithValue("@BrachCode", branchCode);
                cmd.Parameters.AddWithValue("@OffNo", offNo);
                cmd.Parameters.AddWithValue("@serviceType", serviceType);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@UserName", userName);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@conPassword", conPassword);
                cmd.Parameters.AddWithValue("@createdUser", createUser);
                cmd.Parameters.AddWithValue("@roll", roll);
                cmd.Parameters.AddWithValue("@wardroomCode", wardroomCode);
                cmd.Parameters.AddWithValue("@wardroom", wardroom);

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                con.Dispose();

            }
            catch (Exception)
            {

            }
        }
        /// <summary>
        /// LIT KRDJ Somasiri
        /// use for reset Password
        /// </summary>
        public void resetPassword(string insertUpdate, string NIC,
            string password, string conPassword, string modiredUser)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_UserRegistration]";

                cmd.Parameters.AddWithValue("@inserUpdate", insertUpdate);
                cmd.Parameters.AddWithValue("@NicNo", NIC);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@conPassword", conPassword);
                cmd.Parameters.AddWithValue("@lastModifiedUser", modiredUser);

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                con.Dispose();

            }
            catch (Exception)
            {

            }
        }


        /// <summary>
        /// encrypt password
        /// </summary>
        public string Encrypt(string plainText, string passPhrase)
        {
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            using (PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null))
            {
                byte[] keyBytes = password.GetBytes(keysize / 8);
                using (RijndaelManaged symmetricKey = new RijndaelManaged())
                {
                    symmetricKey.Mode = CipherMode.CBC;
                    using (ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes))
                    {
                        using (MemoryStream memoryStream = new MemoryStream())
                        {
                            using (CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write))
                            {
                                cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
                                cryptoStream.FlushFinalBlock();
                                byte[] cipherTextBytes = memoryStream.ToArray();
                                return Convert.ToBase64String(cipherTextBytes);
                            }
                        }
                    }
                }
            }
        }
        /// <summary>
        /// decrypt password
        /// </summary>
        //private static readonly byte[] initVectorBytes = Encoding.ASCII.GetBytes("tu89geji340t89u2");
        //private const int keysize = 256;

        public string Decrypt(string passPhrase, string userName)
        {
            getUserName(userName);
            String encyptedPassword = dt.Tables[0].Rows[0][0].ToString();

            string cipherText = encyptedPassword;

            byte[] cipherTextBytes = Convert.FromBase64String(cipherText);
            using (PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null))
            {
                byte[] keyBytes = password.GetBytes(keysize / 8);
                using (RijndaelManaged symmetricKey = new RijndaelManaged())
                {
                    symmetricKey.Mode = CipherMode.CBC;
                    using (ICryptoTransform decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes))
                    {
                        using (MemoryStream memoryStream = new MemoryStream(cipherTextBytes))
                        {
                            using (CryptoStream cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read))
                            {
                                byte[] plainTextBytes = new byte[cipherTextBytes.Length];
                                int decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
                                return Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount);
                            }
                        }
                    }
                }
            }
        }
        /// <summary>
        /// get username
        /// </summary>
        public  DataSet getUserName(string userName)
        {
            SqlCommand sqlcmd = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter();
            
            try
            {
                dt.Clear();
                sqlcmd.Connection = con;
                con.Open();
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "VICTULING_GetPassword_For_Decrypt";
                sqlcmd.Parameters.AddWithValue("@userName", userName);
                sqlcmd.ExecuteNonQuery();
                sda.SelectCommand = sqlcmd;
                sda.Fill(dt);
                con.Close();

                return dt;
            }
            catch
            {
                return null;
            }

        }
        /// <summary>
        /// get parson details using NIC
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public DataSet getDetails(string NIC)
        {
            SqlCommand sqlcmd = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet dt = new DataSet();
            try
            {
                sqlcmd.Connection = con;
                con.Open();
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.CommandText = "VICTULING_GetDetails_ResetPassword";
                sqlcmd.Parameters.AddWithValue("@Nic", NIC);
                sqlcmd.ExecuteNonQuery();
                sda.SelectCommand = sqlcmd;
                sda.Fill(dt);
                con.Close();
                return dt;
            }
            catch
            {
                return null;
            }

        }
    }
}
