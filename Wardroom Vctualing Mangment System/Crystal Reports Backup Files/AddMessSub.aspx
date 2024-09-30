<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMessSub.aspx.cs" Inherits="victuling_WordRoom.AddMessSub" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style2
    {
            width: 218px;
        }
    .style3
    {
        text-decoration: underline;
    }
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .style4
        {
            width: 100%;
            height: 20px;
            line-height: 20px;
            vertical-align: middle;
            border-style: none;
            border-color: inherit;
            border-width: 0;
            margin-top: -1px;
            margin-bottom: -1px;
            padding-left: 2px;
            padding-right: 0;
            padding-top: 0;
            padding-bottom: 0;
            background-position: 0 0;
        }
        .style5
        {
            width: 16px;
            border-style: none;
            border-color: inherit;
            border-width: 0;
            margin-top: -1px;
            margin-bottom: -1px;
            padding: 0;
            background-position: -2px -88px;
        }
.RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png')}.RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png')}.rbDecorated{display:block;height:22px;padding-right:6px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}.rbDecorated{display:block;height:22px;padding-right:6px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
    <tr>
        <td class="style3" colspan="3">
                <strong>Add Mess Substitute</strong></td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="Area" ></asp:Label>
            &nbsp;:</td>
        <td>
                <telerik:RadComboBox ID="ddlArea" Runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlArea_SelectedIndexChanged">
                </telerik:RadComboBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                Base :</td>
        <td>
                <telerik:RadComboBox ID="cmbBase" Runat="server"  >
                </telerik:RadComboBox>

            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                Year : </td>
        <td>
            <telerik:RadComboBox ID="ddlYear" Runat="server">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                        Value="---Select---" Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2017" Value="2017" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2018" Value="2018" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2019" Value="2019" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2020" Value="2020" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2021" Value="2021" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2022" Value="2022" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2023" Value="2023" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2024" Value="2024" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2025" Value="2025" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2026" Value="2026" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2027" Value="2027" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2028" Value="2028" 
                        Owner="ddlYear" />
                    <telerik:RadComboBoxItem runat="server" Text="2029" Value="2029" />
                    <telerik:RadComboBoxItem runat="server" Text="2030" Value="2030" />
                </Items>
            </telerik:RadComboBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                Month :</td>
        <td>
            <telerik:RadComboBox ID="ddlMonth" Runat="server">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                        Value="---Select---" />
                    <telerik:RadComboBoxItem runat="server" Text="January" Value="1" />
                    <telerik:RadComboBoxItem runat="server" Text="February" Value="2" />
                    <telerik:RadComboBoxItem runat="server" Text="March" Value="3" />
                    <telerik:RadComboBoxItem runat="server" Text="April" Value="4" />
                    <telerik:RadComboBoxItem runat="server" Text="May" Value="5" />
                    <telerik:RadComboBoxItem runat="server" Text="June" Value="6" />
                    <telerik:RadComboBoxItem runat="server" Text="July" Value="7" />
                    <telerik:RadComboBoxItem runat="server" Text="August" Value="8" />
                    <telerik:RadComboBoxItem runat="server" Text="September" Value="9" />
                    <telerik:RadComboBoxItem runat="server" Text="October" Value="10" />
                    <telerik:RadComboBoxItem runat="server" Text="November" Value="11" />
                    <telerik:RadComboBoxItem runat="server" Text="December" Value="12" />
                </Items>
            </telerik:RadComboBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="Browse Excel file here"></asp:Label>
            &nbsp;:</td>
        <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                &nbsp;</td>
        <td>
                <telerik:RadButton ID="RadButton1" runat="server" onclick="RadButton1_Click" 
                    Text="Upload" Width="117px">
                </telerik:RadButton>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                &nbsp;</td>
        <td>
                <asp:Label ID="StatusLabel" runat="server"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                &nbsp;</td>
        <td>
                <telerik:RadButton ID="RadButton2" runat="server" onclick="RadButton2_Click" 
                    Text="Add List to Grid" Width="117px">
                </telerik:RadButton>
            </td>
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
    </tr>
    <tr>
        <td class="style2">
                <asp:Label ID="StatusLabel2" runat="server"></asp:Label>
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
                <telerik:RadGrid ID="GridView1" runat="server" 
                    onitemdatabound="GridView1_ItemDataBound">
                </telerik:RadGrid>
            </td>
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
    </tr>
    <tr>
        <td class="style2">
                &nbsp;</td>
        <td>
                <telerik:RadButton ID="RadButton3" runat="server" onclick="RadButton3_Click" 
                    Text="Save" Width="117px">
                </telerik:RadButton>
                <asp:Label ID="lblSave" runat="server"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
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
