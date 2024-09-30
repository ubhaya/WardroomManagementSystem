<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCivilDoctorNameList.aspx.cs" Inherits="victuling_WordRoom.AddCivilDoctorNameList" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        width: 161px;
    }
        .style2
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style2" colspan="3">
                <strong>Add Civil Doctor&nbsp; </strong>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label1" runat="server" Text="Initial :"></asp:Label>
            </td>
            <td>
                <telerik:RadTextBox ID="txtInitial" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Text="Surname :"></asp:Label>
            </td>
            <td>
                <telerik:RadTextBox ID="txtSurname" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Rank :</td>
            <td>
                <telerik:RadComboBox ID="ddlRank" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="None" Value="12101123" 
                            Owner="ddlRank" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label3" runat="server" Text="Service Type :"></asp:Label>
            </td>
            <td>
                <telerik:RadComboBox ID="ddlServiceType" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Civil" Value="Civil" 
                            Owner="ddlServiceType" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label4" runat="server" Text="Official No. :"></asp:Label>
            </td>
            <td>
                <telerik:RadTextBox ID="txtOffNo" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Perment Base : </td>
            <td>
                <telerik:RadComboBox ID="ddlBaseAll" Runat="server" onselectedindexchanged="ddlBaseAll_SelectedIndexChanged" 
                    >
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Temporary Base :</td>
            <td>
                <telerik:RadComboBox ID="ddlTBase" Runat="server">
                </telerik:RadComboBox>
                <telerik:RadButton ID="btnSave" runat="server" Text="Save" Width="130px" 
                    onclick="btnSave_Click">
                </telerik:RadButton>
                <telerik:RadButton ID="RadButton1" runat="server" onclick="RadButton1_Click" 
                    Text="Add New" Width="130px">
                </telerik:RadButton>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
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
