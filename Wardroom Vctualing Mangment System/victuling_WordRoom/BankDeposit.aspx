<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BankDeposit.aspx.cs" Inherits="victuling_WordRoom.Bank_Deposit" %>
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
    .rdfd_{position:absolute}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}.rcSingle .riSingle{white-space:normal}.RadInput{vertical-align:middle}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
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
                <asp:Label ID="lblBillNo0" runat="server" Text="Date"></asp:Label>
            </td>
            <td>
            <telerik:RadDatePicker ID="txtDate" Runat="server">
            </telerik:RadDatePicker>
                </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblBillNo3" runat="server" Text="Deposit Type"></asp:Label>
            </td>
            <td>
                <telerik:RadComboBox ID="cmbDepositType" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="---Please Select---" 
                            Value="---Please Select---" Selected="True" />
                        <telerik:RadComboBoxItem runat="server" Text="Cash" Value="Cash" />
                        <telerik:RadComboBoxItem runat="server" Text="Checqe" Value="Checqe" />
                    </Items>
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblBillNo1" runat="server" Text="Slip Number"></asp:Label>
            </td>
            <td>
                <telerik:RadTextBox ID="txtSlipNumber" Runat="server" Width="126px">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblBillNo2" runat="server" Text="Deposit Amount Rs: "></asp:Label>
            </td>
            <td>
                <telerik:RadTextBox ID="txtAmount" Runat="server" Width="126px">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" 
                    Width="77px" />
            </td>
            <td>
                &nbsp;</td>
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
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
