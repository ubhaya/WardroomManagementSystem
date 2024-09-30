<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuSale.aspx.cs" Inherits="victuling_WordRoom.MenuSale" MaintainScrollPositionOnPostBack = "true" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
            width: 175px;
        }
        .style2
        {
        }
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .style3
        {
            width: 175px;
            height: 21px;
        }
        .style4
        {
            height: 21px;
        }
        .style5
        {
        }
        .style6
        {
            height: 21px;
            width: 304px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 98%;">
        <tr>
            <td class="style1">
                <strong>Menu Item Sale</strong></td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
            <asp:Label ID="Label1" runat="server" Text="Sale Date :"></asp:Label>
            </td>
            <td class="style5">
                <telerik:RadDatePicker ID="dateSaleDate" Runat="server">
                </telerik:RadDatePicker>
                <telerik:RadButton ID="btnNewItem" runat="server" onclick="btnNewItem_Click" 
                    Text="Add New Item" Width="130px" Visible="False">
                </telerik:RadButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
            <asp:Label ID="lblAppointmentDes2" runat="server" Text="Reason :"></asp:Label>
            </td>
            <td class="style5">
                <telerik:RadComboBox ID="ddlReason" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                            Value="---Select---" Owner="ddlReason" />
                        <telerik:RadComboBoxItem runat="server" Text="Breakfast" Value="30000001" 
                            Owner="ddlReason" />
                        <telerik:RadComboBoxItem runat="server" Text="Dinner" Value="30000002" 
                            Owner="ddlReason" />
                        <telerik:RadComboBoxItem runat="server" Text="Supper" Value="30000003" 
                            Owner="ddlReason" />
<telerik:RadComboBoxItem runat="server" Text="C of N's Party" Value="30000021"></telerik:RadComboBoxItem>
                        <telerik:RadComboBoxItem runat="server" Text="DG's Party" Value="30000006" 
                            Owner="ddlReason" />
                        <telerik:RadComboBoxItem runat="server" Text="Party 1" Value="Party 1" 
                            Owner="ddlReason" />
                        <telerik:RadComboBoxItem runat="server" Text="Party 2" Value="30000022" />
                        <telerik:RadComboBoxItem runat="server" Text="Party 3" Value="30000023" />
                        <telerik:RadComboBoxItem runat="server" Text="Party 4" Value="30000024" />
                        <telerik:RadComboBoxItem runat="server" Text="Party 5" Value="30000025" />
                        <telerik:RadComboBoxItem runat="server" Text="Personal" Value="30000005" 
                            Owner="ddlReason" />
                        <telerik:RadComboBoxItem runat="server" Text="Tea Ration" Value="30000008" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu" Value="30000009" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu 01" Value="30000010" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu 02" Value="30000011" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu 03" Value="30000012" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu 04" Value="30000013" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu 05" Value="30000014" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu 06" Value="30000015" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu 07" Value="30000016" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu 08" Value="30000017" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu 09" Value="30000018" />
                        <telerik:RadComboBoxItem runat="server" Text="Group Menu 10" Value="30000019" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Group Type :</td>
            <td class="style5">
                <telerik:RadComboBox ID="ddlGroupMenu" Runat="server">
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
            Vegetarian/Non-Vegetarian :</td>
            <td class="style5">
            <telerik:RadComboBox ID="ddlVegi" Runat="server">
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
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
            <asp:Label ID="lblWardroom" runat="server" Text="Wardroom :"></asp:Label>
            </td>
            <td class="style5">
                <telerik:RadTextBox ID="txtWardRoom" Runat="server" Enabled="false">
                </telerik:RadTextBox>
                <telerik:RadButton ID="RadButton1" runat="server" onclick="RadButton1_Click" 
                    Text="View Menu " Width="130px">
                </telerik:RadButton>
                <asp:Label ID="lblErrorWardRoom" runat="server"></asp:Label>
            <telerik:RadComboBox ID="ddlWardroom" Runat="server" Visible="False">
            </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Menu :</td>
            <td class="style5" colspan="2">
            <telerik:RadGrid ID="grdReport1" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport_ItemCommand" 
                                onitemdatabound="grdReport1_ItemDataBound" 
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
                                <asp:Label ID="lblSn1" runat="server" />
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
        </tr>
        <tr>
            <td class="style2">
                <asp:LinkButton ID="lblViewCA" runat="server" onclick="lblViewCA_Click">View Ingredients List</asp:LinkButton>
            </td>
            <td class="style5" colspan="2">
            <telerik:RadGrid ID="grdReport0" runat="server" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport0_ItemCommand" 
                                onitemdatabound="grdReport0_ItemDataBound" 
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
                                <asp:Label ID="lblSn0" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                   <telerik:GridBoundColumn DataField="mainItem" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Meal Name" 
                                            UniqueName="mainItem">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Ingredients" 
                                            UniqueName="item">
                        </telerik:GridBoundColumn>
                    
                        <telerik:GridBoundColumn DataField="qty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Qty." 
                                            UniqueName="qty">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Messurment" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Issueqty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Issue Qty." 
                                            UniqueName="Issueqty">
                        </telerik:GridBoundColumn>
                        
                        
                         

                  

                       <%-- <telerik:GridButtonColumn CommandName="deleteItem" 
                            FilterControlAltText="Filter btnDelete column" Text="Delete" 
                            UniqueName="btnDelete">
                        </telerik:GridButtonColumn>--%>
                         

                  

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
            <td class="style5" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
            Total Non-Vegetarian Count :</td>
            <td class="style5" colspan="2">
            <asp:Label ID="lblNonVegetarianCount" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
            Total Vegetarian Count :</td>
            <td class="style5" colspan="2">
            <asp:Label ID="lblVegetarianCount" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:LinkButton ID="lnTotalIngredientsList" runat="server" 
                    onclick="lnTotalIngredientsList_Click">Total Ingredients List</asp:LinkButton>
            </td>
            <td class="style5" colspan="2">
            <telerik:RadGrid ID="grdReport2" runat="server" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" 
                                onitemdatabound="grdReport2_ItemDataBound" PageSize="50" 
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
                                <asp:Label ID="lblSn2" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                   
                        <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Ingredients" 
                                            UniqueName="item">
                        </telerik:GridBoundColumn>
                    
                        <telerik:GridBoundColumn DataField="qty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Qty. for Menu" 
                                            UniqueName="qty">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="currentStock" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Current Stock" 
                                            UniqueName="currentStock">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Messurment" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn>
                           <telerik:GridBoundColumn DataField="itemCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Code" 
                                            UniqueName="itemCode">
                        </telerik:GridBoundColumn>
                              <%--<telerik:GridBoundColumn DataField="currentStock" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Current Stock" 
                                            UniqueName="currentStock">
                        </telerik:GridBoundColumn>--%>
                        
                         

                  

                       <%-- <telerik:GridButtonColumn CommandName="deleteItem" 
                            FilterControlAltText="Filter btnDelete column" Text="Delete" 
                            UniqueName="btnDelete">
                        </telerik:GridButtonColumn>--%>
                         

                  

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
            <asp:Label ID="Label10" runat="server" Text="Item Category :" Visible="False"></asp:Label>
            </td>
            <td class="style5">
            <telerik:RadComboBox ID="ddlItemCat" Runat="server" 
                onselectedindexchanged="ddlItemCat_SelectedIndexChanged" 
                AutoPostBack="True" Width="300px" Visible="False">
            </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
            <asp:Label ID="Label2" runat="server" Text="Item :" Visible="False"></asp:Label>
            </td>
            <td class="style5">
            <telerik:RadComboBox ID="ddlItem" Runat="server" 
                 Width="300px" AutoPostBack="True" 
                    onselectedindexchanged="ddlItem_SelectedIndexChanged" Visible="False">
            </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                <asp:Label ID="lblError" runat="server" Visible="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:LinkButton ID="linkBtnGetInList" runat="server" 
                    onclick="linkBtnGetInList_Click">Get Ingredients Deduction List</asp:LinkButton>
            </td>
            <td colspan="2">
                <asp:GridView ID="grdMedal" runat="server" AutoGenerateColumns="False" 
                    BackColor="#CC0000" CellPadding="4" ForeColor="#333333" GridLines="None" 
                    onrowcreated="Gridview1_RowCreated" onrowdatabound="Gridview1_RowDataBound" 
                    ShowFooter="True" Width="79%" 
                    onselectedindexchanged="grdMedal_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                       <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtID" runat="server" 
                                    MaxLength="10"  ReadOnly="true" Width="60" 
                                    >
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Item ID">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtItemCode" runat="server" 
                                    MaxLength="10"  ReadOnly="true" Width="70" 
                                    >
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Item">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtItem" runat="server" ReadOnly="true" Width="150">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="From">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtFrom" runat="server" ReadOnly="true" 
                                    Width="60">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtPrice" runat="server" ReadOnly="true" 
                                    Width="60">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Mesu">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtMesu" runat="server" ReadOnly="true" 
                                    Width="60">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Stock Qty.">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtOnChargeQty" runat="server" ReadOnly="true" Width="60">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sale Qty.">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtSaleQty" runat="server" ReadOnly="true" Width="60" 
                                    ontextchanged="txtsale_TextChanged" AutoPostBack="True">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                           <asp:TemplateField HeaderText="Current Qty.">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtCurrentQty" runat="server" ReadOnly="true"  
                                    Width="60" >
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                      <%--   <asp:TemplateField HeaderText="Cost">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtTotalCost" runat="server" 
                                    Width="60" >
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#25A0DA" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#25A0DA" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style6">
                <asp:Label ID="Label12" runat="server"></asp:Label>
            </td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                <telerik:RadButton ID="btnGetHandStock" runat="server" 
                    onclick="btnGetHandStock_Click" Text="Get Hand Stock" Width="130px">
                </telerik:RadButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5" colspan="2">
                <asp:LinkButton ID="linkbtnTotalCurrentStock" runat="server" 
                    onclick="linkbtnTotalCurrentStock_Click" Visible="False">Total Current Stock :</asp:LinkButton>
                <asp:Label ID="lblCurrent" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblErrorCurrent" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                <telerik:RadButton ID="btnUpdateStock" runat="server" 
                    onclick="btnUpdateStock_Click" Text="Update Stock" Width="130px">
                </telerik:RadButton>
                
                <asp:Label ID="lblSaveTotalCost" runat="server"></asp:Label>
                
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="lblDate" runat="server" Font-Bold="True" Font-Underline="False"></asp:Label>
&nbsp;-
                <asp:Label ID="lblReason" runat="server" Font-Bold="True" 
                    Font-Underline="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="3">
            <telerik:RadGrid ID="grdReport" runat="server" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport_ItemCommand" 
                                onitemdatabound="grdReport_ItemDataBound" 
                                onneeddatasource="rgdBoardAssessment_NeedDataSource" PageSize="50" 
                                ShowStatusBar="True" Width="83%" 
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
                         <telerik:GridBoundColumn DataField="saleQty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Sale Qty." 
                                            UniqueName="saleQty">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Measurement" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="price" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Price" 
                                            UniqueName="price">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="recevedFrom" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Receved From" 
                                            UniqueName="recevedFrom">
                        </telerik:GridBoundColumn>

                          

                        <telerik:GridBoundColumn DataField="transID" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="ID" 
                                            UniqueName="transID">
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
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Total Cost for Menu :</td>
            <td class="style5">
                
                <asp:Label ID="lblTotalCost" runat="server"></asp:Label>
                
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                
                <telerik:RadButton ID="btnSaveTotalCost" runat="server" 
                    onclick="btnSaveTotalCost_Click" Text="Save Total Menu Cost" Width="130px">
                </telerik:RadButton>
                <asp:Label ID="Label11" runat="server"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
