
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
    public partial class ViewItemDepreciation845Tea_Ration : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String wardRoomName, wardRoomCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String userName = Session["LOGIN_NAME"].ToString();
                wardRoomName = Session["wardRoomName"].ToString().Trim();
                wardRoomCode = Session["wardRoomCode"].ToString().Trim();
            }
        }

        protected void grdReport_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["depreciationID"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[T_DepreciationItems] WHERE [depreciationID] = '" + int.Parse(id) + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblError.Text = "Delete Successfull";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex) { }


                ////Update T_StockQty table

                string itemCode = x["itemCode"].Text.ToString();
                //string itemId = x["transID"].Text.ToString();
                string qty = x["depreciationQty"].Text.ToString();
                string recFrom = x["recevedFrom"].Text.ToString();
                //string iid = x["itemID"].Text.ToString();
                string unitPrice = x["unitPrice"].Text.ToString();

                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_StockQty_forMenuSale]";

                    cmd.Parameters.AddWithValue("@itemCode", itemCode);
                    cmd.Parameters.AddWithValue("@currentStock", qty);
                    cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());

                    cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Update Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }



                ////Update T_Stock table

                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_Update_T_Stock_forMenuSale]";

                    cmd.Parameters.AddWithValue("@itemCode", itemCode);
                    //cmd.Parameters.AddWithValue("@itemId", iid);
                    cmd.Parameters.AddWithValue("@currentStock", qty);
                    cmd.Parameters.AddWithValue("@unitPrice", unitPrice);
                    cmd.Parameters.AddWithValue("@wordRoomCode", Session["wardRoomCode"].ToString());
                    cmd.Parameters.AddWithValue("@recevedFrom", recFrom);

                    cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                    cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    con.Close();
                    lblError.Visible = true;

                    lblError.Text = "Update Success!";
                    lblError.ForeColor = System.Drawing.Color.Green;


                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }


            }

            ViewSaleMenuItem();

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
                command.CommandText = "[VICTULING_GetDepreciationItemList_OnDate]";

                command.Parameters.AddWithValue("@reasonCode", ddlReason.SelectedValue.ToString());
                command.Parameters.AddWithValue("@depreciationDate", dateSaleDate.SelectedDate);
                command.Parameters.AddWithValue("@wardroomCode", (wardRoomCode.ToString()).Trim());

                adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);

                grdReport.DataSource = ds.Tables[0];
                grdReport.DataBind();

                float tot = 0F;
                for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
                {
                    tot += float.Parse(ds.Tables[0].Rows[x][7].ToString());
                }
                lblTot.Text = tot.ToString();
                Label1.Visible = true;
                lblTot.Visible = true;

                con.Close();
            }
            catch (Exception ex) { }

            }

        protected void RadButton1_Click(object sender, EventArgs e)
        {

            ViewSaleMenuItem();
        }

    public void  ViewSaleMenuItem()
    {
        try
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetDepreciationItemList_OnDate]";

            command.Parameters.AddWithValue("@reason", ddlReason.SelectedValue.ToString());
            command.Parameters.AddWithValue("@onChargeDate", dateSaleDate.SelectedDate);
            command.Parameters.AddWithValue("@wardroomName", (wardRoomCode.ToString()).Trim());

            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport.DataSource = ds.Tables[0];
            grdReport.DataBind();

            float tot = 0F;
            for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
            {
                tot += float.Parse(ds.Tables[0].Rows[x][7].ToString());
            }
            lblTot.Text = tot.ToString();
            Label1.Visible = true;
            lblTot.Visible = true;

            con.Close();
        }
        catch (Exception ex) { }
    }

    }
    }