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
    public partial class EditCashBook : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String wardRoomName, wardRoomCode;
        public static DataTable dtGetCost = new DataTable();

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();
        public static DataSet xx = new DataSet();
        public static DataSet xx1 = new DataSet();
        public static DataSet xx2 = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String userName = Session["LOGIN_NAME"].ToString();
                wardRoomName = Session["wardRoomName"].ToString().Trim();
                wardRoomCode = Session["wardRoomCode"].ToString().Trim();
            }
            txtWardRoom.Text = Session["wardRoomName"].ToString();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void lblUpdate_Click(object sender, EventArgs e)
        {

        }
    }
}