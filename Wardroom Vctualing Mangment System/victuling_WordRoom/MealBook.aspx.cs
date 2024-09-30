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
    public partial class MealBook : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();


        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();

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

        protected void btnFind_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_MealBook]";
                                
                command.Parameters.AddWithValue("@month", int.Parse(txtDate.SelectedDate.Value.Month.ToString()));
                command.Parameters.AddWithValue("@wardroomCode", Session["wardRoomCode"].ToString());
                command.Parameters.AddWithValue("@offNo", int.Parse(txtOffNo.Text.ToString()));

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport.DataSource = ds.Tables[0];
                grdReport.DataBind();

                con.Close();
            }
            catch (Exception ex) { }

            getOfficerDetails(txtOffNo.Text.ToString());
        }

        public void getOfficerDetails(string offNo)
        {
            dtOfficerSailor = itemObject.GetAllOfficerDetails(strConnString2, "O", offNo);
            lblMsg.Text = dtOfficerSailor.Rows[0][5].ToString() + " - " + dtOfficerSailor.Rows[0][3].ToString() + " - " + dtOfficerSailor.Rows[0][6].ToString();

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
    }
}