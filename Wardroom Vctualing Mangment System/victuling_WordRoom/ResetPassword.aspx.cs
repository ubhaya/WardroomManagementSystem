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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        LoginAccess dataAccess = new LoginAccess();
        DataSet dt = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            if (!txtPassword.Text.Equals(txtRePassword.Text))
            {

                lblMsg.Text = "Password do not match.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Visible = true;
                return;
            }
            string NIC = cmbNIC.SelectedValue.ToString();
            string UserName = txtUserName.Text;
            string Password = txtPassword.Text;

            String encryptPassword = dataAccess.Encrypt("kal", Password);

            string ConPassword = txtRePassword.Text;
            string modifiedUser = "Admin";;
            string insertUpdate = "update";

            dataAccess.resetPassword(insertUpdate, NIC, encryptPassword, encryptPassword, modifiedUser);

            lblMsg.Text = "Password is reseted successfully";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }

        protected void cmbNIC_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string NIC = cmbNIC.SelectedValue.ToString();

            dt = dataAccess.getDetails(NIC);
            
            txtInitial.Text = dt.Tables[0].Rows[0][1].ToString();
            txtSurName.Text = dt.Tables[0].Rows[0][2].ToString();
            txtRank.Text = dt.Tables[0].Rows[0][3].ToString();
            txtBranch.Text = dt.Tables[0].Rows[0][4].ToString();
            txtOffNo.Text = dt.Tables[0].Rows[0][5].ToString();
            txtServiceType.Text = dt.Tables[0].Rows[0][6].ToString();
            txtEmail.Text = dt.Tables[0].Rows[0][7].ToString();
            txtUserName.Text = dt.Tables[0].Rows[0][8].ToString();

            string roll = dt.Tables[0].Rows[0][9].ToString();

            if (roll == "1")
            {
                TxtRoll.Text = "Administrator";
            }
            else
            {
                TxtRoll.Text = "User";
            }
        }

    }
}