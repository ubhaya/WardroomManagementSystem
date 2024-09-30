<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewMessurment.aspx.cs" Inherits="victuling_WordRoom.AddNewMessurment" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
        text-decoration: underline;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:98%;">
        <tr>
            <td class="style1">
                <strong>Add New Messurment</strong></td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <telerik:radpanelbar ID="RadPanelBar3" Runat="server" Width ="98%" Skin="Default" 
                    EnableEmbeddedSkins="False" >
                    <Items>
                         <telerik:RadPanelItem runat="server" Text="Search Existing Items in Stock">
                         
                             <ContentTemplate>
                                 <table style="width:100%;">
                                     <tr>
                                         <td>
                                             &nbsp;</td>
                                         <td>
                                             &nbsp;</td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td>
                                             &nbsp;</td>
                                         <td>
                                             &nbsp;</td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                     <tr>
                                         <td>
                                             &nbsp;</td>
                                         <td>
                                             &nbsp;</td>
                                         <td>
                                             &nbsp;</td>
                                     </tr>
                                 </table>
                             </ContentTemplate>
            </telerik:RadPanelItem>
            </Items>
            </telerik:radpanelbar>
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
