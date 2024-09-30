<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="upload304Details.aspx.cs" Inherits="victuling_WordRoom.upload304Details" %>
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
        .style5
        {
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
            text-align: left;
        }
    .style13
    {
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
            width: 228px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style13" colspan="5">
                <strong>304 Data Enter to the System</strong></td>
        </tr>


        <tr>
            <td class="style13" colspan="5">
                &nbsp;</td>
        </tr>


        <tr>
            <td class="style14">
                <asp:Label ID="Label3" runat="server" Text="Area" ></asp:Label>
            &nbsp;:</td>
            <td class="style15">
                <telerik:RadComboBox ID="ddlArea" Runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlArea_SelectedIndexChanged">
                </telerik:RadComboBox>
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
                <asp:Label ID="Label4" runat="server" Text="Base"></asp:Label>
            &nbsp;:</td>
            <td class="style15">
                <telerik:RadComboBox ID="cmbBase" Runat="server"  >
                </telerik:RadComboBox>

            </td>
            <td>
                &nbsp;</td>
            <td>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                <asp:Label ID="Label5" runat="server" Text="Browse Excel file here"></asp:Label>
            &nbsp;</td>
            <td class="style5">
                <asp:FileUpload ID="FileUpload1" runat="server" />
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
                
            &nbsp;</td>
            <td class="style8">
                <telerik:RadButton ID="rbtUpload" runat="server" Text="Upload" OnClick="rbtUpload_Click"></telerik:RadButton>
            </td>
            <td class="style9">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </td>
            <td class="style9">
                </td>
            <td class="style9">
                </td>
        </tr>

  
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                <telerik:RadComboBox ID="cmbArea" Runat="server" DataSourceID="areaName" 
                    DataTextField="areaName" DataValueField="areaCode" AutoPostBack="true" 
                    OnTextChanged="cmbArea_TextChanged" Visible="False">
                </telerik:RadComboBox>
                <asp:SqlDataSource ID="areaName" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    SelectCommand="select areaCode,areaName from HRIS_M_areas where isActive=1 ">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
