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
    public partial class ViewAllMealAttendanceDetails : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtAllMealCount = new DataTable();
        public static DataTable dtTeaCount = new DataTable();

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
             txtWardRoom.Text = Session["wardRoomName"].ToString();

            dtWardroom = itemObject.GetWardroom(strConnString);
            ddlWardroom.DataSource = dtWardroom;

            ddlWardroom.DataTextField = "wardroomName";
            ddlWardroom.DataValueField = "wardroomCode";
            ddlWardroom.DataBind();

            ddlWardroom.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtMenuReason = itemObject.GetManuReason(strConnString);
            ddlReason.DataSource = dtMenuReason;

            ddlReason.DataTextField = "reason";
            ddlReason.DataValueField = "reasonCode";
            ddlReason.DataBind();
            ddlReason.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void rgdBoardAssessment_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport0_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport0.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn0") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport0.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void grdReport_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        public void MealMark()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetAllMealAttendanceList]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];

            grdReport.DataBind();

            con.Close();
            getMealCount();
        }

        public void GroupMealMark()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetAllGroupMealAttendanceList]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[0];

            grdReport2.DataBind();

            con.Close();
            getMealCount();
        }

        public void ViewExtra()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetCstomizeIndividualItems]";

            command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedItem.Text);
            command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[0];

            grdReport0.DataBind();

            con.Close();
        }

        public void 
            ViewTeaMark()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_ViewTeaDetails]";

            command.Parameters.AddWithValue("@teaDate", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport1.DataSource = ds.Tables[0];

            grdReport1.DataBind();

            con.Close();

            getTeaCount();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            MealMark();
            GroupMealMark();
            ViewExtra();
            ViewTeaMark();
        }

        protected void ddlReason_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
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

        protected void grdReport1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport1.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn1") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport1.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        public void getTeaCount()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();

            dtTeaCount = itemObject.GetTeaCount(strConnString, date, wardroomCode);

            if (dtTeaCount.Rows.Count > 0)
            {
                Session["ss"] = dtTeaCount;
                Publishdata(dtTeaCount, date, wardroomCode);
            }
        }

        public void getMealCount()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString();
            string reason = ddlReason.SelectedValue.ToString();

            dtAllMealCount = itemObject.GetAllMealCount(strConnString, date, wardroomCode, reason);

            if (dtAllMealCount.Rows.Count > 0)
            {
                Session["ss"] = dtTeaCount;
                PublishMealdata(dtAllMealCount, date, wardroomCode, reason);
            }
        }

        public void Publishdata(DataTable one, string date, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchTeaDetils(date, wardroomCode);

            GetPersonalTea(xx);
        }

        public void PublishMealdata(DataTable one, string date, string wardroomCode, string reason)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = SearchMealDetils(date, wardroomCode, reason);

            GetPersonalMeal(xx);
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

        private DataSet SearchMealDetils(string date, string wardroomCode, string reason)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetAllMealAttendanceCount]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar).Value = wardroomCode;
            cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reason;

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

        public void GetPersonalMeal(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[0].Rows.Count))
                {
                    lblNonVegetarian.Text = personal.Tables[0].Rows[0]["NonVegiMealCount"].ToString();
                }
                else
                {
                    lblNonVegetarian.Text = "No Data";
                }

                if (0 < (personal.Tables[1].Rows.Count))
                {
                    lblVegetarian.Text = personal.Tables[1].Rows[0]["VegiMealCount"].ToString();
                }
                else
                {
                    lblVegetarian.Text = "No Data";
                }
            }
        }

        protected void grdReport2_ItemCommand(object sender, GridCommandEventArgs e)
        {

        }

        protected void grdReport2_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport2.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn2") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport2.PageCount) + e.Item.ItemIndex + 1);
            }
        }
    }
}