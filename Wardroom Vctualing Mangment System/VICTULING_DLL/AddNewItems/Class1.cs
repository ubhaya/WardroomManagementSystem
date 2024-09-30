using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections.Specialized;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;

using System.IO;


namespace VICTULING_DLL.AddNewItems
{
    public class Class1
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

        public static DataTable dtItemCode = new DataTable();
        public static DataTable dtMaxItemCode = new DataTable();
        public static DataTable dtmainItem = new DataTable();
        public static DataTable dtItemCat = new DataTable();
        public static DataTable dtItemMes = new DataTable();
        public static DataTable dtWardroom = new DataTable();
        public static DataTable dtGetExItems = new DataTable();
        public static DataTable dtGetSaleItemsQty = new DataTable();
        public static DataTable dtBaseAll = new DataTable();
        public static DataTable dtMenuReason = new DataTable();
        public static DataTable dtintakeData = new DataTable();
        public static DataTable dtWardRoom = new DataTable();
        public static DataTable dtMealCategory = new DataTable();
        public static DataTable dtCurryPrice = new DataTable();
        public static DataTable dtUpdateSportsGrid = new DataTable();
        public static DataTable dtNonVegetarian = new DataTable();
        public static DataTable dtVegetarian = new DataTable();
        public static DataTable dtUpdateMenuItemList = new DataTable();
        public static DataTable dtTotalMenuCost = new DataTable();
        public static DataTable dtView = new DataTable();
        public static DataTable dtVegiView = new DataTable();
        public static DataTable dtTotalIndividualMenuCost = new DataTable();
        public static DataTable dtTotalDepreciationCost = new DataTable();
        public static DataTable dtMenuItemCat = new DataTable();
        public static DataTable dtGetExItemsExtraByCA = new DataTable();
        public static DataTable dtAuthorizedMenu = new DataTable();
        public static DataTable dtGroupMenu = new DataTable();
        public static DataTable dtGroupMenuAll = new DataTable();
        public static DataTable dtGetGroupItemsExtraByCA = new DataTable();
        public static DataTable dtGetFinalGroupItemsExtraByCA = new DataTable();
        public static DataTable dtTeaCount = new DataTable();
        public static DataTable dtAllMealCount = new DataTable();
        public static DataTable dtTotalTea = new DataTable();
        public static DataTable dtFindMaxOffNo = new DataTable();
        public static DataTable dtCivilDetails = new DataTable();
        public static DataTable dtOfficerBasic = new DataTable();
        public static DataTable dtGroupMenuNew = new DataTable();
        public static DataTable dtUpdateGroupItemList = new DataTable();
        public static DataTable dtWrCode = new DataTable();
        public static DataTable dtWrBillNo = new DataTable();
        public static DataTable dtGroupMenuCount = new DataTable();
        public static DataTable dtSalebySA = new DataTable();
        public static DataTable dtGetDeductItems = new DataTable();
        public static DataTable dtArea = new DataTable();
        public static DataTable dtGetExItemsIndividual = new DataTable();
        public static DataTable dtGetSaleItemsQty_Indi = new DataTable();
        public static DataTable dt306Price = new DataTable();
        public static DataTable dtselectpersons = new DataTable();
        public static DataTable dtRankRate = new DataTable();
        public static DataTable dtUpdselectpersons = new DataTable();
        public static DataTable dtOfficerCount = new DataTable();
        public static DataTable dtOffiList = new DataTable();
        public static DataTable dtFinalReco = new DataTable();
        public static DataTable dtBlock = new DataTable();
        public static DataTable dtBranch = new DataTable();
        public static DataTable dtName = new DataTable();
        public static DataTable dtGetNonVegMMEx = new DataTable();
        public static DataTable dtGetGroupMEx = new DataTable();
        public static DataTable dtGetGroupMenuList = new DataTable();
        public static DataTable dtGetIndividualSummary = new DataTable();
        public static DataTable dtGetCost = new DataTable();
        public static DataTable dtselect = new DataTable();
        public static DataTable dtTeaCOunt = new DataTable();
        public static DataTable dtViewBiteOrder = new DataTable();
        
        public static string billNO;
        public static int newBillNumber;

        public System.Data.DataTable GetItemCode(string strConnString, string sportName)
        {
            try
            {

                using (SqlConnection con = new SqlConnection(strConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetItemList]";
                        cmd.Parameters.Add("@item", SqlDbType.VarChar, 150).Value = sportName;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtItemCode.Clear();
                        da.Fill(dtItemCode);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtItemCode;
        }

        public DataTable GetPersonsBaseVise(string ConnString, string sbase, string srank)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_Get_BaseVisePersons]";
                        cmd.Parameters.Add("@base", SqlDbType.VarChar, 255).Value = sbase;
                        cmd.Parameters.Add("@rank", SqlDbType.VarChar, 255).Value = srank;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtselectpersons.Clear();
                        da.Fill(dtselectpersons);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtselectpersons;
        }

        public DataSet FindMaxItemCode(string ConnString)
        {
            DataSet dtMaxItemCode = new DataSet();
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[HRIS_MaxItem_Code]";
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtMaxItemCode.Clear();
                        da.Fill(dtMaxItemCode);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtMaxItemCode;
        }

        public DataSet FindMaxIOffNo(string ConnString)
        {
            DataSet dtFindMaxOffNo = new DataSet();
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_officialNo]";
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtFindMaxOffNo.Clear();
                        da.Fill(dtFindMaxOffNo);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtFindMaxOffNo;
        }


        public DataTable GetMainItem(string ConnString)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_GetMainItem]";

                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtmainItem.Clear();
                    da.Fill(dtmainItem);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtmainItem;
        }

        public DataTable GetItemCatagory(string ConnString)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_GetItemByCatagory]";

                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtItemCat.Clear();
                    da.Fill(dtItemCat);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtItemCat;
        }

        public DataTable GetItemMessurment(string ConnString)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_GetItemMessurment]";

                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtItemMes.Clear();
                    da.Fill(dtItemMes);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtItemMes;
        }


        public DataTable GetWardroom(string ConnString)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_GetWardroom]";

                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtWardroom.Clear();
                    da.Fill(dtWardroom);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtWardroom;
        }


        public DataTable GetGroupMenu(string ConnString)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_GetGroupMenu]";

                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtGroupMenuNew.Clear();
                    da.Fill(dtGroupMenuNew);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtGroupMenuNew;
        }

        public DataTable GetItemByCate(string v1, string strConnStrings)
        {
            SqlParameter param;
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            using (SqlConnection con = new SqlConnection(strConnStrings))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_GetItemsByCategory]";
                    param = new SqlParameter("@mainItem", v1);
                    param.Direction = ParameterDirection.Input;
                    param.DbType = DbType.String;
                    cmd.Parameters.Add(param);

                    con.Open();
                    da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            return dt;
        }



        //public DataTable GetBillNoByDate(string v1, string v2, string v3, string v4, string strConnStrings)
        //{
        //    SqlParameter param;
        //    DataTable dt = new DataTable();
        //    SqlDataAdapter da;
        //    using (SqlConnection con = new SqlConnection(strConnStrings))
        //    {
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = con;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = "[VICTULING_GetItemListByDate]";
        //            param = new SqlParameter("@saleDate", v1);
        //            param = new SqlParameter("@wardroomCode", v2);
        //            param = new SqlParameter("@offNo", v3);
        //            param = new SqlParameter("@serviceType", v4);
        //            param.Direction = ParameterDirection.Input;
        //            param.DbType = DbType.String;
        //            cmd.Parameters.Add(param);

        //            con.Open();
        //            da = new SqlDataAdapter(cmd);
        //            da.Fill(dt);
        //        }
        //    }
        //    return dt;
        //}

        public DataTable GetBillNoByDate(string saleDate,string wardroomCode,  string offNo, string serviceType, string ConnString)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetItemListByDate]";
                        cmd.Parameters.Add("@saleDate", SqlDbType.VarChar, 255).Value = saleDate;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 255).Value = wardroomCode;
                        cmd.Parameters.Add("@offNo", SqlDbType.VarChar, 255).Value = offNo;
                        cmd.Parameters.Add("@serviceType", SqlDbType.VarChar, 255).Value = serviceType;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtselect.Clear();
                        da.Fill(dtselect);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtselect;
        }


        public DataTable GetItemByCateIngredients(string v1, string strConnStrings)
        {
            SqlParameter param;
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            using (SqlConnection con = new SqlConnection(strConnStrings))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_GetItemsByCategory_Ingredients]";
                    param = new SqlParameter("@mainItem", v1);
                    param.Direction = ParameterDirection.Input;
                    param.DbType = DbType.String;
                    cmd.Parameters.Add(param);

                    con.Open();
                    da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            return dt;
        }

        public DataTable GetMessurment(string v1, string strConnStrings)
        {
            SqlParameter param;
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            using (SqlConnection con = new SqlConnection(strConnStrings))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_getMessurment]";
                    param = new SqlParameter("@itemCode", v1);
                    param.Direction = ParameterDirection.Input;
                    param.DbType = DbType.String;
                    cmd.Parameters.Add(param);

                    con.Open();
                    da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            return dt;
        }

        public DataTable GetExcItems(string ConnString, string sport)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.CommandText = "[VICTULING_GetExcistingStockItems]";
                        cmd.CommandText = "[VICTULING_GetExcistingStockItems_New1]";

                        cmd.Parameters.Add("@itemCode", SqlDbType.VarChar, 100).Value = sport;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetExItems.Clear();
                        da.Fill(dtGetExItems);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetExItems;
        }

        public DataTable GetExcItemsIndividual(string ConnString, string sport)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetExcistingStockItems]";
                        //cmd.CommandText = "[VICTULING_GetExcistingStockItems_New1]";

                        cmd.Parameters.Add("@itemCode", SqlDbType.VarChar, 100).Value = sport;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetExItemsIndividual.Clear();
                        da.Fill(dtGetExItemsIndividual);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetExItemsIndividual;
        }

        public DataTable GetSaleItemsQty(string ConnString, string itemCode, string saleQty, string itemId)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetCurrentStock]";

                        cmd.Parameters.Add("@itemCode", SqlDbType.VarChar, 100).Value = itemCode;
                        cmd.Parameters.Add("@saleQty", SqlDbType.VarChar, 100).Value = saleQty;
                        cmd.Parameters.Add("@itemId", SqlDbType.VarChar, 100).Value = itemId;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetSaleItemsQty.Clear();
                        da.Fill(dtGetSaleItemsQty);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetSaleItemsQty;
        }

        public DataTable GetSaleItemsQty_Individual(string ConnString, string itemCode, string saleQty)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetCurrentStock_Individual]";

                        cmd.Parameters.Add("@itemCode", SqlDbType.VarChar, 100).Value = itemCode;
                        cmd.Parameters.Add("@saleQty", SqlDbType.VarChar, 100).Value = saleQty;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetSaleItemsQty_Indi.Clear();
                        da.Fill(dtGetSaleItemsQty_Indi);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetSaleItemsQty_Indi;
        }

        public DataTable GetAllOfficerDetails(string ConnString, string OSType, string Off)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "HRIS_Search_GetAllDetailsForVICTULLING";
                        cmd.Parameters.Add("@off", SqlDbType.VarChar, 250).Value = Off;
                        //cmd.Parameters.Add("@sevtype", SqlDbType.VarChar, 250).Value = ServiceType;
                        cmd.Parameters.Add("@off_sailor", SqlDbType.VarChar, 250).Value = OSType;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtintakeData.Clear();
                        da.Fill(dtintakeData);
                        con.Close();
                        con.Dispose();
                    }
                   
                }
            }
            catch (Exception ex)
            {

            }
            return dtintakeData;
        }

        public DataTable GetAllMonthlyTeaCount(string ConnString, string reason, string year, string month, string wardroomName)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetTeaRetion_ForMonth]";
                        cmd.Parameters.Add("@reason", SqlDbType.VarChar, 250).Value = reason;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@month", SqlDbType.VarChar, 250).Value = month;
                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomName;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtTeaCOunt.Clear();
                        da.Fill(dtTeaCOunt);
                        con.Close();
                        con.Dispose();
                    }

                }
            }
            catch (Exception ex)
            {

            }
            return dtTeaCOunt;
        }

        public DataTable GetOfficerDefaults(string ConnString, string OSType, string ServiceType, string Off)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "GetAllDetails";
                        cmd.Parameters.Add("@officialNo", SqlDbType.VarChar, 250).Value = Off;
                        cmd.Parameters.Add("@serviceType", SqlDbType.VarChar, 250).Value = ServiceType;
                        cmd.Parameters.Add("@OS", SqlDbType.VarChar, 250).Value = OSType;
                        object objValue3 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtOfficerBasic.Clear();
                        da.Fill(dtOfficerBasic);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtOfficerBasic;
        }


        public DataTable GetAllCivilDetails(string ConnString, string ServiceType, string Off)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "HRIS_Search_GetAllCivilDetails";
                        cmd.Parameters.Add("@off", SqlDbType.VarChar, 250).Value = Off;
                        cmd.Parameters.Add("@sevtype", SqlDbType.VarChar, 250).Value = ServiceType;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtCivilDetails.Clear();
                        da.Fill(dtCivilDetails);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtCivilDetails;
        }


        public DataTable GetAllBase(string ConnString2)
        {
            using (SqlConnection con = new SqlConnection(ConnString2))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.CommandText = "[HRIS_PersonalRecord_BaseAll]";
                    cmd.CommandText = "[HRIS_PersonalRecord_BaseAll]";
                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtBaseAll.Clear();
                    da.Fill(dtBaseAll);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtBaseAll;
        }


   
        public DataTable GetManuReason(String ConnString)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_getItemReason]";

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtMenuReason.Clear();
                        da.Fill(dtMenuReason);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtMenuReason;
        }

       
        public void insertDaiyMenu(String ConnString, DateTime date, String reasonCode, String itemCode, String curryType, String wardroom, String cUser, DateTime cDate)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_Save_DailyMenuItems]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 100).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 100).Value = reasonCode;
                        cmd.Parameters.Add("@itemCode", SqlDbType.VarChar, 100).Value = itemCode;
                        cmd.Parameters.Add("@curryType", SqlDbType.VarChar, 100).Value = curryType;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = wardroom;
                        cmd.Parameters.Add("@createdUser", SqlDbType.VarChar, 100).Value = cUser;
                        cmd.Parameters.Add("@createdDate", SqlDbType.VarChar, 100).Value = cDate;



                        cmd.ExecuteNonQuery();
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }

        }


       
        public DataTable GetAddedManuItem(string ConnString, DateTime menuDate)
        {
            DataTable addedMenuItem = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_getAddedMenuItem]";
                        cmd.Parameters.Add("@menuDate", SqlDbType.VarChar, 100).Value = menuDate;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        addedMenuItem.Clear();
                        da.Fill(addedMenuItem);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return addedMenuItem;
        }

        
        public void deleteSelectedmenuItem(string itemCode, DateTime date)
        {
            string sql = "DELETE FROM [T_DailyMenu] WHERE itemCode = '" + itemCode + "' and date = '" + date + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex) { }

        }

       
        public void updateCuttyType(string itemCode, DateTime date, String type)
        {
            string sql = "Update [T_DailyMenu]  set curryType = '" + type + "' WHERE itemCode = '" + itemCode + "' and date = '" + date + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex) { }

        }

    
        public DataTable GetWardRoom(string ConnString)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetWardroom]";

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtWardRoom.Clear();
                        da.Fill(dtWardRoom);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtWardRoom;
        }

        
        public DataTable GetMealCategory(String ConnString)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_getMealCategory]";

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtMealCategory.Clear();
                        da.Fill(dtMealCategory);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtMealCategory;
        }

        public DataTable GetMealPrice(String ConnString,string item)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_get_Curry_Price]";

                        cmd.Parameters.AddWithValue("@item",item.ToString());
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtCurryPrice.Clear();
                        da.Fill(dtCurryPrice);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtCurryPrice;
        }

        public DataTable GetMealItemByCate(string v1, string strConnStrings)
        {
            SqlParameter param;
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            using (SqlConnection con = new SqlConnection(strConnStrings))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_getMealItems]";
                    //cmd.Parameters.Add("@mainItemCategoryCode", SqlDbType.VarChar, 150).Value = v1;
                    param = new SqlParameter("@mainItemCategoryCode", v1);
                    param.Direction = ParameterDirection.Input;
                    param.DbType = DbType.String;
                    cmd.Parameters.Add(param);

                    con.Open();
                    da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            return dt;
        }

        public DataTable GetMenu(string strConnStrings, string MenuDate, string Description, string Wardroom, string GroupMenu)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(strConnStrings))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindDailyMenu]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 50).Value = MenuDate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 150).Value = Description;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = Wardroom;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 100).Value = GroupMenu;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtUpdateSportsGrid.Clear();
                        da.Fill(dtUpdateSportsGrid);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtUpdateSportsGrid;
        }


        public DataTable GetMenuBite(string strConnStrings, string MenuDate, string Description, string Wardroom, string GroupMenu)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(strConnStrings))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindDailyMenu_bite]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 50).Value = MenuDate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 150).Value = Description;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = Wardroom;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 100).Value = GroupMenu;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtUpdateSportsGrid.Clear();
                        da.Fill(dtUpdateSportsGrid);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtUpdateSportsGrid;
        }

        public DataTable GetPartyList(string strConnStrings, string MenuDate, string Description, string Wardroom, string GroupMenu)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(strConnStrings))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindParty]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 50).Value = MenuDate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 150).Value = Description;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = Wardroom;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 100).Value = GroupMenu;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtUpdateSportsGrid.Clear();
                        da.Fill(dtUpdateSportsGrid);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtUpdateSportsGrid;
        }

        public DataTable GetBiteList(string strConnStrings, string MenuDate, string Description, string Wardroom, string GroupMenu)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(strConnStrings))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindDailyMenu]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 50).Value = MenuDate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 150).Value = Description;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = Wardroom;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 100).Value = GroupMenu;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtUpdateSportsGrid.Clear();
                        da.Fill(dtUpdateSportsGrid);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtUpdateSportsGrid;
        }

        public DataTable GetRankRateAll(string ConnString)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[HRIS_PersonalRecord_rankRateByOfficer]";

                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtRankRate.Clear();
                    da.Fill(dtRankRate);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtRankRate;
        }

        public DataTable GetBlockList(string ConnString)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_GetBlockList]";

                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtBlock.Clear();
                    da.Fill(dtBlock);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtBlock;
        }

        public DataTable GetBranchList(string ConnString)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_GetBranchList]";

                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtBranch.Clear();
                    da.Fill(dtBranch);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtBranch;
        }

        public DataTable GetUpdatePersonsBaseVise(string ConnString, string sbase, string srank, string mealDate, string reason, string groupMenuCode)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_Get_UpdateBaseVisePersons]";
                        cmd.Parameters.Add("@base", SqlDbType.VarChar, 255).Value = sbase;
                        cmd.Parameters.Add("@rank", SqlDbType.VarChar, 255).Value = srank;
                        cmd.Parameters.Add("@mealDate", SqlDbType.VarChar, 255).Value = mealDate;
                        cmd.Parameters.Add("@reason", SqlDbType.VarChar, 255).Value = reason;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 255).Value = groupMenuCode;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtUpdselectpersons.Clear();
                        da.Fill(dtUpdselectpersons);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtUpdselectpersons;
        }

        public DataTable GetGroupMenu(string strConnStrings, string MenuDate, string Description, string Wardroom, string GroupMenu)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(strConnStrings))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindDailyGroupMenu]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 50).Value = MenuDate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 150).Value = Description;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = Wardroom;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 100).Value = GroupMenu;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtUpdateSportsGrid.Clear();
                        da.Fill(dtUpdateSportsGrid);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtUpdateSportsGrid;
        }

        public DataTable GetGroupMenu(string strConnStrings, string MenuDate, string Description, string Wardroom)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(strConnStrings))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindGroupMenu]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 50).Value = MenuDate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 150).Value = Description;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = Wardroom;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGroupMenu.Clear();
                        da.Fill(dtGroupMenu);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGroupMenu;
        }

        public DataTable GetGroupMenuAll(string strConnStrings, string MenuDate, string Description, string Wardroom)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(strConnStrings))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindGroupMenuAttendance]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 50).Value = MenuDate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 150).Value = Description;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = Wardroom;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGroupMenuAll.Clear();
                        da.Fill(dtGroupMenuAll);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGroupMenuAll;
        }

        public DataTable GetAuthorizedMenu(string strConnStrings, string val, string Description, string wardRoomCode, string gropMenu, string Veg)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(strConnStrings))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindDailyAuthorizedMenu]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 50).Value = val;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 150).Value = Description;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = wardRoomCode;
                        cmd.Parameters.Add("@groupMenu", SqlDbType.VarChar, 100).Value = gropMenu;
                        cmd.Parameters.Add("@Veg", SqlDbType.VarChar, 100).Value = Veg;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtAuthorizedMenu.Clear();
                        da.Fill(dtAuthorizedMenu);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtAuthorizedMenu;
        }


        public DataTable GetNonVegiCount(string ConnString, string date, string reasonCode, string wardroomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetMealAttendanceCount_NonVegetarian]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtNonVegetarian.Clear();
                        da.Fill(dtNonVegetarian);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtNonVegetarian;
        }


        public DataTable GetGroupMenuCount(string ConnString, string date, string reasonCode, string wardroomCode, string groupMenuCode,string vegNonVeg)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetGroupMealAttendanceCount]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 250).Value = groupMenuCode;
                        cmd.Parameters.Add("@vegNonVeg", SqlDbType.VarChar, 250).Value = vegNonVeg;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGroupMenuCount.Clear();
                        da.Fill(dtGroupMenuCount);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGroupMenuCount;
        }

        public DataTable GetVegiCount(string ConnString, string date, string reasonCode, string wardroomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetMealAttendanceCount_Vegetarian]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtVegetarian.Clear();
                        da.Fill(dtVegetarian);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtVegetarian;
        }

        public DataTable GetMenuItemList(string strConnStrings, string MenuDate, string Description, string Wardroom, string vegi)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(strConnStrings))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindDailyMenuItem]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 50).Value = MenuDate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 150).Value = Description;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = Wardroom;
                        cmd.Parameters.Add("@vegi", SqlDbType.VarChar, 100).Value = vegi;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtUpdateMenuItemList.Clear();
                        da.Fill(dtUpdateMenuItemList);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtUpdateMenuItemList;
        }

        public DataTable GetGroupItemList(string strConnStrings, string MenuDate, string Description, string Wardroom, string groupTypeCode)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(strConnStrings))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindGroupMenuItem]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 50).Value = MenuDate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 150).Value = Description;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = Wardroom;
                        cmd.Parameters.Add("@groupTypeCode", SqlDbType.VarChar, 100).Value = groupTypeCode;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtUpdateGroupItemList.Clear();
                        da.Fill(dtUpdateGroupItemList);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtUpdateGroupItemList;
        }

        public DataTable GetTotalMenuCostParty(string ConnString, string date, string reasonCode, string wardroomCode, string vegi, string menuType)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetTotalMenuCost_Party]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@vegi", SqlDbType.VarChar, 250).Value = vegi;
                        cmd.Parameters.Add("@menuType", SqlDbType.VarChar, 250).Value = menuType;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtTotalMenuCost.Clear();
                        da.Fill(dtTotalMenuCost);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtTotalMenuCost;
        }

        public DataTable GetAreaOfficerCount(string ConnString, string area)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetPartContributionHeadCount]";
                        cmd.Parameters.Add("@areaCode", SqlDbType.VarChar, 250).Value = area;
                        

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtOfficerCount.Clear();
                        da.Fill(dtOfficerCount);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtOfficerCount;
        }

        public DataTable GetTotalMenuCost(string ConnString, string date, string reasonCode, string wardroomCode, string vegi)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetTotalMenuCost]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@vegi", SqlDbType.VarChar, 250).Value = vegi;
                        

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtTotalMenuCost.Clear();
                        da.Fill(dtTotalMenuCost);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtTotalMenuCost;
        }

        public DataTable GetTotalGroupMenuCost(string ConnString, string date, string reasonCode, string wardroomCode, string vegi,string groupCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetTotalMenuCost_Group]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@vegi", SqlDbType.VarChar, 250).Value = vegi;
                        cmd.Parameters.Add("@groupMenue", SqlDbType.VarChar, 250).Value = groupCode;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtTotalMenuCost.Clear();
                        da.Fill(dtTotalMenuCost);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtTotalMenuCost;
        }

        public DataTable GetCount(string ConnString, string date, string reasonCode, string wardroomCode, string groupType)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetMenuCost]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@groupType", SqlDbType.VarChar, 250).Value = groupType;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtView.Clear();
                        da.Fill(dtView);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtView;
        }

        //public DataTable GetRankRateAll(string ConnString)
        //{
        //    using (SqlConnection con = new SqlConnection(ConnString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand())
        //        {

        //            con.Open();
        //            cmd.Connection = con;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = "[HRIS_PersonalRecord_rankRateByOfficer]";

        //            object objValue2 = (cmd.ExecuteScalar());
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            dtRankRate.Clear();
        //            da.Fill(dtRankRate);
        //            con.Close();
        //            con.Dispose();

        //        }
        //    }

        //    return dtRankRate;
        //}

        public DataTable GetVegitaCount(string ConnString, string date, string reasonCode, string wardroomCode, string groupType)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetMenuCostVegetarian]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@groupType", SqlDbType.VarChar, 250).Value = groupType;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtVegiView.Clear();
                        da.Fill(dtVegiView);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtVegiView;
        }

        public DataTable GetTotalMenuCostIndividual(string ConnString, string officialNo, string os, string year, string month, string wardroomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetTotalIndividualMealCost]";
                        cmd.Parameters.Add("@officialNo", SqlDbType.VarChar, 250).Value = officialNo;
                        cmd.Parameters.Add("@officerSailor", SqlDbType.VarChar, 250).Value = os;
                        ////cmd.Parameters.Add("@serviceType", SqlDbType.VarChar, 250).Value = serviceType;
                    
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@month", SqlDbType.VarChar, 250).Value = month;
                        cmd.Parameters.Add("@wardroom", SqlDbType.VarChar, 250).Value = wardroomCode;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtTotalIndividualMenuCost.Clear();
                        da.Fill(dtTotalIndividualMenuCost);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtTotalIndividualMenuCost;
        }

        public DataTable GetTotalDepreciationCost(string ConnString, string date, string reasonCode, string wardroomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetTotalDepreciationCost]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtTotalDepreciationCost.Clear();
                        da.Fill(dtTotalDepreciationCost);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtTotalDepreciationCost;
        }

        public DataTable GetMenuItemCatagory(string ConnString)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[VICTULING_GetMainItemCategory]";

                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtMenuItemCat.Clear();
                    da.Fill(dtMenuItemCat);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtMenuItemCat;
        }



        public System.Data.DataTable GetMenuItemCatagory(string strConnString, string sportName)
        {
            try
            {

                using (SqlConnection con = new SqlConnection(strConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetMenuItemList]";
                        cmd.Parameters.Add("@item", SqlDbType.VarChar, 150).Value = sportName;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtItemCode.Clear();
                        da.Fill(dtItemCode);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtItemCode;
        }

        public DataSet FindMaxMenuItemCode(string ConnString)
        {
            DataSet dtMaxMenuItemCode = new DataSet();
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[HRIS_MaxMenuItem_Code]";
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtMaxMenuItemCode.Clear();
                        da.Fill(dtMaxMenuItemCode);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtMaxMenuItemCode;
        }


        public DataTable GetExcItemsExtraByCA(string ConnString, string sdate, string reasonCode, string wardroomCode)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindIndividualExtraItemByCA]";

                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 100).Value = sdate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 100).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = wardroomCode;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetExItemsExtraByCA.Clear();
                        da.Fill(dtGetExItemsExtraByCA);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetExItemsExtraByCA;
        }


        public DataTable GetGroupMenuItemsExtraByCA(string ConnString, string sdate, string reasonCode, string wardroomCode)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindGroupMenuItemByCA]";

                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 100).Value = sdate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 100).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = wardroomCode;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetGroupItemsExtraByCA.Clear();
                        da.Fill(dtGetGroupItemsExtraByCA);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetGroupItemsExtraByCA;
        }

        public DataTable GetFinalGroupMenuItemsExtraByCA(string ConnString, string sdate, string reasonCode, string wardroomCode)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAndBindFinalGroupMenuItemByCA]";

                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 100).Value = sdate;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 100).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 100).Value = wardroomCode;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetFinalGroupItemsExtraByCA.Clear();
                        da.Fill(dtGetFinalGroupItemsExtraByCA);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetFinalGroupItemsExtraByCA;
        }

        public DataTable GetTeaCount(string ConnString, string date, string wardroomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetTeaCount]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtTeaCount.Clear();
                        da.Fill(dtTeaCount);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtTeaCount;
        }

        public DataTable GetAllMealCount(string ConnString, string date, string wardroomCode, string reason)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetAllMealAttendanceCount]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reason;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtAllMealCount.Clear();
                        da.Fill(dtAllMealCount);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtAllMealCount;
        }

        public DataTable GetTotalTeaCost(string ConnString, string year, string month, string wardroomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetMonthlyTea]";
                 
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@month", SqlDbType.VarChar, 250).Value = month;
                        cmd.Parameters.Add("@wardroom", SqlDbType.VarChar, 250).Value = wardroomCode;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtTotalTea.Clear();
                        da.Fill(dtTotalTea);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtTotalTea;
        }

     
        public string GetbillCode(string ConnString, string wardroomCode)
        {
            string billNO = "";
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_getWardRoomNameCode]";
                        cmd.Parameters.Add("@wardRoomCode", wardroomCode);

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtWrCode.Clear();
                        da.Fill(dtWrCode);

                        con.Close();
                        con.Dispose();

                        string wardRoomNameCode = dtWrCode.Rows[0][0].ToString();
                        int billCode = createBillCode(ConnString, wardRoomNameCode);
                        int newBillNumber = billCode + 1;
                        billNO = wardRoomNameCode + "/" + newBillNumber.ToString();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return billNO;
        }

        public int createBillCode(string ConnString, string wardroomnameCode)
        {

            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_getMaxBillNumber]";
                        cmd.Parameters.Add("@wardRoomNameCode", wardroomnameCode);

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtWrBillNo.Clear();
                        da.Fill(dtWrBillNo);

                        newBillNumber = int.Parse(dtWrBillNo.Rows[0][0].ToString());
                        // string billCode = createBillCode(wardRoomNameCode);
                        //newBillNumber = int.Parse(billCode) + 1;
                        //billNO = wardRoomNameCode + "/" + newBillNumber.ToString();
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return newBillNumber;
        }

        public DataTable GetSalebySA(string ConnString, string date, string reasonCode, string wardroomCode, string noOfPerson, string vegiNonVegi, string groupMenuCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_getIngredientsListForSA_Tot]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@noOfPerson", SqlDbType.VarChar, 250).Value = noOfPerson;
                        cmd.Parameters.Add("@vegiNonVegi", SqlDbType.VarChar, 250).Value = vegiNonVegi;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 250).Value = groupMenuCode;

        

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtSalebySA.Clear();
                        da.Fill(dtSalebySA);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtSalebySA;
        }


        public DataTable GetPartyTotalIng(string ConnString, string date, string reasonCode, string wardroomCode, string vegiNonVegi, string groupMenuCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_getTotalIngredientsListForParty]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@vegiNonVegi", SqlDbType.VarChar, 250).Value = vegiNonVegi;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 250).Value = groupMenuCode;



                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtSalebySA.Clear();
                        da.Fill(dtSalebySA);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtSalebySA;
        }

        public DataTable GetBiteTotalIng(string ConnString, string date, string reasonCode, string wardroomCode, string vegiNonVegi, string groupMenuCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_getTotalIngredientsListForBiteOrder]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@vegiNonVegi", SqlDbType.VarChar, 250).Value = vegiNonVegi;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 250).Value = groupMenuCode;



                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtSalebySA.Clear();
                        da.Fill(dtSalebySA);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtSalebySA;
        }

        public DataTable GetFinalRecovery(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                       
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.CommandText = "[VICTULING_GetAllMonthlyRecovery_DinnigAndWine]";
                        cmd.CommandText = "[VICTULING_GetAllMonthlyRecovery_DinnigAndWine_1]";

                        cmd.Parameters.Add("@wardroom", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@month", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[1];
        }

        public DataTable GetFinalRecovery_Pay(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.CommandText = "[VICTULING_GetAllMonthlyRecovery_DinnigAndWine]";
                        cmd.CommandText = "[VICTULING_GetFinalMonthlyRecovery_DinnigAndWine]";

                        cmd.Parameters.Add("@wardroom", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@month", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[0];
        }

        public DataTable GetDailyItemSummaryMenue(string ConnString, string wardroomCode, string selectdate)
        {

            DataSet dst1 = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_DailySaleSummery]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@saleDate", SqlDbType.VarChar, 250).Value = selectdate;


                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst1);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst1.Tables[0];
        }

        public DataTable GetDailyItemSummaryMenue_withPrice(string ConnString, string wardroomCode, string selectdate)
        {

            DataSet dst1 = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_DailySaleSummery_price]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@saleDate", SqlDbType.VarChar, 250).Value = selectdate;


                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst1);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst1.Tables[0];
        }


        public DataTable GetDailyItemSummaryExtra(string ConnString, string wardroomCode, string selectdate)
        {

            DataSet dst1 = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_DailySaleSummery]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@saleDate", SqlDbType.VarChar, 250).Value = selectdate;


                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst1);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst1.Tables[1];
        }

        public DataTable GetDailyItemSummaryExtra_withPrice(string ConnString, string wardroomCode, string selectdate)
        {

            DataSet dst1 = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_DailySaleSummery_price]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@saleDate", SqlDbType.VarChar, 250).Value = selectdate;


                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst1);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst1.Tables[1];
        }

        public DataTable GetDailyItemSummaryParty(string ConnString, string wardroomCode, string selectdate)
        {

            DataSet dst1 = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_DailySaleSummery]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@saleDate", SqlDbType.VarChar, 250).Value = selectdate;


                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst1);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst1.Tables[2];
        }

        public DataTable GetDailyItemSummaryParty_withPrice(string ConnString, string wardroomCode, string selectdate)
        {

            DataSet dst1 = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_DailySaleSummery_price]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@saleDate", SqlDbType.VarChar, 250).Value = selectdate;


                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst1);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst1.Tables[2];
        }

        public DataTable GetDailyItemSummaryDepreciation(string ConnString, string wardroomCode, string selectdate)
        {

            DataSet dst1 = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_DailySaleSummery]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@saleDate", SqlDbType.VarChar, 250).Value = selectdate;


                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst1);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst1.Tables[3];
        }

        public DataTable GetDailyItemSummaryDepreciation_withPrice(string ConnString, string wardroomCode, string selectdate)
        {

            DataSet dst1 = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_DailySaleSummery_price]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@saleDate", SqlDbType.VarChar, 250).Value = selectdate;


                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst1);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst1.Tables[3];
        }

        public DataTable GetDeductItems(string ConnString, string date, string wardroom, string reason, string menuType, string vegNveg)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetExcistingStockItems_New1]";

                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 100).Value = date;
                        cmd.Parameters.Add("@wardroom", SqlDbType.VarChar, 100).Value = wardroom;
                        cmd.Parameters.Add("@reason", SqlDbType.VarChar, 100).Value = reason;
                        cmd.Parameters.Add("@menuType", SqlDbType.VarChar, 100).Value = menuType;
                        cmd.Parameters.Add("@vegNveg", SqlDbType.VarChar, 100).Value = vegNveg;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetDeductItems.Clear();
                        da.Fill(dtGetDeductItems);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetDeductItems;
        }

        public DataTable GetDeductItems_Group(string ConnString, string date, string wardroom, string reason, string menuType, string vegNveg)
        {
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetExcistingStockItems_New1_Group]";

                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 100).Value = date;
                        cmd.Parameters.Add("@wardroom", SqlDbType.VarChar, 100).Value = wardroom;
                        cmd.Parameters.Add("@reason", SqlDbType.VarChar, 100).Value = reason;
                        cmd.Parameters.Add("@menuType", SqlDbType.VarChar, 100).Value = menuType;
                        cmd.Parameters.Add("@vegNveg", SqlDbType.VarChar, 100).Value = vegNveg;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetDeductItems.Clear();
                        da.Fill(dtGetDeductItems);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetDeductItems;
        }

        public DataTable GetArea(string ConnString)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[HRIS_PersonalRecord_Area]";

                    object objValue2 = (cmd.ExecuteScalar());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    dtArea.Clear();
                    da.Fill(dtArea);
                    con.Close();
                    con.Dispose();

                }
            }

            return dtArea;
        }

        public DataTable GetBase(string v1, string strConnStrings)
        {
            SqlParameter param;
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            using (SqlConnection con = new SqlConnection(strConnStrings))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "HRIS_PersonalRecord_Base";
                    param = new SqlParameter("@areaName", v1);
                    param.Direction = ParameterDirection.Input;
                    param.DbType = DbType.String;
                    cmd.Parameters.Add(param);

                    con.Open();
                    da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    con.Close();
                }
            }
            return dt;
        }

        public DataTable GetCabinList(string v1, string strConnStrings)
        {
            SqlParameter param;
            DataTable dtCabin = new DataTable();
            SqlDataAdapter da;
            using (SqlConnection con = new SqlConnection(strConnStrings))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "VICTULING_GetCabinList";
                    param = new SqlParameter("@blockName", v1);
                    param.Direction = ParameterDirection.Input;
                    param.DbType = DbType.String;
                    cmd.Parameters.Add(param);

                    con.Open();
                    da = new SqlDataAdapter(cmd);
                    da.Fill(dtCabin);
                    con.Close();
                }
            }
            return dtCabin;
        }


        //public DataTable GetName(string v1, string v2, string strConnStrings)
        //{
        //    SqlParameter param;
        //    DataTable dtName = new DataTable();
        //    SqlDataAdapter da;
        //    using (SqlConnection con = new SqlConnection(strConnStrings))
        //    {
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = con;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = "VICTULING_Get_NameByOffNo";
        //            param = new SqlParameter("@offNo", v1);
        //            param = new SqlParameter("@branch", v2);
        //            param.Direction = ParameterDirection.Input;
        //            param.DbType = DbType.String;
        //            cmd.Parameters.Add(param);

        //            con.Open();
        //            da = new SqlDataAdapter(cmd);
        //            da.Fill(dtName);
        //            con.Close();
        //        }
        //    }
        //    return dtName;
        //}

        public DataTable GetName(string offNo, string branch,string strConnString)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "VICTULING_Get_NameByOffNo";

                        cmd.Parameters.Add("@offNo", SqlDbType.VarChar, 250).Value = offNo;
                        cmd.Parameters.Add("@branch", SqlDbType.VarChar, 250).Value = branch;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtName.Clear();
                        da.Fill(dtName);
                        con.Close();
                        con.Dispose();
                    }

                }
            }
            catch (Exception ex)
            {

            }
            return dtName;
        }

        public DataTable GetOffNoList(string strConnString, string Sebase, string rank, string branch)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "VICTULING_Get_BaseVisePersons";
                        cmd.Parameters.Add("@base", SqlDbType.VarChar, 250).Value = Sebase;
                        cmd.Parameters.Add("@rank", SqlDbType.VarChar, 250).Value = rank;
                        cmd.Parameters.Add("@branch", SqlDbType.VarChar, 250).Value = branch;
                 
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtOffiList.Clear();
                        da.Fill(dtOffiList);
                        con.Close();
                        con.Dispose();
                    }

                }
            }
            catch (Exception ex)
            {

            }
            return dtOffiList;
        }

        //public DataTable GetOffNoList(string v1,string v2, string strConnStrings)
        //{
        //    SqlParameter param;
        //    DataTable dt = new DataTable();
        //    SqlDataAdapter da;
        //    using (SqlConnection con = new SqlConnection(strConnStrings))
        //    {
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = con;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = "VICTULING_Get_BaseVisePersons";
        //            param = new SqlParameter("@base", v1);
        //            param = new SqlParameter("@rank", v2);
        //            param.Direction = ParameterDirection.Input;
        //            param.DbType = DbType.String;
        //            cmd.Parameters.Add(param);

        //            con.Open();
        //            da = new SqlDataAdapter(cmd);
        //            da.Fill(dt);
        //            con.Close();
        //        }
        //    }
        //    return dt;
        //}

       
        public DataTable Get309PriceDetails(string strConnString, string year, string itemCode,string wardRoomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "VICTULING_GetSelectedItem309Price";
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@itemCode", SqlDbType.VarChar, 250).Value = itemCode;
                        cmd.Parameters.Add("@wordRoomCode", SqlDbType.VarChar, 250).Value = wardRoomCode;
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dt306Price.Clear();
                        da.Fill(dt306Price);
                        con.Close();
                        con.Dispose();
                    }

                }
            }
            catch (Exception ex)
            {

            }
            return dt306Price;
        }

        public DataTable GetNonVegMainMenu(string strConnString, string date, string reason, string wardRoomCode, string noOfPerson, string veg, string groupMenu)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "VICTULING_getIngredientsListForSA_Tot";
                       

                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reason;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardRoomCode;
                        cmd.Parameters.Add("@noOfPerson", SqlDbType.VarChar, 250).Value = noOfPerson;
                        cmd.Parameters.Add("@vegiNonVegi", SqlDbType.VarChar, 250).Value = veg;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 250).Value = groupMenu;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetNonVegMMEx.Clear();
                        da.Fill(dtGetNonVegMMEx);
                        con.Close();
                        con.Dispose();
                    }

                }
            }
            catch (Exception ex)
            {

            }
            return dtGetNonVegMMEx;
        }


        public DataTable GetgroupMenu(string strConnString, string date, string reason, string wardRoomCode, string noOfPerson, string veg, string groupMenu)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "VICTULING_getIngredientsListForGroupMenu_Tot";


                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reason;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardRoomCode;
                        cmd.Parameters.Add("@noOfPerson", SqlDbType.VarChar, 250).Value = noOfPerson;
                        cmd.Parameters.Add("@vegiNonVegi", SqlDbType.VarChar, 250).Value = veg;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 250).Value = groupMenu;

                        

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetGroupMEx.Clear();
                        da.Fill(dtGetGroupMEx);
                        con.Close();
                        con.Dispose();
                    }

                }
            }
            catch (Exception ex)
            {

            }
            return dtGetGroupMEx;
        }


        public DataTable GetmenuNameList(string ConnString, string date, string reasonCode, string wardroomCode, string vegi)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetMenuItemList_OnDate]";
                        cmd.Parameters.Add("@onChargeDate", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reason", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@vegi", SqlDbType.VarChar, 250).Value = vegi;
                       

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtTotalMenuCost.Clear();
                        da.Fill(dtTotalMenuCost);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtTotalMenuCost;
        }

        public DataTable GetDiscount(string ConnString, string fromDate, string toDate, string type, string wardroomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetCash309ItemByDuration]";
                        cmd.Parameters.Add("@fromDate", SqlDbType.VarChar, 250).Value = fromDate;
                        cmd.Parameters.Add("@toDate", SqlDbType.VarChar, 250).Value = toDate;
                        cmd.Parameters.Add("@type", SqlDbType.VarChar, 250).Value = type;
                        cmd.Parameters.Add("@wardroom", SqlDbType.VarChar, 250).Value = wardroomCode;


                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtTotalMenuCost.Clear();
                        da.Fill(dtTotalMenuCost);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtTotalMenuCost;
        }

        public DataTable GetAllMainMenuNonVegAtten(string ConnString, string date, string reasonCode, string wardroomCode)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_GetAllMenuItemList_OnDate]";

                        cmd.Parameters.Add("@onChargeDate", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reason", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[2];
        }

        public DataTable GetAllMainMenuVegAtten(string ConnString, string date, string reasonCode, string wardroomCode)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_GetAllMenuItemList_OnDate]";

                        cmd.Parameters.Add("@onChargeDate", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reason", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[4];
        }

        public DataTable GetGroupmenuNameList(string ConnString, string date, string reasonCode, string wardroomCode, string vegi, string groupMenu)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetGroupMenuOffNoList]";
                        cmd.Parameters.Add("@onChargeDate", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@vegNonVeg", SqlDbType.VarChar, 250).Value = vegi;
                        cmd.Parameters.Add("@groupMenuCode", SqlDbType.VarChar, 250).Value = groupMenu;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetGroupMenuList.Clear();
                        da.Fill(dtGetGroupMenuList);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetGroupMenuList;
        }

        public DataTable GetIndividualSummary(string ConnString, string date, string wardroomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetIndividualMealDates_price]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;

                        cmd.Parameters.Add("@wardroom", SqlDbType.VarChar, 250).Value = wardroomCode;
                     
                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetIndividualSummary.Clear();
                        da.Fill(dtGetIndividualSummary);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetIndividualSummary;
        }

    

        public DataTable GetBillList(string ConnString, string date, string wardroomCode,string descriptionCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetBillList_byDate]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@descriptionCode", SqlDbType.VarChar, 250).Value = descriptionCode;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetIndividualSummary.Clear();
                        da.Fill(dtGetIndividualSummary);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetIndividualSummary;
        }

        public DataTable GetBillCost(string ConnString, string date, string wardroomCode, string billNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetBillList_byBillNo]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@billNo", SqlDbType.VarChar, 250).Value = billNo;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetIndividualSummary.Clear();
                        da.Fill(dtGetIndividualSummary);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetIndividualSummary;
        }

        public DataTable GetCashBook(string ConnString, string date, string wardroomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetCashBook]";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;

                        cmd.Parameters.Add("@wordRoomCode", SqlDbType.VarChar, 250).Value = wardroomCode;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetCost.Clear();
                        da.Fill(dtGetCost);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetCost;
        }


        public DataTable GetSummaryCashBook(string ConnString, string year,string month, string wardroomCode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[VICTULING_GetCashSummaryBook]";
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@month", SqlDbType.VarChar, 250).Value = month;
                        cmd.Parameters.Add("@wordRoomCode", SqlDbType.VarChar, 250).Value = wardroomCode;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtGetCost.Clear();
                        da.Fill(dtGetCost);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtGetCost;
        }

        public DataTable GetAuthorizedList(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_GetMonthlyOfficersList]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@moth", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[0];
        }


        public DataTable GetAuthorizedNonMenuCostList(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@moth", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[0];
        }

        public DataTable GetBiteOrderPrint(string ConnString, string type, string wardroomCode, string date, string reason)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_viewBiteMenu_Print]";

                        cmd.Parameters.Add("@type", SqlDbType.VarChar, 250).Value = type;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reason;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[0];
        }

        public DataTable GetAuthorizedVegMenuCostList(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@moth", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[1];
        }


        public DataTable GetAuthorizedExtraMenuCostList(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@moth", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[2];
        }

        public DataTable GetAuthorizedPartyCostList(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@moth", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[3];
        }


        public DataTable GetAuthorizedTeaCountList(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@moth", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[5];
        }

        public DataTable GetAuthorizedPlainTeaCountList(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@moth", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[4];
        }

        public DataTable GetAuthorizedVICDaysCountList(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.CommandText = "[VICTULING_GetMonthlyOfficersList_withFinalCost]";

                        cmd.Parameters.Add("@wardroomName", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@moth", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[6];
        }

        public DataTable GetFinalRecoveryNew(string ConnString, string wardroomCode, string year, string month)
        {

            DataSet dst = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();

            try
            {
                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.CommandText = "[VICTULING_GetAllMonthlyRecovery_DinnigAndWine]";
                        cmd.CommandText = "[VICTULING_GetMonthlyRecoveryByMonth]";

                        cmd.Parameters.Add("@wardroom", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@year", SqlDbType.VarChar, 250).Value = year;
                        cmd.Parameters.Add("@month", SqlDbType.VarChar, 250).Value = month;

                        cmd.ExecuteNonQuery();
                        sqlda.SelectCommand = cmd;
                        sqlda.Fill(dst);

                        //object objValue2 = (cmd.ExecuteScalar());
                        //SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //dtFinalReco.Clear();
                        //da.Fill(dtFinalReco);
                        con.Close();
                        con.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dst.Tables[0];
        }

        public DataTable GetBiteOrder(string ConnString,  string date, string reasonCode, string wardroomCode, string groupType)
        {
            DataTable TlbGetAllOfficerDetailsS = new DataTable();
            try
            {


                using (SqlConnection con = new SqlConnection(ConnString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "VICTULING_viewBiteMenuDetails";
                        cmd.Parameters.Add("@date", SqlDbType.VarChar, 250).Value = date;
                        cmd.Parameters.Add("@reasonCode", SqlDbType.VarChar, 250).Value = reasonCode;
                        cmd.Parameters.Add("@wardroomCode", SqlDbType.VarChar, 250).Value = wardroomCode;
                        cmd.Parameters.Add("@groupType", SqlDbType.VarChar, 250).Value = groupType;

                        object objValue2 = (cmd.ExecuteScalar());
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        dtViewBiteOrder.Clear();
                        da.Fill(dtViewBiteOrder);
                        con.Close();
                        con.Dispose();

                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dtViewBiteOrder;
        }
    }
}