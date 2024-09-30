<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewFullStockNew.aspx.cs" Inherits="victuling_WordRoom.ViewFullStockNew" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
            <telerik:RadGrid ID="grdReport" runat="server" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" 
                                onitemdatabound="grdReport_ItemDataBound" PageSize="50" 
                                ShowStatusBar="True" Width="100%">
                <ExportSettings ExportOnlyData="True" HideStructureColumns="True" 
                                    IgnorePaging="True">
                </ExportSettings>
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView CommandItemDisplay="Top" Width="100%">
                    <CommandItemSettings ShowAddNewRecordButton="false" 
                                        ShowExportToExcelButton="true" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                                        Visible="True">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                                        Visible="True">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="Sr.No" UniqueName="SlNo">
                            <ItemTemplate>
                                <asp:Label ID="lblSn" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                      <%--     <telerik:GridBoundColumn DataField="serviceType" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Service Type" 
                                            UniqueName="serviceType">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="branchID" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Branch" 
                                            UniqueName="branchID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="itemCatagory" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Catagory" 
                                            UniqueName="itemCatagory">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item" 
                                            UniqueName="item">
                        </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Messurment" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="currentStock" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Current Stock" 
                                            UniqueName="currentStock">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="reOrderLevel" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Re-Order Level" 
                                            UniqueName="reOrderLevel">
                        </telerik:GridBoundColumn>
                  

                       

                      
                         

                  

                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
