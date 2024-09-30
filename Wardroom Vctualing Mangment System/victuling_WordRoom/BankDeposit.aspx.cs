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
    public partial class Bank_Deposit : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String wardRoomName, wardRoomCode;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String userName = Session["LOGIN_NAME"].ToString();
                wardRoomName = Session["wardRoomName"].ToString();
                wardRoomCode = Session["wardRoomCode"].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtDate.SelectedDate != null && txtAmount.Text != "" && txtSlipNumber.Text != "" && cmbDepositType.SelectedValue != "---Please Select---")
            {
                try
                {
                    con.Open();
                    SqlCommand command = new SqlCommand();

                    command.Connection = con;
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "[VICTULING_Save_BankDeposit]";

                    command.Parameters.AddWithValue("@depositType", cmbDepositType.SelectedValue.ToString());
                    command.Parameters.AddWithValue("@slipNumber", txtSlipNumber.Text.ToString());
                    command.Parameters.AddWithValue("@depositValue", float.Parse(txtAmount.Text.ToString()));
                    command.Parameters.AddWithValue("@depositDate", txtDate.SelectedDate);
                    command.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    command.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                    command.ExecuteNonQuery();
                    command.Parameters.Clear();
                    con.Close();

                    lblMsg.Text = "Successfull";
                    lblMsg.Visible = true;
                    lblMsg.ForeColor = System.Drawing.Color.Green;


                }
                catch (Exception ex) { }
            }
            else
            {
                lblMsg.Text = "Please Enter All Values";
                lblMsg.Visible = true;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }

        }

        public void clear()
        {
            txtAmount.Text = "";
            txtDate.SelectedDate = null;
            txtSlipNumber.Text = "";
            cmbDepositType.SelectedValue = "---Please Select---";
            lblMsg.Text = "";

        }
    }
}