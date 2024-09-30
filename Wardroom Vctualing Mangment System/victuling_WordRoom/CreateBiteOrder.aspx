<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateBiteOrder.aspx.cs" Inherits="victuling_WordRoom.CreateBiteOrder" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style2
    {
        text-decoration: underline;
    }
    .style3
    {
        width: 220px;
    }
.rdfd_{position:absolute}.rdfd_{position:absolute}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333;
        margin-bottom: 0px;
    }.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png')}.RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png')}.RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png')}.rbDecorated{display:block;height:22px;padding-right:6px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}.rbDecorated{display:block;height:22px;padding-right:6px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}.rbDecorated{display:block;height:22px;padding-right:6px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
    <tr>
        <td class="style2" colspan="3">
            <strong>Create Bite Order</strong></td>
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
            Date :</td>
        <td>
            <telerik:RadDatePicker ID="dateMenuDate" Runat="server">
            </telerik:RadDatePicker>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Wardroom :</td>
        <td>
            <telerik:RadTextBox ID="txtWardRoom" Runat="server" ReadOnly="True">
            </telerik:RadTextBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Reason :</td>
        <td>
                <telerik:RadComboBox ID="cmbDescription" runat="server" AutoPostBack="false">
                </telerik:RadComboBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Vegetarian/Non-Vegetarian :</td>
        <td>
                <telerik:RadComboBox ID="ddlVegi" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                            Value="---Select---" />
                        <telerik:RadComboBoxItem runat="server" Text="Vegetarian" Value="Vegetarian" />
                        <telerik:RadComboBoxItem runat="server" Text="Non-Vegetarian" 
                            Value="Non-Vegetarian" />
                    </Items>
                </telerik:RadComboBox>
                </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            Group Type :</td>
        <td>
                <telerik:RadComboBox ID="ddlGroupMenu" Runat="server">
                </telerik:RadComboBox>
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
                <asp:Label ID="Label7" runat="server" Text="Meal Category"></asp:Label>
&nbsp;:</td>
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
                <asp:Label ID="Label8" runat="server" Text="Meal"></asp:Label>
&nbsp;:</td>
        <td>
                <telerik:RadComboBox ID="ddlMeal" Runat="server" Width="250px" 
                    onselectedindexchanged="ddlMeal_SelectedIndexChanged">
                </telerik:RadComboBox>
                <telerik:RadButton ID="btnAddMenuItem" runat="server" Text="Add Menu Item to List" 
                    onclick="btnAddMenuItem_Click" Width="130px">
                </telerik:RadButton>
                <asp:Label ID="lblError" runat="server"></asp:Label>
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
        <td colspan="2">
                <asp:GridView ID="grdMedal" runat="server" AutoGenerateColumns="False" 
                    BackColor="#CC0000" CellPadding="4" ForeColor="#333333" GridLines="None" 
                    onrowcreated="Gridview1_RowCreated" onrowdatabound="Gridview1_RowDataBound" 
                    ShowFooter="True" Width="100%" 
                    onselectedindexchanged="grdMedal_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Meal ID">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtMealID" runat="server" 
                                    MaxLength="10"  ReadOnly="true" Width="70" 
                                    >
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Meal Category">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtMealCategory" runat="server" ReadOnly="true" Width="200">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Meal Item">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtMealItem" runat="server" ReadOnly="true" Width="200">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No.Of Portions">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtRemarks" runat="server" ReadOnly="false" 
                                    Width="250">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remove">

            <ItemTemplate>
                <asp:CheckBox ID="SelectCheckBox" runat="server" />

            </ItemTemplate>
        </asp:TemplateField>
                   
                         
                      
                        

                          
                        
                        
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#25A0DA" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#25A0DA" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                </td>
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
                Remarks :</td>
        <td>
                <telerik:RadTextBox ID="txtRemark" Runat="server" TextMode="MultiLine" 
                    Width="440px">
                </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td>
                
                <asp:Image ID="imgPerson" runat="server" Height="118px" Width="110px" />
                <asp:Label ID="lblNic" runat="server" Visible="False"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label11" runat="server" Text="Official No :"></asp:Label>
            </td>
        <td>
                <telerik:RadTextBox ID="txtOfficialNo" Runat="server">
                </telerik:RadTextBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label12" runat="server" Text="Service Type :"></asp:Label>
            </td>
        <td>
                <telerik:RadComboBox ID="ddlServiceType" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                            Value="---Select---" Owner="ddlServiceType" />
                        <telerik:RadComboBoxItem runat="server" Text="RNF" Value="RNF" 
                            Owner="ddlServiceType" />
                        <telerik:RadComboBoxItem runat="server" Text="VNF" Value="VNF" 
                            Owner="ddlServiceType" />
                        <telerik:RadComboBoxItem runat="server" Text="RNR" Value="RNR" 
                            Owner="ddlServiceType" />
                        <telerik:RadComboBoxItem runat="server" Text="VNR" Value="VNR" 
                            Owner="ddlServiceType" />
                    </Items>
                </telerik:RadComboBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label13" runat="server" Text="O/S :"></asp:Label>
            </td>
        <td>
                
                <telerik:RadComboBox ID="ddlOfficerSailor" Runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="Officer" Value="O" 
                            Owner="ddlOfficerSailor" />
                    </Items>
                </telerik:RadComboBox>
                <telerik:RadButton ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="View Person" Width="130px">
                </telerik:RadButton>
                </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                Rank :</td>
        <td>
                <asp:Label ID="lblRank" runat="server"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                Name :</td>
        <td>
                <asp:Label ID="lblFullName" runat="server"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                Permanent Base :</td>
        <td>
                <asp:Label ID="lblPermanentBase" runat="server"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                Service Type :</td>
        <td>
                <asp:Label ID="lblIsActive" runat="server"></asp:Label>
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
                Off No. :</td>
        <td>
                <telerik:RadTextBox ID="txtOffNoList" Runat="server" TextMode="MultiLine" 
                    Width="440px">
                </telerik:RadTextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
                &nbsp;</td>
        <td>
                <telerik:RadButton ID="btnAddMenu" runat="server" onclick="btnAddMenu_Click" 
                    Text="Add Menu" Width="130px">
                </telerik:RadButton>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
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
