<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddGroupMenu.aspx.cs" Inherits="victuling_WordRoom.AddGroupMenu" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }

        .style7
        {
            text-decoration: underline;
        }
        .style4
    {
        text-decoration: underline;
    }
        .style8
        {
            width: 93px;
        }
    
        .auto-style1
        {
            width: 196px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style7" colspan="3">
                <strong>Create Menu</strong></td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>
            &nbsp;:</td>
            <td class="auto-style1" colspan="2">
                <telerik:RadDatePicker ID="txtDate" runat="server">
                </telerik:RadDatePicker>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
            &nbsp;:</td>
            <td class="auto-style1" colspan="2">
                <telerik:RadComboBox ID="cmbDescription" runat="server" AutoPostBack="false">
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                <asp:Label ID="Label3" runat="server" Text="Item Category"></asp:Label>
            &nbsp;:</td>
            <td class="auto-style1" colspan="2">
                <telerik:RadComboBox ID="cmbItemCategory" runat="server" AutoPostBack="True" 
                    OnTextChanged="cmbItemCategory_TextChanged" Width="300px" 
                    onselectedindexchanged="cmbItemCategory_SelectedIndexChanged">
                </telerik:RadComboBox>
            </td>
        </tr>
        <tr>
            <td class="style8">
                <asp:Label ID="Label4" runat="server" Text="Item"></asp:Label>
            &nbsp;:</td>
            <td colspan="2">
                <telerik:RadComboBox ID="cmbItem" runat="server" AutoPostBack="True" OnTextChanged="cmbItem_TextChanged" Width="300px">
                </telerik:RadComboBox>
                <telerik:RadButton ID="btnAddItem" runat="server" Text="Add Item" 
                    OnClick="btnAddItem_Click" Width="130px">
                </telerik:RadButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="3">
                <asp:Label ID="Label5" runat="server" Text="Available QTY : " 
                    style="font-weight: 700"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <telerik:RadGrid ID="grdCurrantStock" runat="server" Width="750px" CellSpacing="0" GridLines="None" OnItemCommand="grdCurrantStock_ItemCommand">
                    <MasterTableView>
                        <CommandItemSettings ExportToPdfText="Export to PDF">
                        </CommandItemSettings>
                        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </ExpandCollapseColumn>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                            </EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                </telerik:RadGrid>
            </td>
            <td class="style2" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3">
                <asp:Label ID="lblMassege" runat="server" Text=""></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="auto-style1" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="Label6" runat="server" Text="Selectd Menu : " 
                    style="font-weight: 700; "></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3">
                <asp:GridView ID="grdAddedMenuItems" runat="server" Width="750px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    OnRowDeleting="grdAddedMenuItems_RowDeleting" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <%-- <ItemTemplate>
                                <asp:LinkButton runat="server" ID="update" CommandArgument='<%#Eval("txtCurryType") %>'
                            OnClick="update_Click">Update</asp:LinkButton>
  
                            </ItemTemplate>--%></asp:TemplateField>
                        <asp:TemplateField HeaderText="Meal Type">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtCurryType" Runat="server" TextMode="MultiLine" 
                                    Width="350px">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <telerik:RadButton ID="btnSave" runat="server" Text="Add Menu" 
                    OnClick="btnSave_Click" Width="130px">
                </telerik:RadButton>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="auto-style1" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="auto-style1" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="auto-style1" colspan="2">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
