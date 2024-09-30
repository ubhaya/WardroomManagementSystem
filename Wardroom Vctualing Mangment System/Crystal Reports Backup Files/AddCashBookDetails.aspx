<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCashBookDetails.aspx.cs" Inherits="victuling_WordRoom.AddCashBookDetails" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style2
    {
        }
        .style5
        {
            width: 194px;
        }
        .style6
        {
            width: 198px;
        }
        .style7
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="3" class="style7">
            <strong>Add Cash Book Details</strong></td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Date :</td>
            <td>
            <telerik:RadDatePicker ID="dateTo" Runat="server">
            </telerik:RadDatePicker>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Wardroom :</td>
            <td>
                <telerik:RadTextBox ID="txtWardRoom" Runat="server" Enabled="false">
                </telerik:RadTextBox>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Description :</td>
            <td>
                <telerik:RadComboBox ID="ddlDescription" Runat="server" 
                    onselectedindexchanged="ddlDescription_SelectedIndexChanged" 
                    AutoPostBack="True">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="- - Select - -" 
                            Value="- - Select - -" />
                        <telerik:RadComboBoxItem runat="server" Text="Cash W/R from Bank" 
                            Value="1101" />
                        <telerik:RadComboBoxItem runat="server" Text="Wardroom Purchasing" 
                            Value="1102" />
                        <telerik:RadComboBoxItem runat="server" Text="Cash Sale In" Value="1103" />
                        <telerik:RadComboBoxItem runat="server" Text="Bank Deposit" Value="1104" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Panel ID="Panel1" runat="server">
                    <table style="width:100%;">
                        <tr>
                            <td class="style5">
                                Bill No. :</td>
                            <td>
                                <telerik:RadComboBox ID="ddlBillNo" Runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="ddlBillNo_SelectedIndexChanged">
                                </telerik:RadComboBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Cost :
                            </td>
                            <td>
                                <telerik:RadComboBox ID="ddlBillCost" Runat="server">
                                </telerik:RadComboBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Bill Discount :</td>
                            <td>
                                <telerik:RadTextBox ID="txtBillDiscount" Runat="server" Text="0.00">
                                </telerik:RadTextBox>
                                <asp:LinkButton ID="linkGetBillCost" runat="server" 
                                    onclick="linkGetBillCost_Click">Deduct Discount</asp:LinkButton>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Bill Value :</td>
                            <td>
                                <asp:Label ID="lblBillCost" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Remark :</td>
                            <td>
                                <telerik:RadTextBox ID="RadTextBox1" Runat="server" TextMode="MultiLine" 
                                    Width="250px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Panel ID="Panel2" runat="server">
                    <table style="width:100%;">
                        <tr>
                            <td class="style5">
                                Remark :</td>
                            <td>
                                <telerik:RadTextBox ID="txtRemarks" Runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Cost :
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtCost" Runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Credit/Debit :</td>
            <td>
                <telerik:RadComboBox ID="ddlCreditDebit" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="- - Select - -" 
                            Value="- - Select - -" />
                        <telerik:RadComboBoxItem runat="server" Text="Debit" Value="D" />
                        <telerik:RadComboBoxItem runat="server" Text="Credit" Value="C" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                <telerik:RadButton ID="btnSave" runat="server" onclick="btnSave_Click" 
                    Text="Save" Width="115px">
                </telerik:RadButton>
                <telerik:RadButton ID="btnEdit" runat="server" Text="Edit" Width="115px">
                </telerik:RadButton>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
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
