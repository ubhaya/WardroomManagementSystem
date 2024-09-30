<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CalCostForParty.aspx.cs" Inherits="victuling_WordRoom.CalCostForParty" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
        text-decoration: underline;
    }
    .style2
    {
        width: 235px;
    }
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
    <tr>
        <td class="style1" colspan="3">
            <strong>Calculate Cost For Party and Group Menu </strong>
            </td>
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
                <telerik:RadComboBox ID="cmbDescription" Runat="server">
                </telerik:RadComboBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Wardroom :</td>
        <td>
                <telerik:RadComboBox ID="ddlWardroom" Runat="server">
                </telerik:RadComboBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Vegetarian/Non-Vegetarian :</td>
        <td>
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
                <telerik:RadButton ID="btnView" runat="server" Text="View" 
                    Width="130px" onclick="btnView_Click">
                </telerik:RadButton>
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
                Total Party/Group Menu Cost :</td>
        <td>
                <asp:Label ID="lblMenuCost" runat="server"></asp:Label>
                </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                Count :</td>
        <td>
                <asp:Label ID="lblCount" runat="server"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            Party/Group Cost for Person :</td>
        <td>
                <asp:Label ID="lblMenuCostP" runat="server"></asp:Label>
            </td>
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
