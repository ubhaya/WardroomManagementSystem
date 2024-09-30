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
    public partial class CreateMenu : System.Web.UI.Page
    {
        public static String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        VICTULING_DLL.AddNewItems.Class1 itemObject = new VICTULING_DLL.AddNewItems.Class1();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtItemList = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable addedItemMenu = new DataTable();

        public static string  itemCode;

       

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["LOGIN_NAME"] = "kal";

            if (!IsPostBack)
            {
                //load data to cmbItemCategory
                getItemCategory();

                //get menu discription
                getMenuReason();
            }
        }
        public void getMenuReason()
        {
            dtMenuReason = itemObject.GetManuReason (strConnString);
            cmbDescription.DataSource = dtMenuReason;

            cmbDescription.DataTextField = "reason";
            cmbDescription.DataValueField = "reasonCode";
            cmbDescription.DataBind();
            cmbDescription.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

        }
        public void getItemCategory() 
        {
            //cmbItemCategory.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            //get ietm main categories
            dtItemCat = itemObject.GetItemCatagory(strConnString);
            cmbItemCategory.DataSource = dtItemCat;

            cmbItemCategory.DataTextField = "itemCatagory";
            cmbItemCategory.DataValueField = "itemCatagoryCode";
            cmbItemCategory.DataBind();
            cmbItemCategory.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));

           
        }

        protected void cmbItemCategory_TextChanged(object sender, EventArgs e)
        {
            lblMassege.Text = "";

            //get item list
            string itemValue = cmbItemCategory.Text;
            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();            
            DataTable Entrydt1 = tt.GetItemByCate(itemValue, strConnString);
            cmbItem.DataSource = Entrydt1;
            cmbItem.DataTextField = "item";
            cmbItem.DataValueField = "itemCode";
            cmbItem.DataBind();
            cmbItem.Items.Insert(0, new RadComboBoxItem("---Select---", "0"));
            
        }

        protected void cmbItem_TextChanged(object sender, EventArgs e)
        {
             itemCode = cmbItem.SelectedValue; ;
            //get currant stock

            VICTULING_DLL.AddNewItems.Class1 tt = new VICTULING_DLL.AddNewItems.Class1();
            DataTable currentStock = tt.GetExcItems(strConnString,itemCode);
            cmbItem.DataSource = currentStock;
            grdCurrantStock.DataSource = currentStock ;
            grdCurrantStock.DataBind();

        }

        protected void grdCurrantStock_ItemCommand(object sender, GridCommandEventArgs e)
        {
            try
            {
                //if (e.CommandName == "addItem")
                //{
                //    GridDataItem x = (GridDataItem)e.Item;
                //    string id = x["Official_No"].Text.ToString();

                //}
            }
            catch (Exception ex) { }
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            ////insert selected menuItem to table
            // DateTime  menuDate = DateTime.Parse(txtDate.SelectedDate.ToString());
            //String menuReason = cmbDescription.SelectedValue;
            //String menuItem = cmbItem.SelectedValue;
            //String curryType = "";
            //String cUser = "";
            //DateTime cDate =  System.DateTime.Now;

            //VICTULING_DLL.AddNewItems.Class1 insertDailyMennuItems = new VICTULING_DLL.AddNewItems.Class1();
            //insertDailyMennuItems.insertDaiyMenu(strConnString,menuDate,menuReason,menuItem,curryType,cUser,cDate);
            

            ////load added menu item to grid view
            //bindgrdAddedMenuItems(menuDate);
            //lblMassege.Text = "Item Added in Menu List";
            //lblMassege.ForeColor = System.Drawing.Color.Green;


        }
        public void bindgrdAddedMenuItems(DateTime menuDate)
        {
            VICTULING_DLL.AddNewItems.Class1 addedMenuItems = new VICTULING_DLL.AddNewItems.Class1();
            //DataTable addedItemMenu = addedMenuItems.GetAddedManuItem(strConnString, menuDate);
            addedItemMenu = addedMenuItems.GetAddedManuItem(strConnString, menuDate);
            grdAddedMenuItems.DataSource = addedItemMenu;
            grdAddedMenuItems.DataSource = addedItemMenu;
            grdAddedMenuItems.DataBind();
        }

        protected void grdAddedMenuItems_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String  itemCode = grdAddedMenuItems .Rows[e.RowIndex].Cells[3].Text;
            DateTime dateMenu = DateTime.Parse( txtDate.SelectedDate.ToString());

            //delete selected Item
            VICTULING_DLL.AddNewItems.Class1 deleteMenuItems = new VICTULING_DLL.AddNewItems.Class1();
            deleteMenuItems.deleteSelectedmenuItem(itemCode, dateMenu);
            bindgrdAddedMenuItems(dateMenu);
           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            for (int i = 0; i < grdAddedMenuItems.Rows.Count; i++)
            {
                try
                {
                    RadTextBox curryType = (RadTextBox)grdAddedMenuItems.Rows[i].FindControl("txtCurryType");
                    

                    if (curryType.Text != "")
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_Update_T_DailyMenu]";

                        cmd.Parameters.AddWithValue("@date", txtDate.SelectedDate.ToString());
                        cmd.Parameters.AddWithValue("@itemCode", cmbItem.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@reasonCode", cmbDescription.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@curryType", curryType.Text);

                        cmd.Parameters.AddWithValue("@lastmodifiedUser", Session["LOGIN_NAME"].ToString());
                        cmd.Parameters.AddWithValue("@lastmodifiedDate", System.DateTime.Now);

                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        con.Close();
                        lblError.Visible = true;

                        lblError.Text = "Add Menu Successfully!";
                        lblError.ForeColor = System.Drawing.Color.Green;


                    }
                }

                catch (Exception ex)
                {
                    //lbl_Errormsg.Visible = true;
                    //lbl_Errormsg.Text = ex.Message;
                }

            }
          }


           
          
      

        protected void update_Click(object sender, EventArgs e)
        {
           
        }
  
    }
}