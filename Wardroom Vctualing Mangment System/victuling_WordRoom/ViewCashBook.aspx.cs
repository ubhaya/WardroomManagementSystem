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
    public partial class ViewCashBook : System.Web.UI.Page
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
            ViewSaleMenuItem();
            GetGroupMenuNameList();
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
                command.CommandText = "[VICTULING_GetCashBook]";

                command.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString().Trim());
                command.Parameters.AddWithValue("@date", dateTo.SelectedDate);
           

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport.DataSource = ds.Tables[0];
                grdReport.DataBind();

                //float Ctot = 0F;
                //float Dtot = 0F;
                //for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
                //{
                //    Ctot += float.Parse(ds.Tables[0].Rows[x][4].ToString());
                //    Dtot += float.Parse(ds.Tables[0].Rows[x][3].ToString());
                //}
                //lblTotalCredit.Text = Ctot.ToString();
                //lblTotalDebit.Text = Dtot.ToString();

                //float Dtot = 0F;
                //for (int y = 0; y < ds.Tables[0].Rows.Count; y++)
                //{
                //    Dtot += float.Parse(ds.Tables[0].Rows[y][3].ToString());
                //}
                //lblTotalDebit.Text = Dtot.ToString();

                //lblTotalDebit.Text = tot.ToString();

                con.Close();
            }
            catch (Exception ex) { }
        }

        public void GetGroupMenuNameList()
        {
            string date = dateTo.SelectedDate.ToString();
            string wardroomCode = Session["wardRoomCode"].ToString().Trim();


            dtGetCost = itemObject.GetCashBook(strConnString, date, wardroomCode);

            if (dtGetCost.Rows.Count > 0)
            {
                Session["ss"] = dtGetCost;
                PublishdataData(dtGetCost, date, wardroomCode);
            }
        }


        public void PublishdataData(DataTable one, string date, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx1.Clear();
            xx1 = SearchCostList(date, wardroomCode);

            GetPersonalData(xx1);
        }

        private DataSet SearchCostList(string date, string wardroomCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetCashBook]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = date;
            cmd.Parameters.Add("@wordRoomCode", SqlDbType.VarChar).Value = wardroomCode;


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

                if (0 < (personal.Tables[1].Rows.Count))
                {
                    lblTotalCredit.Text = personal.Tables[1].Rows[0]["totalCredit"].ToString();
                }
                else
                {
                    lblTotalCredit.Text = "0.00";
                }

                if (0 < (personal.Tables[2].Rows.Count))
                {
                    lblTotalDebit.Text = personal.Tables[2].Rows[0]["totalDebit"].ToString();
                }
                else
                {
                    lblTotalDebit.Text = "0.00";
                }

                if (0 < (personal.Tables[3].Rows.Count))
                {
                    lblCashInHand.Text = personal.Tables[3].Rows[0]["cashInHand"].ToString();
                }
                else
                {
                    lblCashInHand.Text = "0.00";
                }


            }
        }

        protected void grdReport_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            update_T_CashBook();
        }

        public void update_T_CashBook()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

         
                try
                {

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_CashBookDetails]";

                    cmd.Parameters.AddWithValue("@date", dateTo.SelectedDate.ToString());
                    cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@description", 1105);
                    cmd.Parameters.AddWithValue("@remarks", "");
                    cmd.Parameters.AddWithValue("@creditDebit", 'D');
                    cmd.Parameters.AddWithValue("@cost", Decimal.Parse(lblCashInHand.Text));
                    cmd.Parameters.AddWithValue("@isAuthorized", 1);
                    cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@createdDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    if (con.State != ConnectionState.Closed)
                    {
                        con.Close();
                    }
                    lblError.Visible = true;

                    lblError.Text = "Authorized Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }
            
        }
    }
}