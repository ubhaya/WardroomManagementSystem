<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewMenuItems.aspx.cs" Inherits="victuling_WordRoom.AddNewMenuItems" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style2
        {
            width: 184px;
        }
        .style3
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
    <tr>
        <td class="style3">
                <strong>Add&nbsp; New Menu Item</strong></td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <telerik:radpanelbar ID="RadPanelBar3" Runat="server" Width ="98%" Skin="Default" 
                    EnableEmbeddedSkins="False" onitemclick="RadPanelBar3_ItemClick" >
                    <Items>
                         <telerik:RadPanelItem runat="server" Text="Search Existing Menu Items" 
                             Expanded ="true">
                         
            <ContentTemplate>
                <table style="width:100%;">
                    <tr>
                        <td class="style1">
                            <asp:Label ID="lblAppointmentDes" runat="server" 
                                Text="Menu Item Description :"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtItemDes0" Runat="server" LabelWidth="450px" 
                                Width="450px" ontextchanged="txtItemDes_TextChanged">
                            </telerik:RadTextBox>
                            <telerik:RadButton ID="btnLoad0" runat="server" onclick="btnLoad_Click" 
                                Text="Load Data" Width="130px">
                            </telerik:RadButton>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style1">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblError" runat="server"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style1" colspan="3">
                            <telerik:RadGrid ID="grdReport0" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport_ItemCommand" 
                                onitemdatabound="grdReport_ItemDataBound" 
                                onneeddatasource="rgdBoardAssessment_NeedDataSource" PageSize="50" 
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
                                        <telerik:GridBoundColumn DataField="mainItemCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Menu Item Code" 
                                            UniqueName="mainItemCode">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="mainItem" 
                                            FilterControlAltText="Filter Official_NO column" 
                                            HeaderText="Menu Item" UniqueName="mainItem">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="mainItemCategory" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Menu Item Category" 
                                            UniqueName="mainItemCategory">
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
                        <td class="style1">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblErrorDelete" runat="server"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style1">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </ContentTemplate>
            </telerik:RadPanelItem>
                         <telerik:RadPanelItem runat="server" Text="Add New Menu Item "  Expanded ="true">
                             <ContentTemplate>
                                 <table style="width:100%;">
                                     <tr>
                                         <td class="style2">
                                             <asp:Label ID="lblItemCode" runat="server" Text="Menu Item Code :"></asp:Label>
                                         </td>
                                         <td>
                                             <telerik:RadTextBox ID="txtItemCode0" Runat="server">
                                             </telerik:RadTextBox>
                                             <telerik:RadButton ID="btnGetItemCode0" runat="server" 
                                                 onclick="btnGetItemCode_Click" Text="Search Menu Item Code" Width="132px">
                                             </telerik:RadButton>
                                         </td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             <asp:Label ID="lblAppointmentDes3" runat="server" Text="Menu Item :"></asp:Label>
                                         </td>
                                         <td>
                                             <telerik:RadTextBox ID="txtItem0" Runat="server" Width="250px" 
                                                 ontextchanged="txtItem0_TextChanged">
                                             </telerik:RadTextBox>
                                         </td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             <asp:Label ID="lblAppointmentDes0" runat="server" Text="Menu Item Category :"></asp:Label>
                                         </td>
                                         <td>
                                             <telerik:RadComboBox ID="ddlItemCat0" Runat="server">
                                             </telerik:RadComboBox>
                                         </td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             Wardroom :</td>
                                         <td>
                                             <telerik:RadTextBox ID="txtWardRoom" Runat="server" ReadOnly ="true">
                                                         </telerik:RadTextBox>
                                             <telerik:RadButton ID="btnSaveNewItem0" runat="server" 
                                                 onclick="btnSaveNewItem_Click" Text="Save New Menu Item" Width="130px">
                                             </telerik:RadButton>
                                             <telerik:RadButton ID="btnCreateNewCode0" runat="server" 
                                                 onclick="btnCreateNewCode_Click" Text="Create New Code" Width="130px">
                                             </telerik:RadButton>
                                         </td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             &nbsp;</td>
                                         <td>
                                             <asp:Label ID="lblError1" runat="server"></asp:Label>
                                         </td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             &nbsp;</td>
                                         <td>
                                             &nbsp;</td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                 </table>
                             </ContentTemplate>
                         </telerik:RadPanelItem>

            </Items>
            
                    <ItemTemplate>
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
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr bgcolor="#0099FF">
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
            </telerik:radpanelbar>

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
