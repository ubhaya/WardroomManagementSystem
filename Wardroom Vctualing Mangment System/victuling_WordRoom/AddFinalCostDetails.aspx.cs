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
    public partial class AddFinalCostDetails : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dt = new DataTable();
        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (IsPostBack != true)
            {

                txtWardRoom.Text = Session["wardRoomName"].ToString();
            }
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            if (ddlReason.SelectedItem.Text == "Main Menu Cost - Non-Vegetarian")
            {
                getNVegMainMenu();
            }

            else if (ddlReason.SelectedItem.Text == "Main Menu Cost - Vegetarian")
            {
                getVegMainMenu();
            }

            else if (ddlReason.SelectedItem.Text == "Extra Cost")
            {
                getextraMenu();
            }

            if (ddlReason.SelectedItem.Text == "Party Cost")
            {
                getPartyMenu();
            }

            else if (ddlReason.SelectedItem.Text == "Tea Count")
            {
                getTeaCount();
            }

            else if (ddlReason.SelectedItem.Text == "Plain Tea Count")
            {
                getPlinTeaCount();
            }
            else if (ddlReason.SelectedItem.Text == "No of Days in Base")
            {
                getVicCount();
            }
        }

        public void getNVegMainMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
        }

        public void getVegMainMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[1];

            grdReport.DataBind();

            con.Close();
        }


        public void getextraMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[2];

            grdReport.DataBind();

            con.Close();
        }

        public void getPartyMenu()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[3];

            grdReport.DataBind();

            con.Close();
        }

        public void getPlinTeaCount()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[4];

            grdReport.DataBind();

            con.Close();
        }

        public void getTeaCount()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[5];

            grdReport.DataBind();

            con.Close();
        }

        public void getVicCount()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[6];

            grdReport.DataBind();

            con.Close();
        }

        protected void grdReport_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void btnAuthorized_Click(object sender, EventArgs e)
        {
            if (ddlReason.SelectedItem.Text == "Main Menu Cost - Non-Vegetarian")
            {
                updateNonVegMenuCost();
            }

            else if (ddlReason.SelectedItem.Text == "Main Menu Cost - Vegetarian")
            {
                updateVegMenuCost();
            }

            else if (ddlReason.SelectedItem.Text == "Extra Cost")
            {
                updateExtraMenuCost();
            }

            if (ddlReason.SelectedItem.Text == "Party Cost")
            {
                updatePartyCost();
            }

            else if (ddlReason.SelectedItem.Text == "Tea Count")
            {
                updateTeaCount();
            }

            else if (ddlReason.SelectedItem.Text == "Plain Tea Count")
            {
                updatePlainTeaCount();
            }
            else if (ddlReason.SelectedItem.Text == "No of Days in Base")
            {
                updateVICDates();
            }

            //updateNonVegMenuCost();
            //updateVegMenuCost();
            //updateExtraMenuCost();
            //updatePartyCost();
            //updateTeaCount();
            //updatePlainTeaCount();
            //updateVICDates();
        }

        public void updateNonVegMenuCost()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();

            dt = itemObject.GetAuthorizedNonMenuCostList(strConnString, wardroomCode, year, month);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string serviceType = "";
                string branch = "";
                string offNo = "";
                string rankRate = "";
                string name = "";
                string cost = "";


                serviceType = dt.Rows[i]["serviceType"].ToString();
                branch = dt.Rows[i]["branchID"].ToString();
                offNo = dt.Rows[i]["officialNo"].ToString();
                rankRate = dt.Rows[i]["rankRate"].ToString();
                name = dt.Rows[i]["name"].ToString();
                cost = dt.Rows[i]["cost"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "VICTULING_Update_allOfficersMenuCost";

                    sqlcmd.Parameters.AddWithValue("@serviceType", serviceType);
                    sqlcmd.Parameters.AddWithValue("@branch", branch);
                    sqlcmd.Parameters.AddWithValue("@offNo", offNo);     
                    sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@nVegMenuCost", cost);
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);   


                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success !";

                }
                catch
                {

                }
            }
        }

        public void updateVegMenuCost()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();

            dt = itemObject.GetAuthorizedVegMenuCostList(strConnString, wardroomCode, year, month);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string serviceType = "";
                string branch = "";
                string offNo = "";
                string rankRate = "";
                string name = "";
                string cost = "";


                serviceType = dt.Rows[i]["serviceType"].ToString();
                branch = dt.Rows[i]["branchID"].ToString();
                offNo = dt.Rows[i]["officialNo"].ToString();
                rankRate = dt.Rows[i]["rankRate"].ToString();
                name = dt.Rows[i]["name"].ToString();
                cost = dt.Rows[i]["cost"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "VICTULING_Update_allOfficersVegMenuCost";

                    sqlcmd.Parameters.AddWithValue("@serviceType", serviceType);
                    sqlcmd.Parameters.AddWithValue("@branch", branch);
                    sqlcmd.Parameters.AddWithValue("@offNo", offNo);
                    sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@vegMenuCost", cost);
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success !";

                }
                catch
                {

                }
            }
        }

        public void updateExtraMenuCost()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();

            dt = itemObject.GetAuthorizedExtraMenuCostList(strConnString, wardroomCode, year, month);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string serviceType = "";
                string branch = "";
                string offNo = "";
                string rankRate = "";
                string name = "";
                string cost = "";


                serviceType = dt.Rows[i]["serviceType"].ToString();
                branch = dt.Rows[i]["branchID"].ToString();
                offNo = dt.Rows[i]["officialNo"].ToString();
                rankRate = dt.Rows[i]["rankRate"].ToString();
                name = dt.Rows[i]["name"].ToString();
                cost = dt.Rows[i]["cost"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "VICTULING_Update_allOfficersExtraMenuCost";

                    sqlcmd.Parameters.AddWithValue("@serviceType", serviceType);
                    sqlcmd.Parameters.AddWithValue("@branch", branch);
                    sqlcmd.Parameters.AddWithValue("@offNo", offNo);
                    sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@extraCost", cost);
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success !";

                }
                catch
                {

                }
            }
        }


        public void updatePartyCost()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();

            dt = itemObject.GetAuthorizedPartyCostList(strConnString, wardroomCode, year, month);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string serviceType = "";
                string branch = "";
                string offNo = "";
                string rankRate = "";
                string name = "";
                string cost = "";


                serviceType = dt.Rows[i]["serviceType"].ToString();
                branch = dt.Rows[i]["branchID"].ToString();
                offNo = dt.Rows[i]["officialNo"].ToString();
                rankRate = dt.Rows[i]["rankRate"].ToString();
                name = dt.Rows[i]["name"].ToString();
                cost = dt.Rows[i]["cost"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "[VICTULING_Update_allOfficersPartyCost]";

                    sqlcmd.Parameters.AddWithValue("@serviceType", serviceType);
                    sqlcmd.Parameters.AddWithValue("@branch", branch);
                    sqlcmd.Parameters.AddWithValue("@offNo", offNo);
                    sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@partyCost", cost);
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success !";

                }
                catch
                {

                }
            }
        }


        public void updateTeaCount()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();

            dt = itemObject.GetAuthorizedTeaCountList(strConnString, wardroomCode, year, month);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string serviceType = "";
                string branch = "";
                string offNo = "";
                string rankRate = "";
                string name = "";
                string cost = "";


                serviceType = dt.Rows[i]["serviceType"].ToString();
                branch = dt.Rows[i]["branchID"].ToString();
                offNo = dt.Rows[i]["officialNo"].ToString();
                rankRate = dt.Rows[i]["rankRate"].ToString();
                name = dt.Rows[i]["name"].ToString();
                cost = dt.Rows[i]["cost"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "[VICTULING_Update_allOfficersTeaCount]";

                    sqlcmd.Parameters.AddWithValue("@serviceType", serviceType);
                    sqlcmd.Parameters.AddWithValue("@branch", branch);
                    sqlcmd.Parameters.AddWithValue("@offNo", offNo);
                    sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@teaCount", cost);
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success !";

                }
                catch
                {

                }
            }
        }

        public void updatePlainTeaCount()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();

            dt = itemObject.GetAuthorizedPlainTeaCountList(strConnString, wardroomCode, year, month);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string serviceType = "";
                string branch = "";
                string offNo = "";
                string rankRate = "";
                string name = "";
                string cost = "";


                serviceType = dt.Rows[i]["serviceType"].ToString();
                branch = dt.Rows[i]["branchID"].ToString();
                offNo = dt.Rows[i]["officialNo"].ToString();
                rankRate = dt.Rows[i]["rankRate"].ToString();
                name = dt.Rows[i]["name"].ToString();
                cost = dt.Rows[i]["cost"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "[VICTULING_Update_allOfficersPlainTeaCount]";

                    sqlcmd.Parameters.AddWithValue("@serviceType", serviceType);
                    sqlcmd.Parameters.AddWithValue("@branch", branch);
                    sqlcmd.Parameters.AddWithValue("@offNo", offNo);
                    sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@plainTeaCount", cost);
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);


                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success !";

                }
                catch
                {

                }
            }
        }

        public void updateVICDates()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();

            dt = itemObject.GetAuthorizedVICDaysCountList(strConnString, wardroomCode, year, month);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string serviceType = "";
                string branch = "";
                string offNo = "";
                string rankRate = "";
                string name = "";
                string cost = "";
                string seaDays = "";
                string baseDays = "";

                serviceType = dt.Rows[i]["serviceType"].ToString();
                branch = dt.Rows[i]["branchID"].ToString();
                offNo = dt.Rows[i]["officialNo"].ToString();
                rankRate = dt.Rows[i]["rankRate"].ToString();
                name = dt.Rows[i]["name"].ToString();
                cost = dt.Rows[i]["cost"].ToString();
                seaDays = dt.Rows[i]["seaDays"].ToString();
                baseDays = dt.Rows[i]["baseDays"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "[VICTULING_Update_allOfficersVICDays]";

                    sqlcmd.Parameters.AddWithValue("@serviceType", serviceType);
                    sqlcmd.Parameters.AddWithValue("@branch", branch);
                    sqlcmd.Parameters.AddWithValue("@offNo", offNo);
                    sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@noDaysInBase", cost);
                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                    sqlcmd.Parameters.AddWithValue("@noDaysInSea", seaDays);
                    sqlcmd.Parameters.AddWithValue("@noDaysInBaseNew", baseDays);

                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success !";

                }
                catch
                {

                }
            }
        }

    }
}