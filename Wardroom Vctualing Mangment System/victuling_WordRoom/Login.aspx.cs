using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using VICTULING_DLL.Account;
using System.Data;


namespace victuling_WordRoom
{
    public partial class Login : System.Web.UI.Page
    {
        public static DataSet dst = new DataSet();

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        LoginAccess dataAccess = new LoginAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            //txtUserName.Text = "kal";
            //txtPassword.Text = "123";

            //String userName = Session["LOGIN_NAME"].ToString();

            //LabelErrorMsg.Visible = false;
            //LabelInfoMsg.Visible = false;
        }
        protected void btnLogin1_Click(object sender, EventArgs e)
        {
            try
            {

                if (txtUserName.Text == string.Empty)
                {
                    LabelErrorMsg.Text = "Please fill the UserName field, Details cannot be empty.";
                    LabelErrorMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                if (txtUserName.Text == string.Empty)
                {
                    LabelErrorMsg.Text = "Please fill the Password field, Details cannot be empty.";
                    LabelErrorMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
               
                string userName = txtUserName.Text;
                string password = txtPassword.Text;
                string chekText = dataAccess.Decrypt(password, userName);
                
               

                if (chekText == "kal")
                {
                    Session["LOGIN_NAME"] = userName;

                    dst = dataAccess.getUserName(userName);
                    Session["wardRoomName"] = dst.Tables[0].Rows[0][1].ToString();
                    Session["wardRoomCode"] = dst.Tables[0].Rows[0][2].ToString();
                    Response.Redirect("About.aspx");
                    //return;
                }
                else
                {

                    txtUserName.Text = "";
                    txtPassword.Text = "";

                }
            }
            catch (Exception)
            {
                txtUserName.Text = "";
                txtPassword.Text = "";
            }
        }
    }
}