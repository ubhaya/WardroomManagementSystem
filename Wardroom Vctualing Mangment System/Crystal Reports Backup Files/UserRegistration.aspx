<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="victuling_WordRoom.WebForm1" %>
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
            text-align: left;
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
            text-align: left;
        }
        .style7
        {
            width: 170px;
            height: 26px;
            text-align: left;
        }
        .style8
        {
            width: 228px;
            height: 26px;
            text-align: left;
        }
        .style9
        {
            height: 26px;
        }
    .style10
    {
        width: 170px;
        height: 24px;
            text-align: left;
        }
    .style11
    {
        width: 228px;
        height: 24px;
            text-align: left;
        }
    .style12
    {
        height: 24px;
    }
    .style13
    {
        width: 170px;
        text-decoration: underline;
            text-align: left;
        }
        .style14
        {
            width: 170px;
            text-align: left;
        }
        .style15
        {
            text-align: left;
        }
        .style16
        {
            width: 228px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td class="style13">
                <strong>User Registration</strong></td>
            <td class="style16">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                <asp:Label ID="Label1" runat="server" Text="NIC No"></asp:Label>
                . :</td>
            <td class="style16">
                <telerik:RadTextBox ID="txtNicNo" Runat="server" DisplayText="" 
                    LabelWidth="64px" type="text" value="" Width="160px">
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
            <td class="style14">
                <asp:Label ID="Label2" runat="server" Text="Initial"></asp:Label>
            &nbsp;:</td>
            <td class="style16">
                <telerik:RadTextBox ID="txtInitial" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td class="style15">
                <asp:Label ID="Label12" runat="server" Text="Surname"></asp:Label>
            &nbsp;:</td>
            <td class="style15">
                <telerik:RadTextBox ID="txtSurName" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                <asp:Label ID="Label3" runat="server" Text="Rank"></asp:Label>
            &nbsp;:</td>
            <td class="style16">
                <telerik:RadComboBox ID="cmbRank" Runat="server" DataSourceID="RankBind" 
                    DataTextField="rankShort" DataValueField="rankCode">
                </telerik:RadComboBox>
                <asp:SqlDataSource ID="RankBind" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [rankCode], [rankShort], [description] FROM [M_Rank]">
                </asp:SqlDataSource>
            </td>
            <td class="style15">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                <asp:Label ID="Label4" runat="server" Text="Branch"></asp:Label>
            &nbsp;:</td>
            <td class="style16">
                <telerik:RadComboBox ID="cmbBranch" Runat="server" DataSourceID="BranchBind" 
                    DataTextField="branchID" DataValueField="branchCode">
                </telerik:RadComboBox>
                <asp:SqlDataSource ID="BranchBind" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [branchCode], [branchID], [branchName] FROM [M_Branch]">
                </asp:SqlDataSource>
            </td>
            <td class="style15">
                <asp:Label ID="Label13" runat="server" Text="Official No."></asp:Label>
            &nbsp;:</td>
            <td class="style15">
                <telerik:RadTextBox ID="txtOffNo" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                <asp:Label ID="Label5" runat="server" Text="Service Type"></asp:Label>
            &nbsp;:</td>
            <td class="style16">
                <telerik:RadComboBox ID="cmbServiceType" Runat="server" 
                    DataSourceID="ServiceTypeBind" DataTextField="serviceTypeCode" 
                    DataValueField="serviceTypeCode">
                </telerik:RadComboBox>
                <asp:SqlDataSource ID="ServiceTypeBind" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [serviceTypeCode], [serviceType] FROM [M_ServiceType]">
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
            <td class="style14">
                <asp:Label ID="Label7" runat="server" Text="User Name"></asp:Label>
            &nbsp;:</td>
            <td class="style16">
                <telerik:RadTextBox ID="txtUserName" Runat="server">
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
            <td class="style10">
                <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
            &nbsp;:</td>
            <td class="style11">
                <telerik:RadTextBox ID="txtPassword" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td class="style12">
                </td>
            <td class="style12">
                &nbsp;</td>
            <td class="style12">
                </td>
        </tr>
        <tr>
            <td class="style14">
                <asp:Label ID="Label9" runat="server" Text="Re-Enter Password"></asp:Label>
            &nbsp;:</td>
            <td class="style16">
                <telerik:RadTextBox ID="txtRePassword" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <telerik:RadButton ID="btnCreateAccount" runat="server" 
                    onclick="btnCreateAccount_Click" onload="btnCreateAccount_Load" 
                    Text="Create Account" Width="130px">
                </telerik:RadButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Roll :</td>
            <td class="style6">
                <telerik:RadComboBox ID="cmbRoll" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Administrator" Value="1" />
                        <telerik:RadComboBoxItem runat="server" Text="User" Value="2" />
                        <telerik:RadComboBoxItem runat="server" Text="SA" Value="3" />
                        <telerik:RadComboBoxItem runat="server" Text="CA" Value="4" />
                        <telerik:RadComboBoxItem runat="server" Text="MA" Value="5" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td class="style4">
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
            </td>
        </tr>
        <tr>
            <td class="style3">
                Wardroom :</td>
            <td class="style6">
                <telerik:RadComboBox ID="ddlWardroom" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="- - Select - -" 
                            Value="- - Select - -" />
                        <telerik:RadComboBoxItem runat="server" Text="NHQ" Value="60000001" />
                        <telerik:RadComboBoxItem runat="server" Text="Tissa" Value="60000003" />
                        <telerik:RadComboBoxItem runat="server" Text="Rangala" Value="60000004" />
                        <telerik:RadComboBoxItem runat="server" Text="Uththara" Value="60000005" />
                        <telerik:RadComboBoxItem runat="server" Text="Barana" Value="60000006" />
                        <telerik:RadComboBoxItem runat="server" Text="Mahanaga" Value="60000007" />
                        <telerik:RadComboBoxItem runat="server" Text="Dakshina" Value="Dakshina" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style16">
                &nbsp;</td>
            <td colspan="3">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
