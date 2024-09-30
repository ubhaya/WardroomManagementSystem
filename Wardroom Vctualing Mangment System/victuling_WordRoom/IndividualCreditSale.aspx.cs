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
    public partial class IndividualCreditSale : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtIndividualCredit = new DataTable();

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();
        public static String wardRoomName, wardRoomCode;

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
            ddlWardroom.DataSource = dtWardroom;

            ddlWardroom.DataTextField = "wardroomName";
            ddlWardroom.DataValueField = "wardroomCode";
            ddlWardroom.DataBind();

            ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));


            txtWardRoom.Text = Session["wardRoomName"].ToString();
        }


        protected void btnView_Click(object sender, EventArgs e)
        {
           
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetIndividualCredit]";

            command.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
            command.Parameters.AddWithValue("@officerSailor", ddlOfficerSailor.SelectedValue.ToString());
            //command.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);
            command.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
            command.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();

            GetIndividualCredit();
        }

        public void GetIndividualCredit()
        {
            string officialNo = txtOfficialNo.Text;
            string os = "O";
            //string serviceType = ddlServiceType.SelectedItem.Text;
            string year = ddlYear.SelectedItem.Text;
            string month = ddlMonth.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();

            dtIndividualCredit = itemObject.GetTotalMenuCostIndividual(strConnString, officialNo, os, year, month, wardroomCode);

            if (dtIndividualCredit.Rows.Count > 0)
            {
                Session["ss"] = dtIndividualCredit;
                Publishdata(dtIndividualCredit, officialNo, os, year, month, wardroomCode);
            }
        }

        public void Publishdata(DataTable one, string officialNo, string os,  string year, string month, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchTotalMEnuCost(officialNo, os, year, month, wardroomCode);

            GetTotalCost(xx);
        }

        private DataSet SearchTotalMEnuCost(string officialNo, string os, string year, string month, string wardroomCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetIndividualCredit]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@officialNo", txtOfficialNo.Text);
            cmd.Parameters.AddWithValue("@officerSailor", ddlOfficerSailor.SelectedValue.ToString());
            //cmd.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetTotalCost(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[1].Rows.Count))
                {
                    lblCredit.Text = personal.Tables[1].Rows[0]["creditDebit"].ToString();
                }
                else
                {
                    lblCredit.Text = "No Data";
                }
            }
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {

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

        protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void ddlYear_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void ddlMonth_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void ddlOfficerSailor_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }
    }
}