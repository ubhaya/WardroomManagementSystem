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
    public partial class viewOnChargedItems : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String wardRoomName, wardRoomCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String userName = Session["LOGIN_NAME"].ToString();
                wardRoomName = Session["wardRoomName"].ToString();
                wardRoomCode = Session["wardRoomCode"].ToString();

                txtWardRoom.Text = wardRoomName.ToString();
            }
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            getData();
        }

        public void getData()
        {
            if (txtBillNo.Text != "")
            {
                try
                {
                    //get details to bind data           
                    lblMsg.Text = "";
                    con.Open();
                    SqlCommand command = new SqlCommand();
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    DataSet ds = new DataSet();

                    command.Connection = con;
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "[VICTULING_GetOnChargeItemListForSA]";

                    command.Parameters.AddWithValue("@wardroomCode", wardRoomCode);
                    command.Parameters.AddWithValue("@billNo", txtBillNo.Text.ToString());
                    command.Parameters.AddWithValue("@billingMonth", dateOnCharge.SelectedDate);
                    command.Parameters.AddWithValue("@recevedFrom", cmbBillNo.SelectedItem.Text);

                    adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);

                    grdReport.DataSource = ds.Tables[0];
                    grdReport.DataBind();
                    con.Close();

                    float tot = 0;
                    float netValue = 0;
                    float discount = float.Parse(ds.Tables[1].Rows[0][0].ToString());

                    for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
                    {

                        tot += float.Parse(ds.Tables[0].Rows[x][7].ToString());

                    }

                    netValue = tot - discount;

                    lblGross.Text = tot.ToString();
                    lblDiscount.Text = discount.ToString();
                    lblTot.Text = netValue.ToString();
                    lblTot.ForeColor = System.Drawing.Color.Blue;
                    Label1.Visible = true;
                    lblTot.Visible = true;
                    lblDiscount.Visible = true;
                    Label2.Visible = true;
                    lblGross.Visible = true;
                    Label3.Visible = true;
                }
                catch (Exception ex) { }
            }

            else if (txtBillNo.Text == "")
            {
                try
                {
                    //get details to bind data           
                    lblMsg.Text = "";
                    con.Open();
                    SqlCommand command = new SqlCommand();
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    DataSet ds = new DataSet();

                    command.Connection = con;
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "[VICTULING_GetOnChargeItemListForSA]";

                    command.Parameters.AddWithValue("@wardroomCode", wardRoomCode);
                    command.Parameters.AddWithValue("@billNo", "");
                    command.Parameters.AddWithValue("@billingMonth", dateOnCharge.SelectedDate);

                    adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);

                    grdReport.DataSource = ds.Tables[0];
                    grdReport.DataBind();
                    con.Close();

                    float tot = 0;
                    float netValue = 0;
                    //float discount = float.Parse(ds.Tables[1].Rows[0][0].ToString());

                    for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
                    {

                        tot += float.Parse(ds.Tables[0].Rows[x][7].ToString());

                    }

                    netValue = tot;

                    lblGross.Text = tot.ToString();
                    //lblDiscount.Text = discount.ToString();
                    lblTot.Text = netValue.ToString();
                    lblTot.ForeColor = System.Drawing.Color.Blue;
                    Label1.Visible = true;
                    lblTot.Visible = true;
                    lblDiscount.Visible = true;
                    Label2.Visible = true;
                    lblGross.Visible = true;
                    Label3.Visible = true;
                }
                catch (Exception ex) { }
            }
        }

       

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string code = x["itemCode"].Text.ToString();
                string id = x["itemId"].Text.ToString();
                string billNo = x["billNO"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[T_Stock] WHERE [billNo] = '" + billNo + "' and [itemCode] = '"+code+"' and [itemId] = '"+id+"'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblMsg.Text = "Deletion Success in T_Stock !";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex) { }


                string itemCode = x["itemCode"].Text.ToString();
                string itemId = x["itemId"].Text.ToString();
                string onChargeQty = x["onChargeQty"].Text.ToString();
                //string recFrom = x["recevedFrom"].Text.ToString();
                //string unitPrice = x["unitPrice"].Text.ToString();

                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Delete_T_StockQty_OnCharge]";

                    cmd.Parameters.AddWithValue("@itemCode", itemCode);
                    cmd.Parameters.AddWithValue("@currentStock", onChargeQty);
                    cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

                    cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Deletion Success in T_StockQty !";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }
            }

            getData();
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