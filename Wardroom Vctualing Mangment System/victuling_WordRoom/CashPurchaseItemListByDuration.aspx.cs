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
    public partial class CashPurchaseItemListByDuration : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static String wardRoomName, wardRoomCode;
        public static DataTable dtOfficerList = new DataTable();
        public static DataSet xx = new DataSet();


        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            txtWardRoom.Text = Session["wardRoomName"].ToString();

        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetCash309ItemByDuration]";

            command.Parameters.AddWithValue("@type", cmbBillNo.SelectedValue.ToString());
            command.Parameters.AddWithValue("@fromDate", dateFrom.SelectedDate.ToString());
            command.Parameters.AddWithValue("@toDate", dateTo.SelectedDate.ToString());
            command.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport2.DataSource = ds.Tables[0];

            grdReport2.DataBind();

            decimal tot = 0;
            for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
            {
                tot += decimal.Parse(ds.Tables[0].Rows[x][6].ToString());
            }
            lblTot.Text = tot.ToString();
            lblTot.Visible = true;

            con.Close();

            getDiscount();

        }

        public void getDiscount()
        {

            string fromDate = dateFrom.SelectedDate.ToString();
            string toDate = dateTo.SelectedDate.ToString();
            string type = cmbBillNo.SelectedValue.ToString();
            string wardroomCode = wardRoomCode;


            dtOfficerList = itemObject.GetDiscount(strConnString, fromDate, toDate, type, wardroomCode);

            if (dtOfficerList.Rows.Count > 0)
            {
                Session["ss"] = dtOfficerList;
                Publishdata(dtOfficerList, fromDate, toDate, type, wardroomCode);
            }

            cost();
        }

        public void cost()
        {
            double Total = 0.00;
            double Discount = 0.00;
            double returnItem = 0.00;
            double TotalD = 0.00;

            Total = System.Double.Parse(lblTot.Text);
            Discount = System.Double.Parse(lblDiscount.Text);
            returnItem = System.Double.Parse(lblReturn.Text);

            TotalD = (Total - Discount - returnItem);
            lblTotalD.Text = TotalD.ToString();
        }

        public void Publishdata(DataTable one, string fromDate, string toDate, string type, string wardroomCode)
        {

            DataRow row = one.Rows[0];

            xx.Clear();
            xx = GetDiscount(dtOfficerList, fromDate, toDate, type, wardroomCode);

            GetPersonalData(xx);
        }

        //private DataSet SearchNameList(DataTable dtOfficerList, string fromDate, string toDate, string type, string wardroomCode)
        //{
        //    throw new NotImplementedException();
        //}

        private DataSet GetDiscount(DataTable dtOfficerList, string fromDate, string toDate, string type, string wardroomCode)
        {
            SqlDataAdapter sqlda = new SqlDataAdapter();
            DataSet dst = new DataSet();

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();
            //cmd.Parameters.Clear();
            cmd = new SqlCommand("[VICTULING_GetCash309ItemByDuration]", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@type", cmbBillNo.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@fromDate", dateFrom.SelectedDate.ToString());
            cmd.Parameters.AddWithValue("@toDate", dateTo.SelectedDate.ToString());
            cmd.Parameters.AddWithValue("@wardroom", Session["wardRoomCode"].ToString());

            cmd.ExecuteNonQuery();
            sqlda.SelectCommand = cmd;
            sqlda.Fill(dst);
            return dst;
        }

        public void GetPersonalData(DataSet xx)
        {

            DataSet personal = xx;
           

            if (0 < (personal.Tables[1].Rows.Count))
            {
                lblDiscount.Text = personal.Tables[1].Rows[0]["discount"].ToString();
            }
            else
            {
                lblDiscount.Text = "0.00";
            }


            if (0 < (personal.Tables[2].Rows.Count))
            {
                lblReturn.Text = personal.Tables[2].Rows[0]["price"].ToString();
            }
            else
            {
                lblReturn.Text = "0.00";
            }
           
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