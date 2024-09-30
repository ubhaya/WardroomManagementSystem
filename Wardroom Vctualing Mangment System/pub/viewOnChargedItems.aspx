<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewOnChargedItems.aspx.cs" Inherits="victuling_WordRoom.viewOnChargedItems" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style4
        {
            width: 140px;
        }
        .style5
        {
            width: 140px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="lblBillNo0" runat="server" Text="Ward Room"></asp:Label>
            &nbsp;:</td>
            <td colspan="6" style="text-align: left">
                <telerik:RadTextBox ID="txtWardRoom" Runat="server" Width="150px">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="lblBillNo1" runat="server" Text="Billing Month"></asp:Label>
            &nbsp;:</td>
            <td colspan="6" style="text-align: left">
            <telerik:RadDatePicker ID="dateOnCharge" Runat="server" Width="150px">
            </telerik:RadDatePicker>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                Type :</td>
            <td colspan="6" style="text-align: left">
                <telerik:RadComboBox ID="cmbBillNo" Runat="server" Width="150px">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Cash" Value="Cash" 
                            Owner="cmbBillNo" />
                        <telerik:RadComboBoxItem runat="server" Text="309" Value="309" 
                            Owner="cmbBillNo" />
                        <telerik:RadComboBoxItem runat="server" Text="Uncollected Credit " 
                            Value="Uncollected Credit " />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="lblBillNo" runat="server" Text="Bill Number"></asp:Label>
            &nbsp;:</td>
            <td colspan="6" style="text-align: left">
                <asp:TextBox ID="txtBillNo" runat="server" Width="150px"></asp:TextBox>
                <asp:Button ID="btnFind" runat="server" Text="Find Details" 
                    onclick="btnFind_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td colspan="6" style="text-align: left">
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="7">
            <telerik:RadGrid ID="grdReport" runat="server" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None"
                                onitemcommand="grdReport_ItemCommand" 
                                PageSize="50" 
                                ShowStatusBar="True" Width="100%" 
                    onitemdatabound="grdReport_ItemDataBound">
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

                         <telerik:GridBoundColumn DataField="itemId" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Id" 
                                            UniqueName="itemId">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="billNO" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Bill No" 
                                            UniqueName="billNo">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item" 
                                            UniqueName="item">
                        </telerik:GridBoundColumn>
                      
                          <telerik:GridBoundColumn DataField="onChargeQty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="On Charge QTY" 
                                            UniqueName="onChargeQty">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Messurment" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn>                      
                        <telerik:GridBoundColumn DataField="unitPrice" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Unit Price" 
                                            UniqueName="unitPrice">
                        </telerik:GridBoundColumn>                       
                          <telerik:GridBoundColumn DataField="totalPrice" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Total Cost" 
                                            UniqueName="totalPrice">
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td colspan="5" style="text-align: left">
                <asp:Label ID="Label3" runat="server" Text=" Gross Total Rs: " Visible="false" 
                    style="text-align: left"></asp:Label>
                <asp:Label ID="lblGross" runat="server" Font-Size="Large" Visible="false"
                    style="font-weight: 700"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td colspan="5" style="text-align: left">
                <asp:Label ID="Label2" runat="server" Text=" Discount Rs:" Visible="false"></asp:Label>
                <asp:Label ID="lblDiscount" runat="server" Font-Size="Large" Visible="false"
                    style="font-weight: 700"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td colspan="5" style="text-align: left">
                <asp:Label ID="Label1" runat="server" Text=" Net Total Rs: " Visible="false"></asp:Label>
                <asp:Label ID="lblTot" runat="server" Font-Size="Large" Visible="false"
                    style="font-weight: 700"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td colspan="6">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
