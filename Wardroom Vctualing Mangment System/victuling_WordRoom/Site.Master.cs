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


namespace victuling_WordRoom
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    { 
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            DataSet dst = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand command = new SqlCommand();
            con.Open();
            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "Get_User_Role";
            command.Parameters.AddWithValue("@userName", userName);
            adapter = new SqlDataAdapter(command);
            adapter.Fill(dst);
            con.Close();

            if (dst.Tables[0].Rows.Count > 0)
            {
                string userRole = dst.Tables[0].Rows[0]["roll"].ToString();
                if (userRole == "2")
                {
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Stock"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Menu"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Meal Attendance"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Menu Sales"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Individual Sale"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Calculations"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("About"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Civil"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cash Book"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cabin Allocation"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("PartyTea"));

                }
                if (userRole == "3")
                {
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Menu"));
                    //NavigationMenu.Items.Remove(NavigationMenu.FindItem("CA"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Meal Attendance"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("About"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Civil"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cash Book"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cabin Allocation"));
                }
                else if (userRole == "4")
                {
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Stock"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Menu Sales"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Individual Sale"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Calculations"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Meal Attendance"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("About"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Civil"));
                    //NavigationMenu.Items.Remove(NavigationMenu.FindItem("CA"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cash Book"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cabin Allocation"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("PartyTea"));
                }
                else if (userRole == "5")
                {
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Stock"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Menu Sales"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Individual Sale"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Calculations"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Menu"));
                    //NavigationMenu.Items.Remove(NavigationMenu.FindItem("CA"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("About"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Civil"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cash Book"));
                    //NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cabin Allocation"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("PartyTea"));
                }
                else if (userRole == "6")
                {
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Stock"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Menu Sales"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Individual Sale"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Calculations"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Menu"));
                    //NavigationMenu.Items.Remove(NavigationMenu.FindItem("CA"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("About"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Meal Attendance"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cash Book"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cabin Allocation"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("PartyTea"));

                }

                else if (userRole == "7")
                {
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Stock"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Menu Sales"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Individual Sale"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Calculations"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Menu"));
                    //NavigationMenu.Items.Remove(NavigationMenu.FindItem("CA"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("About"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Meal Attendance"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Civil"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("Cabin Allocation"));
                    NavigationMenu.Items.Remove(NavigationMenu.FindItem("PartyTea"));

                }


            }
        }
    }
}
