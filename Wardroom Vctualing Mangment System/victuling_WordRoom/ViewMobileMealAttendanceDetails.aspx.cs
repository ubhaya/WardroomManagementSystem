using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using VICTULING_DLL.MobileStatus;

namespace victuling_WordRoom
{
    public partial class ViewMobileMealAttendanceDetails : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public static DataTable dataTable = new DataTable();
        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtMenuReason = new DataTable();

        public static string wardRoomName, wardRoomCode, userName ;
        protected void Page_Load(object sender, EventArgs e)
        {
            userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();
            if (!IsPostBack)
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

        protected void ddlReason_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void grdReport_ItemDataBound(object sender, GridItemEventArgs e)
        {

        }

        protected void grdReport_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            var date = dateSaleDate.SelectedDate.HasValue ? dateSaleDate.SelectedDate.Value : DateTime.Now;
            var reason = ddlReason.SelectedValue.ToString();
            dataTable.Clear();
            dataTable= MealAttendanceClass.GetUnConfirmedAttendance(date, wardRoomCode, reason);
            grdReport.DataSource = dataTable;
            grdReport.DataBind();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            var wardroom = new Wardroom
            {
                WardroomCode = wardRoomCode,
                WardroomName = wardRoomName
            };

            MealAttendanceClass.ConfirmedAttendance(dataTable,userName,wardroom, ddlReason.SelectedValue.ToString());
        }
    }
}