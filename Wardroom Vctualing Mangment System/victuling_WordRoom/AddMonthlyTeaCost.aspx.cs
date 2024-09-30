using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace victuling_WordRoom
{
    public partial class AddMonthlyTeaCost : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static string WARDROOMNAME, WARDROOMCODE;
        protected void Page_Load(object sender, EventArgs e)
        {
            WARDROOMNAME = Session["wardRoomName"].ToString();
            WARDROOMCODE = Session["wardRoomCode"].ToString();
            if (!IsPostBack)
            {
                LoadInitialData();
            }
        }

        protected void LoadInitialData()
        {
            txtWardRoom.Text = WARDROOMNAME;

            cmbYear.DataSource = PopulateYear();
            cmbYear.DataTextField = "Text";
            cmbYear.DataValueField = "Value";
            cmbYear.DataBind();

            cmbMonth.DataSource = PopulateMonths();
            cmbMonth.DataTextField = "Text";
            cmbMonth.DataValueField = "Value";
            cmbMonth.DataBind();
        }

        protected DataTable PopulateYear()
        {
            var currentYear = DateTime.Now.Year;
            var dt = new DataTable();
            dt.Columns.Add("Value", typeof(int));
            dt.Columns.Add("Text", typeof(string));

            var row = dt.NewRow();
            row["Value"] = 0;
            row["Text"] = "-- Select Year --";
            dt.Rows.Add(row);

            for (int i = currentYear-5; i < currentYear+5; i++)
            {
                var newRow = dt.NewRow();
                newRow["Value"] = i;
                newRow["Text"] = i.ToString();

                dt.Rows.Add(newRow);
            }

            return dt;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (cmbYear.SelectedItem.Value=="0" || cmbMonth.SelectedItem.Value=="0")
            {
                lblError.Text = "Please Select Year or Month";
                lblError.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                var cmd = new SqlCommand("VICTULING_INSERTMONTHLYTEACOST", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Year", cmbYear.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Month", cmbMonth.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PlainTeaCost", txtPlainTeaCost.Text);
                cmd.Parameters.AddWithValue("@TeaCost", txtTeaCost.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblError.Text = "Save Success";
                lblError.ForeColor = System.Drawing.Color.Green;

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected DataTable PopulateMonths()
        {
            var dt = new DataTable();
            dt.Columns.Add("Value", typeof(int));
            dt.Columns.Add("Text", typeof(string));

            var row = dt.NewRow();
            row["Value"] = 0;
            row["Text"] = "-- Select Month --";
            dt.Rows.Add(row);

            for (int i = 1; i <= 12; i++)
            {
                var newRow = dt.NewRow();
                newRow["Value"] = i;
                newRow["Text"] = i.ToString();

                dt.Rows.Add(newRow);
            }
            return dt;
        }
    }
}