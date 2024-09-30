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
    public partial class TeaRetionCalculation : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String wardRoomName, wardRoomCode;
        public static DataTable dtTeaCOunt = new DataTable();
        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();
        public static string reason = "";
        public static string year = "";
        public static string month = "";
        public static string wardroomName = "";

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String userName = Session["LOGIN_NAME"].ToString();
                wardRoomName = Session["wardRoomName"].ToString().Trim();
                wardRoomCode = Session["wardRoomCode"].ToString().Trim();
            }
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {

            ViewSaleMenuItem();
            getTeaCount();
        }


        public void getTeaCount()
        {

            string reason = ddlReason.SelectedValue.ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();
            string wardroomName = Session["wardRoomCode"].ToString().Trim();

            dtTeaCOunt = itemObject.GetAllMonthlyTeaCount(strConnString, reason, year, month, wardroomName);

            if (dtTeaCOunt.Rows.Count > 0)
            {
                Session["ss"] = dtTeaCOunt;
                Publishdata(dtTeaCOunt, reason, year, month, wardroomName);
            }

          
        }



        public void Publishdata(DataTable one, string reason, string year, string month, string wardroomName)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchMonthlyTeaCount(reason, year, month, wardroomName);
            GetPersonalData(xx);
        }

        public void GetPersonalData(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {
                
                if (0 < (personal.Tables[2].Rows.Count))
                {
                    lblTeaCount.Text = personal.Tables[2].Rows[0]["Tea"].ToString();
                }
                else
                {
                    lblTeaCount.Text = "No Data";
                }

                if (0 < (personal.Tables[1].Rows.Count))
                {
                    lblPlainTeaCout.Text = personal.Tables[1].Rows[0]["PlainTea"].ToString();
                }
                else
                {
                    lblPlainTeaCout.Text = "No Data";
                }


            }

        }

        private DataSet SearchMonthlyTeaCount(string reason, string year, string month, string wardroomName)
        {

            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetTeaRetion_ForMonth]", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@reason", SqlDbType.VarChar, 250).Value = reason;
            cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
            cmd.Parameters.Add("@month", SqlDbType.VarChar, 250).Value = month;
            cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomName;
            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);

            return dst;
        }

        public void ViewSaleMenuItem()
        {
            try
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_GetTeaRetion_ForMonth]";

                command.Parameters.AddWithValue("@reason", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                command.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomName", (wardRoomCode.ToString()).Trim());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport.DataSource = ds.Tables[0];
                grdReport.DataBind();

                float tot = 0F;
                for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
                {
                    tot += float.Parse(ds.Tables[0].Rows[x][8].ToString());
                }
                lblTot.Text = tot.ToString();
                Label1.Visible = true;
                lblTot.Visible = true;

                con.Close();
            }
            catch (Exception ex) { }
        }

        protected void grdReport_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn1") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {

        }
    }
}