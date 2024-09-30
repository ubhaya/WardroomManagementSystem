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
    public partial class summaryOfIndividualCost : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtGetGroupMenuList = new DataTable();
        public static String wardRoomCode;
        public static DataSet xx = new DataSet();
        public static DataSet xx1 = new DataSet();
        public static DataSet xx2 = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (IsPostBack != true)
            {
                LoadBasic();
                //SetInitialRow();
            }
        }

        public void LoadBasic()
        {
            dtWardroom = itemObject.GetWardroom(strConnString);
            txtWardRoom.Text = Session["wardRoomName"].ToString();
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            GetGroupMenuNameList();
        }

        public void GetGroupMenuNameList()
        {
            string date = dateSaleDate.SelectedDate.ToString();
            string wardroomCode = wardRoomCode;


            dtGetGroupMenuList = itemObject.GetIndividualSummary(strConnString, date, wardroomCode);

            if (dtGetGroupMenuList.Rows.Count > 0)
            {
                Session["ss"] = dtGetGroupMenuList;
                PublishdataData(dtGetGroupMenuList, date, wardroomCode);
            }
        }

        public void PublishdataData(DataTable one, string date, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx1.Clear();
            xx1 = SearchNameList(date, wardroomCode);

            GetPersonalData(xx1);
        }

        private DataSet SearchNameList(string date, string wardroomCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetIndividualMealDates_price]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@wardroom", SqlDbType.VarChar).Value = wardroomCode;


            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetPersonalData(DataSet xy)
        {

            DataSet personal = xy;
            if (personal.Tables[0].Rows.Count > 0)
            {

                if (0 < (personal.Tables[4].Rows.Count))
                {
                    lblNVegCost.Text = personal.Tables[4].Rows[0]["nonVegMenuCost"].ToString();
                }
                else
                {
                    lblNVegCost.Text = "0.00";
                }

                if (0 < (personal.Tables[5].Rows.Count))
                {
                    lblVegCost.Text = personal.Tables[5].Rows[0]["vegMenuCost"].ToString();
                }
                else
                {
                    lblVegCost.Text = "0.00";
                }

                if (0 < (personal.Tables[6].Rows.Count))
                {
                    lblExtraMCost.Text = personal.Tables[6].Rows[0]["extraCost"].ToString();
                }
                else
                {
                    lblExtraMCost.Text = "0.00";
                }


                if (0 < (personal.Tables[7].Rows.Count) )
                {
                    lblParty.Text = personal.Tables[7].Rows[0]["partyCost"].ToString();
                }
                else
                {
                    lblParty.Text = "0.00";
                }

                if (0 < (personal.Tables[8].Rows.Count))
                {
                    lblTea.Text = personal.Tables[8].Rows[1]["teaCount"].ToString();
                }
                else
                {
                    lblTea.Text = "0";
                }

                if (0 < (personal.Tables[8].Rows.Count))
                {
                    lblPlainTea.Text = personal.Tables[8].Rows[0]["teaCount"].ToString();
                }
                else
                {
                    lblPlainTea.Text = "0";
                }

              
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int teaCount = 0;
            int plainCount = 0;
            double teaCost = 0.00;
            double plianTeaCost = 0.00;
            double teaAns = 0.00;
            double plainTeaAns = 0.00;

            teaCount = System.Int32.Parse(lblTea.Text);
            plainCount = System.Int32.Parse(lblPlainTea.Text);

            teaCost = System.Double.Parse(txtTeaCost.Text);
            plianTeaCost = System.Double.Parse(txtPlian.Text);


            teaAns = (teaCount * teaCost);
            lblTeaCostValue.Text = teaAns.ToString();

            plainTeaAns = (plainCount * plianTeaCost);
            lblPlainTeaCostValue.Text= plainTeaAns.ToString();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            double NvegMenuCost = 0.00;
            double vegMenuCost = 0.00;
            double extraCost = 0.00;
            double partyCost = 0.00;
            double teaCost = 0.00;
            double plainTeaCost = 0.00;
            double TotalCost = 0.00;

            NvegMenuCost = System.Double.Parse(lblNVegCost.Text);
            vegMenuCost = System.Double.Parse(lblVegCost.Text);

            extraCost = System.Double.Parse(lblExtraMCost.Text);
            partyCost = System.Double.Parse(lblParty.Text);

            teaCost = System.Double.Parse(lblTeaCostValue.Text);
            plainTeaCost = System.Double.Parse(lblPlainTeaCostValue.Text);

            if ((txtTeaCost.Text == "") && (txtPlian.Text == ""))
            {
                TotalCost = (NvegMenuCost + vegMenuCost + extraCost + partyCost);
                lblCost.Text = TotalCost.ToString();
            }

            else if ((txtTeaCost.Text != "") && (txtPlian.Text != ""))
            {
                TotalCost = (NvegMenuCost + vegMenuCost + extraCost + partyCost + teaCost + plainTeaCost);
                lblCost.Text = TotalCost.ToString();
            }
        }

       
    }
}