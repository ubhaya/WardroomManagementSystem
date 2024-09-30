<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="victuling_WordRoom.Reports" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style2
    {
        width: 202px;
    }
.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput{vertical-align:middle}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}
.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}
.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}
.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}
.RadComboBox{text-align:left}
.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}
.RadComboBox{text-align:left}
.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png')}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}.rbDecorated{display:block;height:22px;padding-right:6px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0}.RadGrid_Default{font:12px/16px "segoe ui",arial,sans-serif}.RadGrid_Default{border:1px solid #828282;background:#fff;color:#333}.RadGrid_Default{font:12px/16px "segoe ui",arial,sans-serif}.RadGrid_Default{border:1px solid #828282;background:#fff;color:#333}.RadGrid_Default .rgMasterTable{font:12px/16px "segoe ui",arial,sans-serif}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid_Default .rgMasterTable{font:12px/16px "segoe ui",arial,sans-serif}.RadGrid .rgMasterTable{border-collapse:separate;border-spacing:0}.RadGrid_Default .rgCommandRow{background:#c5c5c5 0 -2099px repeat-x url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif');color:#000}.RadGrid_Default .rgCommandRow{background:#c5c5c5 0 -2099px repeat-x url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif');color:#000}.RadGrid_Default .rgCommandCell{border:1px solid;border-color:#999 #f2f2f2;border-top-width:0;padding:0}.RadGrid_Default .rgCommandCell{border:1px solid;border-color:#999 #f2f2f2;border-top-width:0;padding:0}.RadGrid_Default .rgCommandTable{border:0;border-top:1px solid #fdfdfd;border-bottom:1px solid #e7e7e7}.RadGrid_Default .rgCommandTable{border:0;border-top:1px solid #fdfdfd;border-bottom:1px solid #e7e7e7}.RadGrid_Default .rgRefresh{margin-right:3px;background-position:0 -1600px}.RadGrid_Default .rgRefresh{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgRefresh{width:18px;height:18px;vertical-align:bottom}.RadGrid .rgRefresh{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid_Default .rgRefresh{margin-right:3px;background-position:0 -1600px}.RadGrid_Default .rgRefresh{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgRefresh{width:18px;height:18px;vertical-align:bottom}.RadGrid .rgRefresh{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid_Default .rgExpXLS{background-position:0 0}.RadGrid_Default .rgExpXLS{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Common.Grid.export.gif')}.RadGrid_Default .rgExpXLS{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgExpXLS{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid_Default .rgExpXLS{background-position:0 0}.RadGrid_Default .rgExpXLS{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Common.Grid.export.gif')}.RadGrid_Default .rgExpXLS{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgExpXLS{width:16px;height:16px;border:0;margin:0;padding:0;background-color:transparent;background-repeat:no-repeat;vertical-align:middle;font-size:1px;cursor:pointer}.RadGrid_Default .rgHeader{color:#333}.RadGrid_Default .rgHeader{border:0;border-bottom:1px solid #828282;background:#eaeaea 0 -2300px repeat-x url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}.RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{cursor:default}.RadGrid_Default .rgHeader{color:#333}.RadGrid_Default .rgHeader{border:0;border-bottom:1px solid #828282;background:#eaeaea 0 -2300px repeat-x url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Grid.sprite.gif')}.RadGrid .rgHeader{padding-top:5px;padding-bottom:4px;text-align:left;font-weight:normal}
        .RadGrid .rgHeader{padding-left:7px;padding-right:7px}.RadGrid .rgHeader{cursor:default}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
    <tr>
        <td colspan="3">
                <strong>Final Monthly Recovery by Service Type</strong></td>
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
            <asp:Label ID="lblWardroom" runat="server" Text="Wardroom :"></asp:Label>
            </td>
        <td>
             <telerik:RadTextBox ID="txtWardRoom" Runat="server" ReadOnly ="true">
          </telerik:RadTextBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Year :</td>
        <td>
            <telerik:RadComboBox ID="ddlYear" Runat="server" 
                >
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
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Service Type :
        </td>
        <td>
            <telerik:RadComboBox ID="ddlServiceType" Runat="server">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                        Value="---Select---" />
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
        <td class="style2">
            Recovery Type :</td>
        <td>
            <telerik:RadComboBox ID="ddlRecoveryType" Runat="server">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="Monthly Recovery" 
                        Value="Monthly Recovery" />
                    <telerik:RadComboBoxItem runat="server" Text="Pending Recovery" 
                        Value="Pending Recovery" />
                </Items>
            </telerik:RadComboBox>
            <telerik:RadButton ID="btnView" runat="server" onclick="btnView_Click" 
                Text="View " Width="130px">
            </telerik:RadButton>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td colspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td colspan="2">
            <asp:Panel ID="Panel1" runat="server">
                <telerik:RadGrid ID="grdReport1" runat="server" 
                                AllowSorting="True" 
    AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" 
                                onitemdatabound="grdReport1_ItemDataBound" PageSize="50" 
                                ShowStatusBar="True" Width="100%" 
                >
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
                            <telerik:GridBoundColumn DataField="branchID" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Branch" 
                                            UniqueName="branchID">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="officialNo" 
                                            FilterControlAltText="Filter Official_NO column" 
                                            HeaderText="Official No." UniqueName="officialNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rankRate" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Rank/Rate" 
                                            UniqueName="rankRate">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="name" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Name" 
                                            UniqueName="name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="individualTotalCost" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Total Meal Cost" 
                                            UniqueName="individualTotalCost">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="creditDebit" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Credit/Debit" 
                                            UniqueName="creditDebit">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="debit" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Debit" 
                                            UniqueName="debit">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Messsub" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Mess Substitute" 
                                            UniqueName="Messsub">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="barBill" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Bar Bill" 
                                            UniqueName="barBill">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TotRecovery" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Total Recovery" 
                                            UniqueName="TotRecovery">
                            </telerik:GridBoundColumn>
                            <%-- <telerik:GridBoundColumn DataField="noOfDays" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="No. Of Days" 
                                            UniqueName="noOfDays">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="costPerDay" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Cost Per Day" 
                                            UniqueName="costPerDay">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="creditDebit" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Credit/Debit" 
                                            UniqueName="creditDebit">
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
            </asp:Panel>
        </td>
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
        <td colspan="2">
            <asp:Panel ID="Panel2" runat="server">
                <telerik:RadGrid ID="grdReport2" runat="server" 
                                AllowSorting="True" 
    AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" 
                                onitemdatabound="grdReport2_ItemDataBound" PageSize="50" 
                                ShowStatusBar="True" Width="100%" 
                >
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
                            <telerik:GridBoundColumn DataField="branchID" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Branch" 
                                            UniqueName="branchID">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="offno" 
                                            FilterControlAltText="Filter Official_NO column" 
                                            HeaderText="Official No." UniqueName="offno">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rankRate" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Rank/Rate" 
                                            UniqueName="rankRate">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="name" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Name" 
                                            UniqueName="name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="recoverDiningAmmount" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Pending Dining" 
                                            UniqueName="recoverDiningAmmount">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="recoverWineAmmount" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Pending Wine" 
                                            UniqueName="recoverWineAmmount">
                            </telerik:GridBoundColumn>
                         
                        
                          
                            <telerik:GridBoundColumn DataField="TotRecovery" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Total Recovery" 
                                            UniqueName="TotRecovery">
                            </telerik:GridBoundColumn>
                            <%-- <telerik:GridBoundColumn DataField="noOfDays" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="No. Of Days" 
                                            UniqueName="noOfDays">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="costPerDay" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Cost Per Day" 
                                            UniqueName="costPerDay">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="creditDebit" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Credit/Debit" 
                                            UniqueName="creditDebit">
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
            </asp:Panel>
        </td>
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
