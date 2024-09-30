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

namespace victuling_WordRoom
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        LoginAccess dataAccess = new LoginAccess();
        DataSet dt = new DataSet();

        protected void btnCreateAccount_Load(object sender, EventArgs e)
        {
            //lblMsg.Visible = false;
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            string NIC = txtNicNo.Text;

            dt =  dataAccess.getDetails(NIC);

            if (dt.Tables[0].Rows.Count > 0)
            {
                lblMsg.Text = "User already exists in the system";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;

            }


            if (!txtPassword.Text.Equals(txtRePassword.Text))
            {

                lblMsg.Text = "Password do not match.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Visible = true;
                return;
            }


            //string NIC = txtNicNo.Text;
            string Initial = txtInitial.Text;
            string SurName = txtSurName.Text;
            string RankCode = cmbRank.SelectedValue.ToString();
            string BrachCode = cmbBranch.SelectedValue.ToString();
            string OffNo = txtOffNo.Text;
            string ServiceType = cmbServiceType.SelectedValue.ToString();
            string Email = txtEmail.Text;
            string UserName = txtUserName.Text;

            string Password = txtPassword.Text;

            String encryptPassword = dataAccess.Encrypt("kal", Password);

            string ConPassword = txtRePassword.Text;
            string CreatedUser = "Admin";
            string roll = cmbRoll.SelectedValue.ToString();
            string insertUpdate = "insert";
            string wardroom = ddlWardroom.SelectedItem.Text;
            string wardroomCode = ddlWardroom.SelectedValue.ToString();

            dataAccess.userRegistration(insertUpdate, NIC, Initial, SurName, RankCode,
                BrachCode, OffNo, ServiceType, Email, UserName, encryptPassword, encryptPassword, CreatedUser,roll,wardroomCode,wardroom);

            lblMsg.Text = "Registration is successfull - New User hass been created";
            lblMsg.ForeColor = System.Drawing.Color.Green;

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}