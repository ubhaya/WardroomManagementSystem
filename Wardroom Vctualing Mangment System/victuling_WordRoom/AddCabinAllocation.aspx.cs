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
    public partial class AddCabinAllocation : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();

        public static int countval = 0;

        public static string nic = "";
        public static string OS = "";
        public static string nicNo_SSID = "";
        public static string officialNo = "";
        public static string serviceType = "";

        public static DataSet xx = new DataSet();
        public static DataSet xx2 = new DataSet();

        public static DataTable dtArea = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtOfficerSailor = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtBlock = new DataTable();
        public static DataTable dtBranch = new DataTable();
        public static String wardRoomName, wardRoomCode;

        public static DataTable dtRankRate = new DataTable();
        public static DataTable dtselectpersons = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userName = Session["LOGIN_NAME"].ToString();
            wardRoomName = Session["wardRoomName"].ToString();
            wardRoomCode = Session["wardRoomCode"].ToString();

            if (!IsPostBack)
            {
                getInitialData();
              
            }
        }

        public void getInitialData()
        {
            dtArea = itemObject.GetArea(strConnString);
            ddlArea.DataSource = dtArea;

            ddlArea.DataTextField = "areaName";
            ddlArea.DataValueField = "areaName";
            ddlArea.DataBind();

            ddlArea.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

            dtRankRate = itemObject.GetRankRateAll(strConnString);
            ddlRankRate.DataSource = dtRankRate;

            ddlRankRate.DataTextField = "description";
            ddlRankRate.DataValueField = "rankRateCode";
            ddlRankRate.DataBind();

            ddlRankRate.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            ddlRankRate.Items.Insert(1, new RadComboBoxItem("All", "1"));

            dtBlock = itemObject.GetBlockList(strConnString);
            ddlBlockNo.DataSource = dtBlock;

            ddlBlockNo.DataTextField = "blockNo";
            ddlBlockNo.DataValueField = "blockID";
            ddlBlockNo.DataBind();

            ddlBlockNo.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            ddlBlockNo.Items.Insert(1, new RadComboBoxItem("All", "1"));

            dtBranch = itemObject.GetBranchList(strConnString);
            ddlBranch.DataSource = dtBranch;

            ddlBranch.DataTextField = "branchID";
            ddlBranch.DataValueField = "branchCode";
            ddlBranch.DataBind();

            ddlBranch.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            ddlBranch.Items.Insert(1, new RadComboBoxItem("All", "1"));
        }

        protected void ddlArea_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string baseValue = ddlArea.Text;
            DataTable Entrydt1 = tt.GetBase(baseValue, strConnString);
            ddlBase.DataSource = Entrydt1;
            ddlBase.DataTextField = "baseDescription";
            ddlBase.DataValueField = "baseCode";
            ddlBase.DataBind();
        }

        protected void ddlBase_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void ddlRankRate_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
      
        }

        protected void linkOffNoList_Click(object sender, EventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string baseValue = ddlBase.SelectedValue.ToString();
            string rankValue = ddlRankRate.SelectedValue.ToString();
            string branch = ddlBranch.SelectedValue.ToString(); 
            DataTable Entrydt1 = tt.GetOffNoList(strConnString, baseValue, rankValue, branch);
            ddlOffNo.DataSource = Entrydt1;
          
            ddlOffNo.DataTextField = "officialNo";
            ddlOffNo.DataValueField = "officialNo";
            ddlOffNo.DataBind();
            ddlOffNo.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
        }




        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            try
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[VICTULING_Save_T_CabinAllocation]";

                cmd.Parameters.AddWithValue("@blockNo", ddlBlockNo.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@cabinNo", ddlCabinNo.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@cabinTelephoneNo", Convert.ToInt32(txtOfficeNo.Text));
                cmd.Parameters.AddWithValue("@telephoneNo", Convert.ToInt32(txtPersonalNo.Text));
                cmd.Parameters.AddWithValue("@officialNo", ddlOffNo.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@serviceType", ddlServiceType.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@branch", ddlBranch.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@name", lblName.Text);
                cmd.Parameters.AddWithValue("@livingInOut", ddlLivingInOut.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@permanentTemporary", ddlPerTemp.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@isActive", 1);
                cmd.Parameters.AddWithValue("@remarks", txtRemarks.Text);
                cmd.Parameters.AddWithValue("@fromDate", dateFrom.SelectedDate.ToString());
               
                cmd.Parameters.AddWithValue("@createdUser", Session["LOGIN_NAME"].ToString());
                cmd.Parameters.AddWithValue("@craetdDate", System.DateTime.Now);

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                con.Close();
                lblError.Visible = true;

                lblError.Text = "Allocation Success!";
                lblError.ForeColor = System.Drawing.Color.Green;


            }

            catch (Exception ex)
            {
                //lbl_Errormsg.Visible = true;
                //lbl_Errormsg.Text = ex.Message;
            }
        }

        protected void linkCabinList_Click(object sender, EventArgs e)
        {
            CabinAllocation();
        }

        public void CabinAllocation()
        {
            con.Open();
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[VICTULING_GetCabinAllocationListByCabin]";

            command.Parameters.AddWithValue("@blockName", ddlBlockNo.SelectedValue.ToString());
            command.Parameters.AddWithValue("@cabinName", ddlCabinNo.SelectedValue.ToString());


            adapter = new SqlDataAdapter(command);
            adapter.Fill(ds);

            grdReport0.DataSource = ds.Tables[0];

            grdReport0.DataBind();

            con.Close();
        }

        protected void grdReport0_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int strIndex = grdReport0.MasterTableView.CurrentPageIndex;

                Label lbl = e.Item.FindControl("lblSn0") as Label;
                lbl.Text = Convert.ToString((strIndex * grdReport0.PageCount) + e.Item.ItemIndex + 1);
            }
        }

        protected void ddlBlockNo_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string blockValue = ddlBlockNo.SelectedValue.ToString();
            DataTable Entrydt1 = tt.GetCabinList(blockValue, strConnString);
            ddlCabinNo.DataSource = Entrydt1;
            ddlCabinNo.DataTextField = "cabinNo";
            ddlCabinNo.DataValueField = "cabinID";
            ddlCabinNo.DataBind();
        }

        protected void ddlOffNo_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            string offNo = ddlOffNo.SelectedValue.ToString();
            string branch = ddlBranch.SelectedValue.ToString();
            
            DataTable Entrydt1 = tt.GetName(offNo,branch, strConnString);
            lblName.DataSource = Entrydt1;
            lblName.DataTextField = "name";
            lblName.DataValueField = "name";
            lblName.DataBind();
        }

        protected void grdReport0_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                GridDataItem x = (GridDataItem)e.Item;
                string id = x["id"].Text.ToString();

                try
                {
                    string query = "DELETE FROM [dbo].[T_CabinAllocation] WHERE [id] = '" + int.Parse(id) + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblError.Text = "Delete Successfull";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex) { }
            }

            CabinAllocation();
        }

        
    }
}