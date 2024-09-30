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
    public partial class AddCashBookDetails : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static String wardRoomName, wardRoomCode;

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();
            }
        }

        public void LoadBasic()
        {
            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = Session["wardRoomName"].ToString();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ddlDescription.SelectedValue.ToString() == "1102")
            {
                if ((ddlDescription.SelectedItem.Text != "- - Select - -") && (ddlBillNo.SelectedItem.Text != "") && (ddlBillCost.SelectedItem.Text != "") && (txtBillDiscount.Text != "") && (lblBillCost.Text != "") && (ddlCreditDebit.SelectedItem.Text != "- - Select - -"))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    try
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_Save_T_CashBookDetails]";

                        cmd.Parameters.AddWithValue("@date", dateTo.SelectedDate.ToString());
                        cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                        cmd.Parameters.AddWithValue("@description", ddlDescription.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@remarks", ddlBillNo.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@creditDebit", ddlCreditDebit.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@cost", lblBillCost.Text);

                        cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                        cmd.Parameters.AddWithValue("@specialRemark", RadTextBox1.Text);

                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        con.Close();
                        lblError.Visible = true;

                        lblError.Text = "Save Success!";
                        lblError.ForeColor = System.Drawing.Color.Green;


                    }

                    catch (Exception ex)
                    {
                        //lbl_Errormsg.Visible = true;
                        //lbl_Errormsg.Text = ex.Message;
                    }
                }

                else
                {
                    lblError.Text = "Fill all the details!";
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
            }

            else
            {
                if ((ddlDescription.SelectedItem.Text != "- - Select - -") && (txtRemarks.Text != "") && (lblBillCost.Text == "") && (ddlCreditDebit.SelectedItem.Text != "- - Select - -"))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    try
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_Save_T_CashBookDetails]";

                        cmd.Parameters.AddWithValue("@date", dateTo.SelectedDate.ToString());
                        cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                        cmd.Parameters.AddWithValue("@description", ddlDescription.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@remarks", txtRemarks.Text);
                        cmd.Parameters.AddWithValue("@creditDebit", ddlCreditDebit.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@cost", txtCost.Text);

                        cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                        cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                        cmd.Parameters.AddWithValue("@specialRemark", "");

                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        con.Close();
                        lblError.Visible = true;

                        lblError.Text = "Save Success!";
                        lblError.ForeColor = System.Drawing.Color.Green;


                    }

                    catch (Exception ex)
                    {
                        //lbl_Errormsg.Visible = true;
                        //lbl_Errormsg.Text = ex.Message;
                    }
                }
            

              else
                {
                    lblError.Text = "Fill all the details!";
                    lblError.ForeColor = System.Drawing.Color.Red;
                }

        }
        }

        protected void ddlDescription_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (ddlDescription.SelectedValue.ToString() == "1102")
            {
                Panel2.Visible = false;
                Panel1.Visible = true;
            }

            else
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
            }
        

            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string date = dateTo.SelectedDate.ToString();
            string wardroom = Session["wardRoomCode"].ToString();
            string description = ddlDescription.SelectedValue.ToString();

            DataTable Entrydt1 = tt.GetBillList(strConnString,date, wardroom,description );
            ddlBillNo.DataSource = Entrydt1;
            ddlBillNo.DataTextField = "billNo";
            ddlBillNo.DataValueField = "billNo";
            ddlBillNo.DataBind();
            ddlBillNo.Items.Insert(0, new RadComboBoxItem("--Select--", "0"));
        }

        protected void ddlBillNo_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string date = dateTo.SelectedDate.ToString();
            string wardroom = Session["wardRoomCode"].ToString();
            string billNo = ddlBillNo.SelectedValue.ToString();

            DataTable Entrydt1 = tt.GetBillCost(strConnString, date, wardroom, billNo);
            ddlBillCost.DataSource = Entrydt1;
            ddlBillCost.DataTextField = "unitPrice";
            ddlBillCost.DataValueField = "unitPrice";
            ddlBillCost.DataBind();
            //ddlBillCost.Items.Insert(0, new RadComboBoxItem("0.00", "0"));
        }

        protected void linkGetBillCost_Click(object sender, EventArgs e)
        {
            if (txtBillDiscount.Text != "")
            {
                double Cost = 0.00;
                double discount = 0.00;
                double billCost = 0.00;

                Cost = System.Double.Parse(ddlBillCost.SelectedValue.ToString());
                discount = System.Double.Parse(txtBillDiscount.Text);
                //billCost = System.Double.Parse(lblBillCost.Text);

                billCost = (Cost - discount);
                lblBillCost.Text = billCost.ToString();

            }

            else 
            {
                double Cost = 0.00;
                double billCost = 0.00;

                Cost = System.Double.Parse(ddlBillCost.SelectedValue.ToString());
               
                billCost = Cost;
                lblBillCost.Text = billCost.ToString();

            }
        }

        protected void lnlRoundOff_Click(object sender, EventArgs e)
        {
            if (txtBillDiscount.Text != "")
            {
                double Cost = 0.00;
                double discount = 0.00;
                double billCost = 0.00;

                Cost = System.Double.Parse(ddlBillCost.SelectedValue.ToString());
                discount = System.Double.Parse(txtBillDiscount.Text);
                //billCost = System.Double.Parse(lblBillCost.Text);

                billCost = (Cost + discount);
                lblBillCost.Text = billCost.ToString();

            }

            else
            {
                double Cost = 0.00;
                double billCost = 0.00;

                Cost = System.Double.Parse(ddlBillCost.SelectedValue.ToString());

                billCost = Cost;
                lblBillCost.Text = billCost.ToString();

            }
        }

        protected void ddlCreditDebit_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

      
    }
}