<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cashSummary.aspx.cs" Inherits="victuling_WordRoom.cashSummary" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style2
        {
            text-decoration: underline;
        }
        .style3
    {
        width: 250px;
    }
.rdfd_{position:absolute}
.rdfd_{position:absolute}.rdfd_{position:absolute}
.rdfd_{position:absolute}.rdfd_{position:absolute}
.rdfd_{position:absolute}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput{vertical-align:middle}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}
        .riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}
        .riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png')}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}
        .rbDecorated{display:block;height:22px;padding-right:6px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0}
        .style5
        {
            width: 552px;
        }
    .RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}
.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}
.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}
.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}
.RadComboBox{text-align:left}
.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}
.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
    <tr>
        <td colspan="3">
            <strong><span class="style2">Cash Summary of Victualing Stores </span></strong>
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
                Wardroom :</td>
        <td>
                <telerik:RadTextBox ID="txtWardRoom" Runat="server" Enabled="false">
                </telerik:RadTextBox>
                </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                Year :</td>
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
                Month :</td>
        <td>
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
                <telerik:RadButton ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="View" Width="115px">
                </telerik:RadButton>
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
            &nbsp;</td>
        <td>
            <telerik:RadGrid ID="grdReport" runat="server" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" 
                                PageSize="50" 
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
                       
                      <%--  <telerik:GridBoundColumn DataField="date" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Date" 
                                            UniqueName="date">
                        </telerik:GridBoundColumn>  --%>                               

                         <telerik:GridBoundColumn DataField="description" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Description" 
                                            UniqueName="description">
                        </telerik:GridBoundColumn>           
                                   
                         <telerik:GridBoundColumn DataField="remarks" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Remarks" 
                                            UniqueName="remarks">
                        </telerik:GridBoundColumn>  

                         <telerik:GridBoundColumn DataField="Debit" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Debit" 
                                            UniqueName="Debit">
                        </telerik:GridBoundColumn>     
                                         <telerik:GridBoundColumn DataField="Credit" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Credit" 
                                            UniqueName="Credit">
                        </telerik:GridBoundColumn>
                        
                        
                        
                                              
                          

                        <%--<telerik:GridButtonColumn CommandName="deleteItem" 
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
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
                <table style="width:100%;">
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblTotalCredit" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style4">
                            <asp:Label ID="lblTotalDebit" runat="server"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Balance C/F :</td>
                        <td class="style4">
                            <asp:Label ID="lblCashInHand" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style4" colspan="2">
                           
                            &nbsp;</td>
                    </tr>
                </table>
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
