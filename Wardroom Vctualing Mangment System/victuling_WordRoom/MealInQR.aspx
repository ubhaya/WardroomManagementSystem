<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MealInQR.aspx.cs" Inherits="victuling_WordRoom.MealInQR" MaintainScrollPositionOnPostback ="true" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

        <script type="text/javascript">
            function showpreview(input) {

                if (input.files && input.files[0]) {

                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#imgpreview').css('visibility', 'visible');
                        $('#imgpreview').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }

            }

    </script> 

<style type="text/css">
    .auto-style1 {
        height: 21px;
    }
    .auto-style2 {
        width: 226px;
    }
    .auto-style3 {
        height: 21px;
        width: 226px;
    }
.RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png')}.RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png')}.rbDecorated{display:block;height:22px;padding-right:6px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}.rbDecorated{display:block;height:22px;padding-right:6px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}
    .auto-style4 {
        text-decoration: underline;
    }
.rdfd_{position:absolute}.rdfd_{position:absolute}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadGrid_Default{font:12px/16px "segoe ui",arial,sans-serif}.RadGrid_Default{border:1px solid #828282;background:#fff;color:#333}.RadGrid_Default .rgMasterTable{font:12px/16px "segoe ui",arial,sans-serif}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid_Default .rgCommandRow{background:#c5c5c5 0 -2099px repeat-x url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif');color:#000}.RadGrid_Default .rgCommandCell{border:1px solid;border-color:#999 #f2f2f2;border-top-width:0;padding:0}.RadGrid_Default .rgCommandTable{border:0;border-top:1px solid #fdfdfd;border-bottom:1px solid #e7e7e7}.RadGrid_Default .rgRefresh{margin-right:3px;background-position:0 -1600px}.RadGrid_Default .rgRefresh{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgRefresh{width:18px;height:18px;vertical-align:bottom}.RadGrid .rgRefresh{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid_Default .rgExpXLS{background-position:0 0}.RadGrid_Default .rgExpXLS{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Common.Grid.export.gif')}.RadGrid_Default .rgExpXLS{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgExpXLS{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid_Default .rgHeader{color:#333}.RadGrid_Default .rgHeader{border:0;border-bottom:1px solid #828282;background:#eaeaea 0 -2300px repeat-x url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{cursor:default}</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style4" colspan="3">
            <strong>Meal Attendance</strong></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">
                <%--<asp:Image ID="imgPerson" runat="server" Height="118px" Width="110px" />--%>
                <asp:Image ID="imgPerson" runat="server" ImageUrl="~/image/person.png" Width="79%" Height="100%" />
                </td>
            <td>
                <asp:Label ID="lblNic" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Official Number :</td>
            <td>
                <asp:Label ID="lblBranch" runat="server"></asp:Label>
                <asp:Label ID="txtOfficialNumber" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Rank :</td>
            <td>
                <asp:Label ID="lblRank" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Name :</td>
            <td>
                <asp:Label ID="lblFullName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Permanent Base :</td>
            <td>
                <asp:Label ID="lblPermanentBase" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Select Date :</td>
            <td>
            <telerik:RadDatePicker ID="dateSelected" Runat="server">
            </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Reason :</td>
            <td>
                <telerik:RadComboBox ID="cmbDescription" runat="server" AutoPostBack="false">
                </telerik:RadComboBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Group Type :</td>
            <td>
                <telerik:RadComboBox ID="ddlGroupMenu" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGroupMenu_SelectedIndexChanged">
                </telerik:RadComboBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Wardroom :</td>
            <td>
            <telerik:RadTextBox ID="txtWardRoom" Runat="server" ReadOnly="True">
            </telerik:RadTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1"></td>
            <td class="auto-style3">Non-Veg.
            Menu :</td>
            <td class="auto-style1">
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
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Veg.
            Menu :</td>
            <td>
            <telerik:RadGrid ID="grdReport0" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport0_ItemCommand" 
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
        </tr>

                   <div class="row">
                                                <video width="350" height="400" id="preview"></video>

                                            </div>

       
    <script src="Scripts/jquery-3.4.1.min.js"></script>
        <%-- <telerik:GridBoundColumn DataField="mainItemCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Code" 
                                            UniqueName="mainItemCode">
                        </telerik:GridBoundColumn>--%>
    
    <script src="Scripts/instascan.min.js"></script>
        <script type="text/javascript">
            var scanner = new Instascan.Scanner({ video: document.getElementById('preview'), scanPeriod: 5, mirror: false, refractoryPeriod: 10000 });
            scanner.addListener('scan', function (content) {



                //alert(content);

                $.ajax({
                    url: 'MealInQR.aspx/GetNavalPerson',
                    method: 'post',
                    contentType: 'application/json',
                    data: '{"contentcame":' + '"' + content + '"' + '}',
                    dataType: 'json',
                    success: function (data) {
                        console.log("data came", data);
                        window.location.href = "MealInQR.aspx" + "?param1=" + data.d + "";
                    },
                    error: function (err) {
                        console.log(err)
                    }
                })


                //window.open(content);
                //window.location.href=content;
            });
            Instascan.Camera.getCameras().then(function (cameras) {
                if (cameras.length > 0) {
                    scanner.start(cameras[0]);
                    $('[name="options"]').on('change', function () {
                        if ($(this).val() == 1) {
                            if (cameras[0] != "") {
                                scanner.start(cameras[0]);
                            } else {
                                //alert('No Front camera found!');
                                console.error('No cameras found.');
                            }
                        } else if ($(this).val() == 2) {
                            if (cameras[1] != "") {
                                scanner.start(cameras[1]);
                            } else {
                                //alert('No Back camera found!');
                                console.error('No cameras found.');
                            }
                        }
                    });
                } else {
                    console.error('No cameras found.');
                    //alert('No cameras found.');
                }
            }).catch(function (e) {
                console.error(e);
                //alert(e);
            });
    </script>


        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Meal Count :</td>
            <td>
            <telerik:RadComboBox ID="ddlMealCOunt" Runat="server">
                <Items>
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
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Meal Type :</td>
            <td>
            <asp:RadioButtonList ID="rdoVegi" runat="server" AutoPostBack="True" 
                Height="18px" onselectedindexchanged="rdoVegi_SelectedIndexChanged" 
                RepeatDirection="Horizontal" style="margin-bottom: 0px" Width="30%">
                <asp:ListItem Value="Vegetarian">Vegetarian</asp:ListItem>
                <asp:ListItem Value="Non-Vegetarian" Selected="True">Non-Vegetarian</asp:ListItem>
            </asp:RadioButtonList>
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">Meal In/Out :</td>
            <td>
            <asp:RadioButtonList ID="rdoMealInOut" runat="server" AutoPostBack="True" 
                Height="18px" onselectedindexchanged="rdoMealInOut_SelectedIndexChanged" 
                RepeatDirection="Horizontal" style="margin-bottom: 0px" Width="30%">
                <asp:ListItem Value="1" Selected="True">Meal In</asp:ListItem>
                <asp:ListItem Value="0">Meal Out</asp:ListItem>
            </asp:RadioButtonList>
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>
            <telerik:RadButton ID="btnAddMenu" runat="server" Text="In/Out Menu" 
                Width="130px" onclick="btnAddMenu_Click">
            </telerik:RadButton>
            <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>
            <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
            </telerik:RadScriptManager>
            </td>
        </tr>

    </table>
                                             
</asp:Content>
