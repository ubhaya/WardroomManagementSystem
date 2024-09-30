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
    public partial class ViewIndividualExtraForCA : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtGetExItems = new DataTable();
        public static DataTable dtGetExItemsExtraByCA = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static int countval = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

            dtMenuReason = itemObject.GetManuReason(strConnString);
            ddlReason.DataSource = dtMenuReason;

            ddlReason.DataTextField = "reason";
            ddlReason.DataValueField = "reasonCode";
            ddlReason.DataBind();
            ddlReason.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }

        protected void btnVegi_Click(object sender, EventArgs e)
        {
            if ((dateSaleDate.SelectedDate.ToString() == "") || (ddlReason.SelectedItem.Text == "---Select---") || (ddlWardroom.SelectedItem.Text == "---Select---"))
            {
                lblError.Visible = true;
                lblError.Text = "Date Cannot be Empty and Select Reason,Ward Room !";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                con.Open();
                SqlCommand command = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet ds = new DataSet();

                command.Connection = con;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[VICTULING_ViewIndividualExtraItemByCA]";

                command.Parameters.AddWithValue("@date", dateSaleDate.SelectedDate.ToString());
                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@wardroomCode", ddlWardroom.SelectedValue.ToString());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport0.DataSource = ds.Tables[0];

                grdReport0.DataBind();

                con.Close();
            }
        }

        protected void grdReport0_ItemCommand(object sender, GridCommandEventArgs e)
        {

        }

        protected void grdReport0_ItemDataBound(object sender, GridItemEventArgs e)
        {

        }

        protected void rgdBoardAssessment_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void grdReport_SelectedCellChanged(object sender, EventArgs e)
        {

        }
    }
}