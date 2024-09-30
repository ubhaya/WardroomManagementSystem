<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeaRetionCalculation.aspx.cs" Inherits="victuling_WordRoom.TeaRetionCalculation" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style2
    {
        text-decoration: underline;
    }
    .style3
    {
    }
    .RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
    .RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}
.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}
.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
    .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
    .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
    .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
      .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
    <tr>
        <td class="style2" colspan="3">
            <strong>
                Monthly Tea Ration </strong>
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
            <asp:Label ID="lblAppointmentDes2" runat="server" Text="Reason :"></asp:Label>
            </td>
        <td>
                <telerik:RadComboBox ID="ddlReason" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Tea Ration " Value="30000018" />
                        <telerik:RadComboBoxItem runat="server" Text="Cash" Value="30000022" />
                        <telerik:RadComboBoxItem runat="server" Text="Credit" Value="30000007" />
                        <telerik:RadComboBoxItem runat="server" Text="C of N Office Tea Ration " 
                            Value="30000025" />
                        <telerik:RadComboBoxItem runat="server" Text="Depreciation" 
                            Value="30000010" Owner="ddlReason" />
                        <telerik:RadComboBoxItem runat="server" Text="845 - C of N's Party" 
                            Value="30000011" />
                        <telerik:RadComboBoxItem runat="server" Text="845 - DG's Party" 
                            Value="30000012" />
                        <telerik:RadComboBoxItem runat="server" Text="845 - Party 1 " 
                            Value="30000013" />
                        <telerik:RadComboBoxItem runat="server" Text="845 - Party 2" Value="30000014" />
                        <telerik:RadComboBoxItem runat="server" Text="845 - Party 3" Value="30000015" />
                        <telerik:RadComboBoxItem runat="server" Text="845 - Party 4" Value="30000016" />
                        <telerik:RadComboBoxItem runat="server" Text="845 - Party 5" Value="30000017" />
<telerik:RadComboBoxItem runat="server" Text="SBS" Value="30000024"></telerik:RadComboBoxItem>
                    </Items>
                </telerik:RadComboBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                <asp:Label ID="lblBillNo" runat="server" Text="Year"></asp:Label>
            &nbsp;:</td>
        <td>
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
                <asp:Label ID="Label2" runat="server" Text="Month :"></asp:Label>
        </td>
        <td>
            <telerik:RadComboBox ID="ddlMonth" Runat="server">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                        Value="---Select---" />
                    <telerik:RadComboBoxItem runat="server" Text="January" Value="1" />
                    <telerik:RadComboBoxItem runat="server" Text="February" Value="2" />
                    <telerik:RadComboBoxItem runat="server" Text="March" Value="3" />
                    <telerik:RadComboBoxItem runat="server" Text="April" Value="2020-03-16" />
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
                <telerik:RadButton ID="RadButton1" runat="server" onclick="RadButton1_Click" 
                    Text="View Details" Width="117px">
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
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3" colspan="2">
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
                                <asp:Label ID="lblSn1" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="depreciationDate" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Date" 
                                            UniqueName="depreciationDate">
                        </telerik:GridBoundColumn>                                 

                         <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item" 
                                            UniqueName="item">
                        </telerik:GridBoundColumn>           
                                   
                         <telerik:GridBoundColumn DataField="unitPrice" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Unit Price" 
                                            UniqueName="unitPrice">
                        </telerik:GridBoundColumn>  

                           
                                         <telerik:GridBoundColumn DataField="depreciationQty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="depreciation Qty" 
                                            UniqueName="depreciationQty">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Messurment" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn> 
                        
                         <telerik:GridBoundColumn DataField="price" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Total" 
                                            UniqueName="price">
                        </telerik:GridBoundColumn> 
                        
                          <telerik:GridBoundColumn DataField="recevedFrom" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="From" 
                                            UniqueName="recevedFrom">
                        </telerik:GridBoundColumn>                       
                          

                      
                         
                       
                         
                   
                        <%--  <telerik:GridBoundColumn DataField="depreciationID" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="ID" 
                                            UniqueName="depreciationID">
                        </telerik:GridBoundColumn>       --%>

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
                <asp:Label ID="Label1" runat="server" Text="Total Ration Cost - Rs :" 
                    Visible="False"></asp:Label>
                </td>
        <td>
                <asp:Label ID="lblTot" runat="server" Font-Size="Large" Visible="false"
                    style="font-weight: 700; color: #0000FF;"></asp:Label>
              
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                Tea Count :</td>
        <td>
                <asp:Label ID="lblTeaCount" runat="server"></asp:Label>
              
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Plain Tea Count :</td>
        <td>
            <asp:Label ID="lblPlainTeaCout" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
