<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewCurry.aspx.cs" Inherits="victuling_WordRoom.AddNewCurry" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
    }
    .style2
    {
        text-decoration: underline;
    }
    .style3
    {
        width: 196px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    -<table style="width: 98%;">
    <tr>
        <td class="style2" colspan="3">
                <strong>Add Curry</strong></td>
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
            <asp:Label ID="Label10" runat="server" Text="Item Category :"></asp:Label>
        </td>
        <td>
                <telerik:RadComboBox ID="ddlMealCat" Runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlMealCat_SelectedIndexChanged" Width="250px">
                </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label2" runat="server" Text="Item :"></asp:Label>
        </td>
        <td>
                <telerik:RadComboBox ID="ddlMeal" Runat="server" Width="250px" 
                    AutoPostBack="True" onselectedindexchanged="ddlMeal_SelectedIndexChanged">
                </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label11" runat="server" Text="Remarks :"></asp:Label>
        </td>
        <td>
            <telerik:RadTextBox ID="txtRemarks" Runat="server" Height="22px" Width="267px">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label5" runat="server" Text="Price Per Portion :"></asp:Label>
        </td>
        <td>
            <telerik:RadTextBox ID="txtUnitPrice" Runat="server">
            </telerik:RadTextBox>
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
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            <telerik:RadButton ID="btnAddItem" runat="server" onclick="btnAddItem_Click" 
                Text="Add Item" Width="130px">
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
        <td class="style1" colspan="3">
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
            <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
            </telerik:RadScriptManager>
        </td>
        <td>
            &nbsp;</td>
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
</table>
</asp:Content>
