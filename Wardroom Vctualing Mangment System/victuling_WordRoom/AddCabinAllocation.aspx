<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCabinAllocation.aspx.cs" Inherits="victuling_WordRoom.AddCabinAllocation" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style2
    {
        text-decoration: underline;
    }
    .style3
    {
        width: 307px;
    }
.RadGrid_Default{font:12px/16px "segoe ui",arial,sans-serif}.RadGrid_Default{border:1px solid #828282;background:#fff;color:#333}.RadGrid_Default{border:1px solid #828282;background:#fff;color:#333}.RadGrid_Default{font:12px/16px "segoe ui",arial,sans-serif}.RadGrid_Default .rgMasterTable{font:12px/16px "segoe ui",arial,sans-serif}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid_Default .rgMasterTable{font:12px/16px "segoe ui",arial,sans-serif}.RadGrid_Default .rgCommandRow{background:#c5c5c5 0 -2099px repeat-x url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif');color:#000}.RadGrid_Default .rgCommandRow{background:#c5c5c5 0 -2099px repeat-x url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif');color:#000}.RadGrid_Default .rgCommandCell{border:1px solid;border-color:#999 #f2f2f2;border-top-width:0;padding:0}.RadGrid_Default .rgCommandCell{border:1px solid;border-color:#999 #f2f2f2;border-top-width:0;padding:0}.RadGrid_Default .rgCommandTable{border:0;border-top:1px solid #fdfdfd;border-bottom:1px solid #e7e7e7}.RadGrid_Default .rgCommandTable{border:0;border-top:1px solid #fdfdfd;border-bottom:1px solid #e7e7e7}.RadGrid_Default .rgRefresh{margin-right:3px;background-position:0 -1600px}.RadGrid_Default .rgRefresh{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgRefresh{width:18px;height:18px;vertical-align:bottom}.RadGrid .rgRefresh{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid .rgRefresh{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid .rgRefresh{width:18px;height:18px;vertical-align:bottom}.RadGrid_Default .rgRefresh{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid_Default .rgRefresh{margin-right:3px;background-position:0 -1600px}.RadGrid_Default .rgExpXLS{background-position:0 0}.RadGrid_Default .rgExpXLS{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Common.Grid.export.gif')}.RadGrid_Default .rgExpXLS{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgExpXLS{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid .rgExpXLS{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid_Default .rgExpXLS{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid_Default .rgExpXLS{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Common.Grid.export.gif')}.RadGrid_Default .rgExpXLS{background-position:0 0}.RadGrid_Default .rgHeader{color:#333}.RadGrid_Default .rgHeader{border:0;border-bottom:1px solid #828282;background:#eaeaea 0 -2300px repeat-x url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{cursor:default}.RadGrid .rgHeader{cursor:default}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid_Default .rgHeader{border:0;border-bottom:1px solid #828282;background:#eaeaea 0 -2300px repeat-x url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid_Default .rgHeader{color:#333}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
    <tr>
        <td class="style2" colspan="3">
            <strong>Add Cabin Allocation</strong></td>
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
            Block No. :</td>
        <td>
            <telerik:RadComboBox ID="ddlBlockNo" Runat="server" Width="250px" 
                AutoPostBack="True" onselectedindexchanged="ddlBlockNo_SelectedIndexChanged">
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Cabin No. :</td>
        <td>
            <telerik:RadComboBox ID="ddlCabinNo" Runat="server" Width="250px">
            </telerik:RadComboBox>
            <asp:LinkButton ID="linkCabinList" runat="server" onclick="linkCabinList_Click">Get Cabin Members</asp:LinkButton>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            <telerik:RadGrid ID="grdReport0" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" 
                                onitemdatabound="grdReport0_ItemDataBound" 
                                PageSize="50" 
                                ShowStatusBar="True" Width="70%" 
                onitemcommand="grdReport0_ItemCommand">
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
                          <telerik:GridBoundColumn DataField="branchID" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Branch" 
                                            UniqueName="branchID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="officialNo" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Official No." 
                                            UniqueName="officialNo">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="rankRate" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Rate" 
                                            UniqueName="rankRate">
                        </telerik:GridBoundColumn>
                 
                            <telerik:GridBoundColumn DataField="name" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Name" 
                                            UniqueName="name">
                        </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="livingInOut" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="living In/Out" 
                                            UniqueName="livingInOut">
                        </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="cabinTelephoneNo" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Cabin Tel.No." 
                                            UniqueName="cabinTelephoneNo">
                        </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="telephoneNo" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Mobile No." 
                                            UniqueName="telephoneNo">
                        </telerik:GridBoundColumn>

                               <telerik:GridBoundColumn DataField="remarks" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Remarks" 
                                            UniqueName="remarks">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="id" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="ID" 
                                            UniqueName="id">
                        </telerik:GridBoundColumn>

                           <telerik:GridButtonColumn CommandName="deleteItem" 
                            FilterControlAltText="Filter btnDelete column" Text="Delete" 
                            UniqueName="id">
                        </telerik:GridButtonColumn>
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
        <td class="style3">
            Area :</td>
        <td>
            <telerik:RadComboBox ID="ddlArea" Runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlArea_SelectedIndexChanged" Width="250px">
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Base :</td>
        <td>
            <telerik:RadComboBox ID="ddlBase" Runat="server" 
                onselectedindexchanged="ddlBase_SelectedIndexChanged" Width="250px">
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Rank/Rate :</td>
        <td>
                <telerik:RadComboBox ID="ddlRankRate" Runat="server" 
                    onselectedindexchanged="ddlRankRate_SelectedIndexChanged" Width="250px">
                </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Branch :</td>
        <td>
                <telerik:RadComboBox ID="ddlBranch" Runat="server" Width="250px">
                </telerik:RadComboBox>
                <asp:LinkButton ID="linkOffNoList" runat="server" 
                onclick="linkOffNoList_Click">Get Official No. List</asp:LinkButton>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Official No. :</td>
        <td>
            <telerik:RadComboBox ID="ddlOffNo" Runat="server" Width="250px" 
                AutoPostBack="True" onselectedindexchanged="ddlOffNo_SelectedIndexChanged">
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Name :</td>
        <td>
            <telerik:RadComboBox ID="lblName" Runat="server" Width="250px">
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Service Type :</td>
        <td>
            <telerik:RadComboBox ID="ddlServiceType" Runat="server" Width="250px">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" Value="---Select---" />
                    <telerik:RadComboBoxItem runat="server" Text="RNF" Value="RNF" />
                    <telerik:RadComboBoxItem runat="server" Text="VNF" Value="VNF" />
                    <telerik:RadComboBoxItem runat="server" Text="RNR" Value="RNR" />
                    <telerik:RadComboBoxItem runat="server" Text="VNR" Value="VNR" />
                </Items>
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Living In/Out :</td>
        <td>
            <telerik:RadComboBox ID="ddlLivingInOut" Runat="server" Width="250px">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="- - Select - -" 
                        Value="- - Select - -" />
                    <telerik:RadComboBoxItem runat="server" Text="Living In - Victualing In - 304" Value="Living In - Victualing In - 304" />
                    <telerik:RadComboBoxItem runat="server" Text="Living In/Victual out" Value="Living In/Victual out" />
                    <telerik:RadComboBoxItem runat="server" Text="Living out/Victual Out" Value="Living out/Victual Out" />
                    <telerik:RadComboBoxItem runat="server" Text="Victualing In" Value="Victualing In" />
                    <telerik:RadComboBoxItem runat="server" Text="Victualing Out" Value="Victualing Out" />
                    <telerik:RadComboBoxItem runat="server" Text="Living In" Value="Living In" />
                    <telerik:RadComboBoxItem runat="server" Text="Living Out" Value="Living Out" />
                </Items>
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Permanent/Temporary :</td>
        <td>
            <telerik:RadComboBox ID="ddlPerTemp" Runat="server" Width="250px">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="- - Select - -" 
                        Value="- - Select - -" />
                    <telerik:RadComboBoxItem runat="server" Text="Permanent" Value="Permanent" />
                    <telerik:RadComboBoxItem runat="server" Text="Temporary" Value="Temporary" />
                </Items>
            </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Office Contact No. :</td>
        <td>
            <telerik:RadTextBox ID="txtOfficeNo" Runat="server">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Personal Contact No. :</td>
        <td>
            <telerik:RadTextBox ID="txtPersonalNo" Runat="server">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Date : </td>
        <td>
            <telerik:RadDatePicker ID="dateFrom" Runat="server">
            </telerik:RadDatePicker>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Remarks :</td>
        <td>
            <telerik:RadTextBox ID="txtRemarks" Runat="server" Height="50px" 
                TextMode="MultiLine" Width="100%">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            <telerik:RadButton ID="btnSave" runat="server" Text="Save" Width="117px" 
                onclick="btnSave_Click">
            </telerik:RadButton>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
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
