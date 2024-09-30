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
    public partial class ViewTeaMarkDetails : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
      
        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtTeaCount = new DataTable();
        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();
        //public static DataSet countNVeg = new DataSet();
        public static DataTable dtTotalTea = new DataTable();

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

            txtWardRoom.Text = Session["wardRoomName"].ToString();
            txtWardRoom0.Text = Session["wardRoomName"].ToString();

            dtWardroom = itemObject.GetWardroom(strConnString);
            ddlWardroom.DataSource = dtWardroom;

            ddlWardroom.DataTextField = "wardroomName";
            ddlWardroom.DataValueField = "wardroomCode";
            ddlWardroom.DataBind();

            ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));


            dtWardroom = itemObject.GetWardroom(strConnString);
            ddlWardroom0.DataSource = dtWardroom;

            ddlWardroom0.DataTextField = "wardroomName";
            ddlWardroom0.DataValueField = "wardroomCode";
            ddlWardroom0.DataBind();

            ddlWardroom0.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            bindData();
        }


        public void bindData()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_ViewTeaDetails]";

            command.Parameters.AddWithValue("@teaDate", dateSelected.SelectedDate);
            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();

            getTeaCount();
            //getPlainTeaCount();
        }

        public void getTeaCount()
        {
            string date = dateSelected.SelectedDate.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();

            dtTeaCount = itemObject.GetTeaCount(strConnString, date, wardroomCode);

            if (dtTeaCount.Rows.Count > 0)
            {
                Session["ss"] = dtTeaCount;
                Publishdata(dtTeaCount, date, wardroomCode);
            }
        }

        public void Publishdata(DataTable one, string date, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchTeaDetils(date, wardroomCode);

            GetPersonalTea(xx);
        }

        private DataSet SearchTeaDetils(string date, string wardroomCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetTeaCount]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetPersonalTea(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblTeaCount.Text = personal.Tables[0].Rows[0]["teaCount"].ToString();
                }
                else
                {
                    lblTeaCount.Text = "No Data";
                }

                if (0 < (personal.Tables[1].Rows.Count))
                {
                    lblPlainTeaCount.Text = personal.Tables[1].Rows[0]["plainTeaCount"].ToString();
                }
                else
                {
                    lblPlainTeaCount.Text = "No Data";
                }
            }
        }

        protected void ddlWardroom_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["teaID"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[T_TeaMark] WHERE [teaID] = '" + int.Parse(id) + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblError.Text = "Delete Successfull";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex) { }
            }

            bindData();
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

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void ddlYear_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void btnViewMonthly_Click(object sender, EventArgs e)
        {

            string year = ddlYear.SelectedItem.Text;
            string month = ddlMonth.SelectedValue.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();

            dtTotalTea = itemObject.GetTotalTeaCost(strConnString, year, month, wardroomCode);

            if (dtTotalTea.Rows.Count > 0)
            {
                Session["ss"] = dtTotalTea;
                Publishdata(dtTotalTea, year, month, wardroomCode);
            }
        }

        public void Publishdata(DataTable one, string year, string month, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchTotalTeaCost(year, month, wardroomCode);

            GetTotalCost(xx);
        }

        private DataSet SearchTotalTeaCost(string year, string month, string wardroomCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetMonthlyTea]", con);

            cmd.CommandType = CommandType.StoredProcedure;

     
            cmd.Parameters.AddWithValue("@year", ddlYear.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());

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
           

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblTotalPlainTeaCount.Text = personal.Tables[0].Rows[0]["tea"].ToString();
                }
                else
                {
                    lblTotalPlainTeaCount.Text = "0";
                }

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblTotalTeaCount.Text = personal.Tables[0].Rows[1]["tea"].ToString();
                }
                else
                {
                    lblTotalTeaCount.Text = "0";
                }

            }
        }
    }
}