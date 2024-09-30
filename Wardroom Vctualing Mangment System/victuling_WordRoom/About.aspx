<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="victuling_WordRoom.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {}
        .style2
        {
            text-align: justify;
            width: 980px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2 class="style1">
        &nbsp;</h2>
    <p class="style2">
        The system was developed to automate wardroom victualing functions. The system 
        can store the victualing stocks receipts and issues to and from naval stores, 
        galley and individuals.
    </p>
    <p class="style2">
        The daily meal attendance and menu planning will be carried out by the system. 
        This will allow auto generation of meal book, cash book and individual recovery 
        at any given time.
    </p>
    This will allow monitoring and administering victualing functions efficiently 
    and effectively.<p>
        &nbsp;</p>
</asp:Content>
