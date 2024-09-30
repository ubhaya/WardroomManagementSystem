<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/ResetPassword.aspx.cs" Inherits="victuling_WordRoom.WebForm2" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 170px;
        }
        .style3
        {
            width: 170px;
            height: 21px;
        }
        .style4
        {
            height: 21px;
        }
        .style5
        {
            width: 228px;
        }
        .style6
        {
            height: 21px;
            width: 228px;
        }
        .style7
        {
            width: 170px;
            height: 26px;
        }
        .style8
        {
            width: 228px;
            height: 26px;
        }
        .style9
        {
            height: 26px;
        }
    .style10
    {
        width: 170px;
        text-decoration: underline;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td class="style10">
                <strong>Reset&nbsp; Password</strong></td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="NIC No"></asp:Label>
            &nbsp;:</td>
            <td class="style5">
                <telerik:RadComboBox ID="cmbNIC" Runat="server" DataSourceID="NicNoBind" 
                    DataTextField="nicNo" DataValueField="nicNo" 
                    onselectedindexchanged="cmbNIC_SelectedIndexChanged" AutoPostBack="True">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Administrator" Value="1" />
                        <telerik:RadComboBoxItem runat="server" Text="User" Value="2" />
                    </Items>
                </telerik:RadComboBox>
                <asp:SqlDataSource ID="NicNoBind" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [nicNo] FROM [T_Login]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="Initial"></asp:Label>
            &nbsp;:</td>
            <td class="style5">
                <telerik:RadTextBox ID="txtInitial" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Surname"></asp:Label>
            &nbsp;:</td>
            <td>
                <telerik:RadTextBox ID="txtSurName" Runat="server" 
                   >
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="Rank"></asp:Label>
            &nbsp;:</td>
            <td class="style5">
                <telerik:RadTextBox ID="txtRank" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="Branch"></asp:Label>
            &nbsp;:</td>
            <td class="style5">
                <telerik:RadTextBox ID="txtBranch" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                <asp:Label ID="Label13" runat="server" Text="Official No. :"></asp:Label>
            </td>
            <td>
                <telerik:RadTextBox ID="txtOffNo" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="Service Type"></asp:Label>
            &nbsp;:</td>
            <td class="style5">
                <telerik:RadTextBox ID="txtServiceType" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label>
            &nbsp;:</td>
            <td class="style8">
                <telerik:RadTextBox ID="txtEmail" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td class="style9">
                </td>
            <td class="style9">
                </td>
            <td class="style9">
                </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label7" runat="server" Text="User Name"></asp:Label>
            &nbsp;:</td>
            <td class="style5">
                <telerik:RadTextBox ID="txtUserName" Runat="server" 
                    >
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
            &nbsp;:</td>
            <td class="style8">
                <telerik:RadTextBox ID="txtPassword" Runat="server" TextMode="Password">
                </telerik:RadTextBox>
            </td>
            <td class="style9">
                </td>
            <td class="style9">
                &nbsp;</td>
            <td class="style9">
                </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label9" runat="server" Text="Re-Enter Password"></asp:Label>
            &nbsp;:</td>
            <td class="style5">
                <telerik:RadTextBox ID="txtRePassword" Runat="server" TextMode="Password">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Roll</td>
            <td class="style6">
                <telerik:RadTextBox ID="TxtRoll" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td class="style4">
            </td>
            <td class="style4">
            </td>
            <td class="style4">
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>

                <telerik:RadButton ID="btnResetPassword" runat="server" Text="Reset Password" 
                    onclick="btnResetPassword_Click">
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>
