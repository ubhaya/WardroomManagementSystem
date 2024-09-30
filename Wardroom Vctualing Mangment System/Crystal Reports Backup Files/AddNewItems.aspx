<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewItems.aspx.cs" Inherits="victuling_WordRoom.AddNewItems" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 184px;
        }
    .style3
    {
        text-decoration: underline;
    }
        .style4
        {
            width: 426px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style3">
                <strong>Add New Item</strong></td>
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
                         <telerik:RadPanelItem runat="server" Text="Search Existing Items in Stock" 
                             Expanded ="true">
                         
            <ContentTemplate>
                <table style="width:100%;">
                    <tr>
                        <td class="style1">
                            <asp:Label ID="lblAppointmentDes" runat="server" 
                                Text="Item Description :"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtItemDes" Runat="server" LabelWidth="450px" 
                                Width="450px" ontextchanged="txtItemDes_TextChanged">
                            </telerik:RadTextBox>
                            <telerik:RadButton ID="btnLoad" runat="server" onclick="btnLoad_Click" 
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
                            <telerik:RadGrid ID="grdReport" runat="server" AllowPaging="True" 
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
                                        <telerik:GridBoundColumn DataField="itemCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Code" 
                                            UniqueName="itemCode">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" 
                                            HeaderText="Item" UniqueName="item">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="itemCatagory" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Catagory" 
                                            UniqueName="itemCatagory">
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
                         <telerik:RadPanelItem runat="server" Text="Add New Item "  Expanded ="true">
                             <ContentTemplate>
                                 <table style="width:100%;">
                                     <tr>
                                         <td class="style2">
                                             <asp:Label ID="lblItemCode" runat="server" Text="Item Code :"></asp:Label>
                                         </td>
                                         <td class="style4">
                                             <telerik:RadTextBox ID="txtItemCode" Runat="server">
                                             </telerik:RadTextBox>
                                         </td>
                                         <td>
                                             <telerik:RadButton ID="btnGetItemCode" runat="server" 
                                                 onclick="btnGetItemCode_Click" Text="Search Item Code" Width="130px">
                                             </telerik:RadButton>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             <asp:Label ID="lblAppointmentDes3" runat="server" Text="Item :"></asp:Label>
                                         </td>
                                         <td class="style4">
                                             <telerik:RadTextBox ID="txtItem" Runat="server" Width="250px">
                                             </telerik:RadTextBox>
                                         </td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             <asp:Label ID="lblAppointmentDes0" runat="server" Text="Item Category :"></asp:Label>
                                         </td>
                                         <td class="style4">
                                             <telerik:RadComboBox ID="ddlItemCat" Runat="server">
                                             </telerik:RadComboBox>
                                         </td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             <asp:Label ID="lblAppointmentDes1" runat="server" Text="Item Messurement :"></asp:Label>
                                         </td>
                                         <td class="style4">
                                             <telerik:RadComboBox ID="ddltemitemMessurment" Runat="server">
                                             </telerik:RadComboBox>
                                         </td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             Wardroom :</td>
                                         <td class="style4">
                                             <telerik:RadTextBox ID="txtWardRoom" Runat="server" ReadOnly ="true">
                                                         </telerik:RadTextBox>
                                         </td>
                                         <td>
                                             <telerik:RadButton ID="btnSaveNewItem" runat="server" 
                                                 onclick="btnSaveNewItem_Click" Text="Save New Item" Width="130px">
                                             </telerik:RadButton>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             &nbsp;</td>
                                         <td class="style4">
                                             <asp:Label ID="lblError1" runat="server"></asp:Label>
                                         </td>
                                         <td>
                                             <telerik:RadButton ID="btnCreateNewCode" runat="server" 
                                                 onclick="btnCreateNewCode_Click" Text="Create New Code" Width="130px">
                                             </telerik:RadButton>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="style2">
                                             &nbsp;</td>
                                         <td class="style4">
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

                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
