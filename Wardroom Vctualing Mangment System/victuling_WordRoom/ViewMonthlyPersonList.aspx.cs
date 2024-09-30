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
    public partial class ViewMonthlyPersonList : System.Web.UI.Page
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
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetMonthlyOfficersList]";

            command.Parameters.AddWithValue("@wardroomName", Session["wardRoomCode"].ToString());
            command.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
            command.Parameters.AddWithValue("@moth", ddlMonth.SelectedValue.ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

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
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;


            string wardroomCode = Session["wardRoomCode"].ToString();
            string year = ddlYear.SelectedValue.ToString();
            string month = ddlMonth.SelectedValue.ToString();

            dt = itemObject.GetAuthorizedList(strConnString, wardroomCode, year, month);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string serviceType = "";
                string branchID = "";
                string officialNo = "";
                string rankRate = "";
                string name = "";
 
            
                serviceType = dt.Rows[i]["serviceType"].ToString();
                branchID = dt.Rows[i]["branchID"].ToString();
                officialNo = dt.Rows[i]["officialNo"].ToString();
                rankRate = dt.Rows[i]["rankRate"].ToString();
                name = dt.Rows[i]["name"].ToString();
               

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = con;
                try
                {

                    con.Open();
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.CommandText = "VICTULING_InsertMonthlyOfficerList";

                    sqlcmd.Parameters.AddWithValue("@serviceType", serviceType);
                    sqlcmd.Parameters.AddWithValue("@branch", branchID);
                    sqlcmd.Parameters.AddWithValue("@offNo", officialNo);
                    sqlcmd.Parameters.AddWithValue("@rank", rankRate);
                    sqlcmd.Parameters.AddWithValue("@name", name);
                 
                    sqlcmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());
                    sqlcmd.Parameters.AddWithValue("@year", ddlYear.SelectedValue.ToString());
                    sqlcmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());

            

                    sqlcmd.ExecuteNonQuery();
                    con.Close();
                    lblSave.Visible = true;
                    lblSave.ForeColor = System.Drawing.Color.Green;
                    lblSave.Text = "Save Success";

                }
                catch
                {

                }
            }
        }
    }
}