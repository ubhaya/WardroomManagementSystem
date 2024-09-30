<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MealAttendance.aspx.cs" Inherits="victuling_WordRoom.MealAttendance" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
        text-decoration: underline;
        width: 139px;
    }
    .style2
    {
            width: 139px;
        }
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
    <tr>
        <td class="style1">
            <strong>Meal Attendance</strong></td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Select Date :</td>
        <td>
            <telerik:RadDatePicker ID="dateSelected" Runat="server">
            </telerik:RadDatePicker>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Reason :</td>
        <td>
                <telerik:RadComboBox ID="cmbDescription" runat="server" AutoPostBack="false">
                </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Group Type :</td>
        <td>
                <telerik:RadComboBox ID="ddlGroupMenu" Runat="server">
                </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Wardroom :</td>
        <td>
            <telerik:RadTextBox ID="txtWardRoom" Runat="server" ReadOnly="True">
            </telerik:RadTextBox>
            <telerik:RadButton ID="btnVewMenu" runat="server" Text="View Menu" 
                Width="130px" onclick="btnVewMenu_Click">
            </telerik:RadButton>
            <telerik:RadComboBox ID="ddlWardroom" Runat="server" 
                onselectedindexchanged="ddlWardroom_SelectedIndexChanged" Visible="False">
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Non-Veg.
            Menu :</td>
        <td>
            <telerik:RadGrid ID="grdReport" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport_ItemCommand" 
                                onitemdatabound="grdReport_ItemDataBound" 
                                onneeddatasource="rgdBoardAssessment_NeedDataSource" PageSize="50" 
                                ShowStatusBar="True" Width="70%" 
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
                          <%-- <telerik:GridBoundColumn DataField="mainItemCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Code" 
                                            UniqueName="mainItemCode">
                        </telerik:GridBoundColumn>--%>
                          <telerik:GridBoundColumn DataField="mainItemCategory" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Category" 
                                            UniqueName="mainItemCategory">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="mainItem" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item" 
                                            UniqueName="mainItem">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="remarks" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Remarks" 
                                            UniqueName="remarks">
                        </telerik:GridBoundColumn>
                 
                         

                  

                       
<%--
                       <telerik:GridTemplateColumn HeaderText="Select" UniqueName="Features">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="headerChkbox" runat="server" AutoPostBack="True" 
                                                                        OnCheckedChanged="ToggleSelectedState" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="cbxSelect" runat="server" AutoPostBack="True" 
                                                                        OnCheckedChanged="ToggleRowSelection" />
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>--%>
                         

                  

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
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Veg.
            Menu :</td>
        <td>
            <telerik:RadGrid ID="grdReport0" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport_ItemCommand" 
                                onitemdatabound="grdReport0_ItemDataBound" 
                                onneeddatasource="rgdBoardAssessment_NeedDataSource" PageSize="50" 
                                ShowStatusBar="True" Width="70%" 
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
                                <asp:Label ID="lblSn0" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                          <%-- <telerik:GridBoundColumn DataField="mainItemCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Code" 
                                            UniqueName="mainItemCode">
                        </telerik:GridBoundColumn>--%>
                          <telerik:GridBoundColumn DataField="mainItemCategory" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Category" 
                                            UniqueName="mainItemCategory">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="mainItem" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item" 
                                            UniqueName="mainItem">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="remarks" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Remarks" 
                                            UniqueName="remarks">
                        </telerik:GridBoundColumn>
                 
                         

                  

                       
<%--
                       <telerik:GridTemplateColumn HeaderText="Select" UniqueName="Features">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="headerChkbox" runat="server" AutoPostBack="True" 
                                                                        OnCheckedChanged="ToggleSelectedState" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="cbxSelect" runat="server" AutoPostBack="True" 
                                                                        OnCheckedChanged="ToggleRowSelection" />
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>--%>
                         

                  

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
    </tr>
    <tr>
        <td class="style2">
            Meal Type :</td>
        <td>
            <asp:RadioButtonList ID="rdoVegi" runat="server" AutoPostBack="True" 
                Height="18px" onselectedindexchanged="rdoMealInOut_SelectedIndexChanged" 
                RepeatDirection="Horizontal" style="margin-bottom: 0px" Width="30%">
                <asp:ListItem Value="Vegetarian">Vegetarian</asp:ListItem>
                <asp:ListItem Value="Non-Vegetarian">Non-Vegetarian</asp:ListItem>
            </asp:RadioButtonList>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Meal In/Out :</td>
        <td>
            <asp:RadioButtonList ID="rdoMealInOut" runat="server" AutoPostBack="True" 
                Height="18px" onselectedindexchanged="rdoMealInOut_SelectedIndexChanged" 
                RepeatDirection="Horizontal" style="margin-bottom: 0px" Width="30%">
                <asp:ListItem Value="1">Meal In</asp:ListItem>
                <asp:ListItem Value="0">Meal Out</asp:ListItem>
            </asp:RadioButtonList>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Meal Count :</td>
        <td>
            <telerik:RadComboBox ID="ddlMealCOunt" Runat="server">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="0" Value="0" />
                    <telerik:RadComboBoxItem runat="server" Text="1" Value="1" />
                    <telerik:RadComboBoxItem runat="server" Text="2" Value="2" />
                    <telerik:RadComboBoxItem runat="server" Text="3" Value="3" />
                    <telerik:RadComboBoxItem runat="server" Text="4" Value="4" />
                    <telerik:RadComboBoxItem runat="server" Text="5" Value="5" />
                    <telerik:RadComboBoxItem runat="server" Text="6" Value="6" />
                    <telerik:RadComboBoxItem runat="server" Text="7" Value="7" />
                    <telerik:RadComboBoxItem runat="server" Text="8" Value="8" />
                    <telerik:RadComboBoxItem runat="server" Text="9" Value="9" />
                    <telerik:RadComboBoxItem runat="server" Text="10" Value="10" />
                </Items>
            </telerik:RadComboBox>
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
    <tr>
        <td class="style2">
            Official No. :</td>
        <td>
                <telerik:RadTextBox ID="txtOfficialNo" Runat="server">
                </telerik:RadTextBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Service Type :</td>
        <td>
                <telerik:RadComboBox ID="ddlServiceType" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                            Value="---Select---" Owner="ddlServiceType" />
                        <telerik:RadComboBoxItem runat="server" Text="RNF" Value="RNF" 
                            Owner="ddlServiceType" />
                        <telerik:RadComboBoxItem runat="server" Text="VNF" Value="VNF" 
                            Owner="ddlServiceType" />
                        <telerik:RadComboBoxItem runat="server" Text="RNR" Value="RNR" 
                            Owner="ddlServiceType" />
                        <telerik:RadComboBoxItem runat="server" Text="VNR" Value="VNR" 
                            Owner="ddlServiceType" />
                    </Items>
                </telerik:RadComboBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            O/S :</td>
        <td>
                <telerik:RadComboBox ID="ddlOfficerSailor" Runat="server" 
                    onselectedindexchanged="ddlOfficerSailor_SelectedIndexChanged">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Officer" Value="O" 
                            Owner="ddlOfficerSailor" />
                    </Items>
                </telerik:RadComboBox>
                <telerik:RadButton ID="btnViewOfficer" runat="server" 
                onclick="btnViewOfficer_Click" Text="View Officer " Width="130px">
            </telerik:RadButton>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
                <asp:Image ID="imgPerson" runat="server" Height="118px" Width="110px" />
                <asp:Label ID="lblNic" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                Rank :</td>
        <td>
                <asp:Label ID="lblRank" runat="server"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                Name :</td>
        <td>
                <asp:Label ID="lblFullName" runat="server"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                Permanent Base :</td>
        <td>
                <asp:Label ID="lblPermanentBase" runat="server"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                Meal In Base :</td>
        <td>
                <telerik:RadComboBox ID="ddlBaseAll" Runat="server">
                </telerik:RadComboBox>
            <telerik:RadButton ID="btnAddMenu" runat="server" Text="In/Out Menu" 
                Width="130px" onclick="btnAddMenu_Click">
            </telerik:RadButton>
            <asp:Label ID="lblError" runat="server"></asp:Label>
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
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
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
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
            <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
            </telerik:RadScriptManager>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
