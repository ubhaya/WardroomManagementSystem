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
    public partial class AddCivilDoctorNameList : System.Web.UI.Page
    {

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtFindMaxOffNo = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack != true)
            {
                LoadBasic();
            }

        }

        public void LoadBasic()
        {

            dtBaseAll = itemObject.GetAllBase(strConnString2);
            ddlBaseAll.DataSource = dtBaseAll;

            ddlBaseAll.DataTextField = "baseDescription";
            ddlBaseAll.DataValueField = "baseCode";
            ddlBaseAll.DataBind();

            ddlBaseAll.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtBaseAll = itemObject.GetAllBase(strConnString2);
            ddlTBase.DataSource = dtBaseAll;

            ddlTBase.DataTextField = "baseDescription";
            ddlTBase.DataValueField = "baseCode";
            ddlTBase.DataBind();

            ddlTBase.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            GetMaxOffNo();
        }

        public void GetMaxOffNo()
        {
            DataSet getvalues = new DataSet();
            getvalues.Clear();

            getvalues = itemObject.FindMaxIOffNo(strConnString);

            int val = int.Parse(getvalues.Tables[0].Rows[0][0].ToString());
            txtOffNo.Text = (val + 1).ToString();
            txtOffNo.ReadOnly = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if ((txtInitial.Text == "") || (txtSurname.Text == "") || (ddlBaseAll.SelectedItem.Text == "---Select---") || (ddlTBase.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Save Failed,Fill Initial,Surname and select Perment Base,Temporary Base !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }

            else
            {
                lblError.Visible = false;

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                try
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Save_CivilPersonalDetails]";

                    
                    cmd.Parameters.AddWithValue("@initial", txtInitial.Text);
                    cmd.Parameters.AddWithValue("@surname", txtSurname.Text);
                    cmd.Parameters.AddWithValue("@rank", ddlRank.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@permentBase", ddlBaseAll.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@temporaryBase", ddlTBase.SelectedValue.ToString());

                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;
                    lblError.Text = "Save Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;

                }
                catch (Exception ex)
                {
                }

              
            }
        }

        protected void ddlBaseAll_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCivilDoctorNameList.aspx");
        }
    }
}