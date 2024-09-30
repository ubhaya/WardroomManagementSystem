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
    public partial class viewMonthlyRecoveryWIthDetails : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dt = new DataTable();
        public static String wardRoomName, wardRoomCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();

            }
            wardRoomCode = Session["wardRoomCode"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            txtWardRoom.Text = wardRoomName;
        }

        public void LoadBasic()
        {

            dtWardroom = itemObject.GetWardroom(strConnString);
            //ddlWardroom.DataSource = dtWardroom;

            //ddlWardroom.DataTextField = "wardroomName";
            //ddlWardroom.DataValueField = "wardroomCode";
            //ddlWardroom.DataBind();

            //ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }


        protected void grdReport_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            bindRecovery();
        }

        public void bindRecovery()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyRecoveryByMonth]";

            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
        }

        protected void btnAuthorized_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();

            dt = itemObject.GetFinalRecoveryNew(strConnString, wardroomCode, year, month);


            for (int i = 0; i < dt.Rows.Count; i++)
            {

                string serviceType = "";
                string officialNo = "";
                string totalMenuCost = "";
                string extraParty = "";
                string plainTeaCost = "";
                string teaCost = "";
                string totalCost = "";
                string noDaysInBase = "";
                string costPerDay = "";
                string crditDebit = "";
                string noDaysInSea = "";
                string costPerSeaDay = "";

                serviceType = dt.Rows[i]["serviceType"].ToString();
                officialNo = dt.Rows[i]["officialNo"].ToString();
                totalMenuCost = dt.Rows[i]["totalMenuCost"].ToString();
                extraParty = dt.Rows[i]["extraParty"].ToString();
                plainTeaCost = dt.Rows[i]["plainTeaCost"].ToString();
                teaCost = dt.Rows[i]["teaCost"].ToString();
                totalCost = dt.Rows[i]["totalCost"].ToString();
                noDaysInBase = dt.Rows[i]["noDaysInBase"].ToString();
                costPerDay = dt.Rows[i]["costPerDay"].ToString();
                crditDebit = dt.Rows[i]["crditDebit"].ToString();
                noDaysInSea = dt.Rows[i]["noDaysInSea"].ToString();
                costPerSeaDay = dt.Rows[i]["costPerSeaDay"].ToString();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "VICTULING_insert_T_TotalIndividualCostPerMonth";


                    sqlcmd.Parameters.AddWithValue("@officialNo", officialNo);
                    sqlcmd.Parameters.AddWithValue("@serviceType", serviceType);
                    sqlcmd.Parameters.AddWithValue("@OS", "O");
                    sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@totalMenuCost", totalMenuCost);
                    sqlcmd.Parameters.AddWithValue("@extraTotalCost", extraParty);
                    sqlcmd.Parameters.AddWithValue("@plainTeaCost", plainTeaCost);
                    sqlcmd.Parameters.AddWithValue("@TeaCost", teaCost);
                    sqlcmd.Parameters.AddWithValue("@individualTotalCost", totalCost);
                    sqlcmd.Parameters.AddWithValue("@noOfDays", noDaysInBase);
                    sqlcmd.Parameters.AddWithValue("@costPerDay", costPerDay);
                    sqlcmd.Parameters.AddWithValue("@creditDebit", crditDebit);

                    sqlcmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    sqlcmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);
                    sqlcmd.Parameters.AddWithValue("@noOfSeaDays", noDaysInSea);
                    sqlcmd.Parameters.AddWithValue("@costPerSeaDay", costPerSeaDay);


                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success !";

                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}