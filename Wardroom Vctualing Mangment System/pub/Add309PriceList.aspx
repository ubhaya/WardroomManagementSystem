<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add309PriceList.aspx.cs" Inherits="victuling_WordRoom.Add309PriceList" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style2
    {
        text-decoration: underline;
    }
    .style3
    {
        width: 130px;
    }
.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
    .style4
    {
    }
    .style5
    {
            width: 352px;
        }
        .style6
        {
            width: 130px;
            height: 26px;
        }
        .style7
        {
            width: 352px;
            height: 26px;
        }
        .style8
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
    <tr>
        <td class="style2" colspan="3">
                <strong>Add 309 Price List</strong></td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label9" runat="server" Text="Wardroom  :"></asp:Label>
        </td>
        <td class="style5">
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
        <td class="style5">
            <telerik:RadDatePicker ID="dateOnCharge" Runat="server">
            </telerik:RadDatePicker>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Year</td>
        <td class="style5">
            <telerik:RadComboBox ID="ddlYear" Runat="server">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                        Value="---Select---" Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2017" Value="2017" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2018" Value="2018" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2019" Value="2019" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2020" Value="2020" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2021" Value="2021" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2022" Value="2022" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2023" Value="2023" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2024" Value="2024" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2025" Value="2025" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2026" Value="2026" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2027" Value="2027" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2028" Value="2028" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2029" Value="2029" />
                    <telerik:RadComboBoxItem runat="server" Text="2030" Value="2030" />
                </Items>
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label3" runat="server" Text="Received From :"></asp:Label>
        </td>
        <td class="style5">
            <asp:Label ID="lblReceivedFrom" runat="server" Text="309"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label10" runat="server" Text="Item Category :"></asp:Label>
        </td>
        <td class="style5">
            <telerik:RadComboBox ID="ddlItemCat" Runat="server" 
                onselectedindexchanged="ddlItemCat_SelectedIndexChanged" 
                AutoPostBack="True" Width="300px">
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            <asp:Label ID="Label2" runat="server" Text="Item :"></asp:Label>
        </td>
        <td class="style7">
            <telerik:RadComboBox ID="ddlItem" Runat="server" Width="300px" 
                Filter="Contains">
            </telerik:RadComboBox>
        </td>
        <td class="style8">
            </td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label5" runat="server" Text="Unit Price :"></asp:Label>
        </td>
        <td class="style5">
            <telerik:RadTextBox ID="txtUnitPrice" Runat="server">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Denomination</td>
        <td class="style5">
            <telerik:RadTextBox ID="txtDenomination" Runat="server">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="lblAppointmentDes1" runat="server" Text="Item Messurement :"></asp:Label>
        </td>
        <td class="style5">
            <telerik:RadComboBox ID="ddltemitemMessurment" Runat="server">
            </telerik:RadComboBox>
        </td>
        <td>
            <telerik:RadButton ID="RadButton1" runat="server" onclick="RadButton1_Click" 
                Text="Add" Width="117px">
            </telerik:RadButton>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style4" colspan="2">
            <telerik:RadGrid ID="grdReport" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" 
                                onitemdatabound="grdReport_ItemDataBound" PageSize="50" 
                                ShowStatusBar="True" Width="100%" 
                onitemcommand="grdReport_ItemCommand">
                <ExportSettings ExportOnlyData="True" HideStructureColumns="True" 
                                    IgnorePaging="True">
                </ExportSettings>
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView CommandItemDisplay="Top" Width="100%">
                    <CommandItemSettings ShowAddNewRecordButton="false" 
                                        ShowExportToExcelButton="true" ShowExportToPdfButton ="true" />
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
                         <telerik:GridBoundColumn DataField="denomination" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Denomination" 
                                            UniqueName="denomination">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Measurement" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="itemId" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item ID" 
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
        <td class="style5">
            <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
            </telerik:RadScriptManager>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
