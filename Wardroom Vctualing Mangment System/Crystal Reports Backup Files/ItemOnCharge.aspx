<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemOnCharge.aspx.cs" Inherits="victuling_WordRoom.ItemOnCharge" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
    }
    .style2
    {
        text-decoration: underline;
    }
    .style3
    {
        width: 196px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 98%;">
    <tr>
        <td class="style2" colspan="3">
                <strong>Add Stock Items</strong></td>
    </tr>
    <tr>
        <td class="style2" colspan="3">
                &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label9" runat="server" Text="Wardroom  :"></asp:Label>
        </td>
        <td>
            <telerik:RadTextBox ID="txtWardRoom" Runat="server" ReadOnly ="true">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label1" runat="server" Text="On Charge Date :"></asp:Label>
        </td>
        <td>
            <telerik:RadDatePicker ID="dateOnCharge" Runat="server">
            </telerik:RadDatePicker>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label3" runat="server" Text="Received From :"></asp:Label>
        </td>
        <td>
            <telerik:RadComboBox ID="ddlReceivedFrom" Runat="server">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                        Value="---Select---" Owner="ddlReceivedFrom" />
                    <telerik:RadComboBoxItem runat="server" Text="309" Value="309" 
                        Owner="ddlReceivedFrom" />
                    <telerik:RadComboBoxItem runat="server" Text="Cash" Value="Cash" 
                        Owner="ddlReceivedFrom" />
                </Items>
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label4" runat="server" Text="Bill No. :"></asp:Label>
        </td>
        <td>
            <telerik:RadTextBox ID="txtBillNo" Runat="server">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label10" runat="server" Text="Item Category :"></asp:Label>
        </td>
        <td>
            <telerik:RadComboBox ID="ddlItemCat" Runat="server" 
                onselectedindexchanged="ddlItemCat_SelectedIndexChanged" 
                AutoPostBack="True" Width="300px">
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label2" runat="server" Text="Item :"></asp:Label>
        </td>
        <td>
            <telerik:RadComboBox ID="ddlItem" Runat="server" 
                onselectedindexchanged="ddlItem_SelectedIndexChanged" Width="300px" 
                AutoPostBack="True">
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label5" runat="server" Text="Unit Price :"></asp:Label>
        </td>
        <td>
            <telerik:RadTextBox ID="txtUnitPrice" Runat="server">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label6" runat="server" Text="On Charge Qty :"></asp:Label>
        </td>
        <td>
            <telerik:RadTextBox ID="txtOnChargeQty" Runat="server">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="lblAppointmentDes1" runat="server" Text="Item Messurement :"></asp:Label>
        </td>
        <td>
            <telerik:RadComboBox ID="ddltemitemMessurment" Runat="server">
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Reason :</td>
        <td>
            <telerik:RadComboBox ID="ddlReason" Runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlReason_SelectedIndexChanged">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                        Value="---Select---" />
                    <telerik:RadComboBoxItem runat="server" Text="Individual" Value="Individual" />
                    <telerik:RadComboBoxItem runat="server" Text="Party" Value="Party" />
                </Items>
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="lblOff" runat="server" Text="Official No. :"></asp:Label>
        </td>
        <td>
            <telerik:RadTextBox ID="txtOffNo" Runat="server">
            </telerik:RadTextBox>
            <asp:Label ID="Label11" runat="server" Text="ex. 1234"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            <telerik:RadButton ID="btnAddItem" runat="server" onclick="btnAddItem_Click" 
                Text="Add Item" Width="130px">
            </telerik:RadButton>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="lblAppointmentDes2" runat="server" Text="Bill Discount/Rounding off :"></asp:Label>
        </td>
        <td>
            <telerik:RadTextBox ID="txtDiscount" Runat="server">
            </telerik:RadTextBox>
            <telerik:RadButton ID="btnDiscount" runat="server"  
                Text="Add Item" Width="130px" onclick="btnDiscount_Click">
            </telerik:RadButton>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1" colspan="3">
            <telerik:RadGrid ID="grdReport" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport_ItemCommand" 
                                onitemdatabound="grdReport_ItemDataBound" 
                                onneeddatasource="rgdBoardAssessment_NeedDataSource" PageSize="50" 
                                ShowStatusBar="True" Width="100%" 
                onselectedcellchanged="grdReport_SelectedCellChanged">
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
                        <telerik:GridBoundColumn DataField="itemCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Code" 
                                            UniqueName="itemCode">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" 
                                            HeaderText="Item" UniqueName="item">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="unitPrice" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Unit Price" 
                                            UniqueName="unitPrice">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="onChargeQty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="On Charge Qty." 
                                            UniqueName="onChargeQty">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Measurement" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="itemId" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="ID" 
                                            UniqueName="itemId">
                        </telerik:GridBoundColumn>
                         

                  

                        <telerik:GridButtonColumn CommandName="deleteItem" 
                            FilterControlAltText="Filter btnDelete column" Text="Delete" 
                            UniqueName="btnDelete">
                        </telerik:GridButtonColumn>
                         

                  

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
        <td class="style3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
            </telerik:RadScriptManager>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
