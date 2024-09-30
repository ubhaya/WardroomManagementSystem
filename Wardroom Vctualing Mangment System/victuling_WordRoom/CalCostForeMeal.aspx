<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CalCostForeMeal.aspx.cs" Inherits="victuling_WordRoom.CalCostForeMeal" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
            width: 199px;
        }
        .style2
        {
            width: 199px;
        }
        .style3
        {
        }
        .style4
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
                <strong>View Cost Per Meal </strong>
            </td>
            <td class="style4">
                <telerik:RadDatePicker ID="dateSelected" Runat="server" Visible="False">
                </telerik:RadDatePicker>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
            Reason :</td>
            <td class="style4">
                <telerik:RadComboBox ID="cmbDescription" Runat="server">
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Group Type :</td>
            <td class="style4">
                <telerik:RadComboBox ID="ddlGroupMenu" Runat="server">
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
            Wardroom :</td>
            <td class="style4">
                <telerik:RadTextBox ID="txtWardRoom" Runat="server" Enabled="false" 
                >
                </telerik:RadTextBox>
            </td>
            <td>
                <telerik:RadComboBox ID="ddlWardroom" Runat="server" Visible="False">
                </telerik:RadComboBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
            Vegetarian/Non-Vegetarian :</td>
            <td class="style4">
            <telerik:RadComboBox ID="ddlVegi" Runat="server" 
                    onselectedindexchanged="ddlVegi_SelectedIndexChanged">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                        Value="---Select---" />
                    <telerik:RadComboBoxItem runat="server" Text="Vegetarian" Value="Vegetarian" />
                    <telerik:RadComboBoxItem runat="server" Text="Non-Vegetarian" 
                        Value="Non-Vegetarian" />
                </Items>
            </telerik:RadComboBox>
            </td>
            <td>
                <telerik:RadButton ID="btnView" runat="server" Text="View" 
                    Width="130px" onclick="btnView_Click" Visible="False">
                </telerik:RadButton>
                </td>
        </tr>
        <tr>
            <td class="style2">
                Year :</td>
            <td class="style4">
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
            <td class="style2">
                Month :</td>
            <td class="style4">
            <telerik:RadComboBox ID="ddlMonth" Runat="server">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                        Value="---Select---" />
                    <telerik:RadComboBoxItem runat="server" Text="January" Value="1" />
                    <telerik:RadComboBoxItem runat="server" Text="February" Value="2" />
                    <telerik:RadComboBoxItem runat="server" Text="March" Value="3" />
                    <telerik:RadComboBoxItem runat="server" Text="April" Value="4" />
                    <telerik:RadComboBoxItem runat="server" Text="May" Value="5" />
                    <telerik:RadComboBoxItem runat="server" Text="June" Value="6" />
                    <telerik:RadComboBoxItem runat="server" Text="July" Value="7" />
                    <telerik:RadComboBoxItem runat="server" Text="August" Value="8" />
                    <telerik:RadComboBoxItem runat="server" Text="September" Value="9" />
                    <telerik:RadComboBoxItem runat="server" Text="October" Value="10" />
                    <telerik:RadComboBoxItem runat="server" Text="November" Value="11" />
                    <telerik:RadComboBoxItem runat="server" Text="December" Value="12" />
                </Items>
            </telerik:RadComboBox>
            </td>
            <td>
                <telerik:RadButton ID="RadButton2" runat="server" onclick="RadButton2_Click" 
                    Text="View" Width="150px">
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
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4" colspan="2">
                <telerik:RadGrid ID="grdReport0" runat="server" AllowMultiRowSelection="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                    GridLines="None" onitemcommand="grdReport0_ItemCommand" DataKeyNames="mealDate"
                    onitemdatabound="grdReport0_ItemDataBound" PageSize="50" ShowStatusBar="True" 
                    Width="97%">
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
                            <telerik:GridTemplateColumn HeaderText="Select" UniqueName="Features">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="headerChkbox" runat="server" AutoPostBack="True" 
                                        OnCheckedChanged="ToggleSelectedState" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbxSelect" runat="server" AutoPostBack="True" 
                                        OnCheckedChanged="ToggleRowSelection" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Sr.No" UniqueName="SlNo">
                                <ItemTemplate>
                                    <asp:Label ID="lblSn0" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="mealDate" 
                                FilterControlAltText="Filter Official_NO column" HeaderText="Meal Date" 
                                UniqueName="mealDate">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="totalCost" 
                                FilterControlAltText="Filter Official_NO column" HeaderText="Total Cost" 
                                UniqueName="totalCost">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="mealCount" 
                                FilterControlAltText="Filter Official_NO column" HeaderText="Meal Count" 
                                UniqueName="mealCount">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="cost" 
                                FilterControlAltText="Filter Official_NO column" HeaderText="Cost" 
                                UniqueName="cost">
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
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblMenuCost" runat="server"></asp:Label>
            </td>
            <td>
                <telerik:RadButton ID="RadButton1" runat="server" onclick="RadButton1_Click" 
                    Text="Authorized Cost Per Person" Width="150px">
                </telerik:RadButton>
                </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblCount" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblMenuCostP" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
