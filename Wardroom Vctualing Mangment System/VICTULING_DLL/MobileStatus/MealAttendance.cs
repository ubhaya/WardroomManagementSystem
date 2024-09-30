using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using Newtonsoft.Json;

namespace VICTULING_DLL.MobileStatus
{
    public class MealAttendanceClass
    {
        private static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        public static DataTable GetUnConfirmedAttendance(DateTime date,string wardroomCode, string reasonCode)
        {
            var command = new SqlCommand("VICTULING_Get_T_Mobile_MealAttendance_Status",con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@mealDate", date);
            command.Parameters.AddWithValue("@reason", reasonCode);
            command.Parameters.AddWithValue("@wardroom", wardroomCode);

            var sqlda = new SqlDataAdapter(command);

            var dt = new DataTable();
            sqlda.Fill(dt);

            return dt;
        }

        public static void ConfirmedAttendance(DataTable dt,string userName,Wardroom wardroom,string reasonCode)
        {
            var reasons = GetReason();
            var groupMenus = GetGroupMenu();
            var officersToConfirm = new OfficerstoSend();
            con.Open();
            foreach (DataRow row in dt.Rows)
            {
                var sqlCmd = new SqlCommand("VICTULING_Update_T_Mobile_MealAttendance_Status",con);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                sqlCmd.Parameters.AddWithValue("@mealId", int.Parse(row["mealId"].ToString()));
                sqlCmd.Parameters.AddWithValue("@lastmodifiedUser", userName);
                sqlCmd.Parameters.AddWithValue("@lastmodifiedDate", DateTime.Now);

                sqlCmd.ExecuteNonQuery();

                var officer = new Officer()
                {
                    GroupMenu = groupMenus.First(x => x.GroupMenu == row["GroupMenu"].ToString()),
                    OfficerSailor = "O",
                    OfficialNumber = int.Parse(row["officialNo"].ToString()),
                    Reason = reasons.First(x => x.reasonCode == reasonCode),
                    Wardroom = wardroom
                };

                officersToConfirm.Officers.Add(officer);
            }

            con.Close();

            SendNotification(officersToConfirm);
        }

        public static void SendNotification(OfficerstoSend officers)
        {
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("https://itsolution.navy.lk/api/Notification/SendNotificationFromWardroom");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                var json = JsonConvert.SerializeObject(officers);
                streamWriter.WriteLine(json);
            }

            try
            {
                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    var result = streamReader.ReadToEnd();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            
        }

        public static List<ReasonType> GetReason()
        {
            con.Open();
            //[VICTULING_getItemReason]
            var sqlCmd = new SqlCommand("VICTULING_getItemReason",con);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            var sqlDa = new SqlDataAdapter(sqlCmd);
            var dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();

            var reasons = dt.ToClassObject<ReasonType>();

            return reasons;
        }

        public static List<GroupMenuType> GetGroupMenu()
        {
            con.Open();
            //[VICTULING_GetGroupMenu]
            var sqlCmd = new SqlCommand("VICTULING_GetGroupMenu",con);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            var sqlDa = new SqlDataAdapter(sqlCmd);
            var dt = new DataTable();
            sqlDa.Fill(dt);
            con.Close();

            var groupmenu = dt.ToClassObject<GroupMenuType>();

            return groupmenu;
        }


    }

    public class OfficerstoSend
    {
        public OfficerstoSend()
        {
            Officers = new List<Officer>();
        }
        public List<Officer> Officers { get; set; }
    }

    public class Officer
    {
        public int OfficialNumber { get; set; }
        public string OfficerSailor { get; set; }
        public ReasonType Reason { get; set; }
        public GroupMenuType GroupMenu { get; set; }
        public Wardroom Wardroom { get; set; }
    }

    public class ReasonType
    {
        public string reasonCode { get; set; }
        public string reason { get; set; }
    }

    public class GroupMenuType
    {
        public string GroupMenuCode { get; set; }
        public string GroupMenu { get; set; }
    }

    public class Wardroom
    {
        public string WardroomCode { get; set; }
        public string WardroomName { get; set; }
    }

    public static class DataTableExtension
    {
        public static List<T> ToClassObject<T>(this DataTable dataTable)
        {
            var returnResult = new List<T>();

            foreach (DataRow dataRow in dataTable.Rows)
            {
                var item = Activator.CreateInstance(typeof(T));
                var type = item.GetType();
                var properties = type.GetProperties();
                foreach (var property in properties)
                {
                    try
                    {
                        var dataCell = dataRow[property.Name];

                        if (property != null && dataCell != DBNull.Value)
                        {
                            property.SetValue(item, Convert.ChangeType(dataCell, Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType), null);
                        }
                    }
                    catch (Exception ex)
                    {

                    }
                }
                returnResult.Add((T)item);
            }

            return returnResult;
        }
    }
}
