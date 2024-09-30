<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="victuling_WordRoom.Login" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .style2
        {
            height: 21px;
            width: 336px;
        }
        .style3
        {
            width: 336px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
    <tr>
        <td class="style2">
            </td>
        <td class="style1">
            </td>
        <td class="style1">
            </td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="lblUserName" runat="server" Text="User Name :"></asp:Label>
        </td>
        <td>
            <telerik:RadTextBox ID="txtUserName" Runat="server">
            </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="lblPassword" runat="server" Text="Password :"></asp:Label>
        </td>
        <td>
            <telerik:RadTextBox ID="txtPassword" Runat="server" TextMode="Password">
            </telerik:RadTextBox>
            
            <asp:Button ID="btnLogin1" runat="server" onclick="btnLogin1_Click" 
                Text="Login" Width="130px" />
            
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            <asp:Label ID="LabelErrorMsg" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            <asp:Label ID="LabelInfoMsg" runat="server" ForeColor="#009933"></asp:Label>
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
</table>
</asp:Content>
