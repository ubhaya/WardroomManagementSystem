<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IndividualSaleGroup.aspx.cs" Inherits="victuling_WordRoom.IndividualSale" MaintainScrollPositionOnPostBack = "true" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        }
.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}.rdfd_{position:absolute}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}div.RadPicker table.rcSingle .rcInputCell{padding-right:0}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.rcSingle .riSingle{white-space:normal}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.RadInput_Default{font:12px "segoe ui",arial,sans-serif}.riSingle{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle{position:relative;display:inline-block;white-space:nowrap;text-align:left}.RadInput{vertical-align:middle}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.riSingle .riTextBox{box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-khtml-box-sizing:border-box}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox{text-align:left}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox{text-align:left}.RadComboBox{vertical-align:middle;display:-moz-inline-stack;display:inline-block}
.RadComboBox_Default{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox *{margin:0;padding:0}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbInputCellLeft{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbInputCellLeft{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox .rcbReadOnly .rcbInput{cursor:default}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox .rcbInput{text-align:left}.RadComboBox_Default .rcbInput{font:12px "Segoe UI",Arial,sans-serif;color:#333}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}
        .RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}.RadComboBox .rcbArrowCellRight{background-color:transparent;background-repeat:no-repeat}.RadComboBox_Default .rcbArrowCellRight{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.ComboBox.rcbSprite.png')}
        .RadButton_Default .rbDecorated{background-image:url('mvwres://Telerik.Web.UI, Version=2012.2.607.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Button.ButtonSprites.png')}.rbDecorated{display:block;height:22px;padding-right:6px;padding-left:10px;border:0;text-align:center;background-position:left -22px;overflow:visible;background-color:transparent;outline:none;cursor:pointer;-webkit-border-radius:0}.rbDecorated{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}
    .style4
    {
        width: 190px;
        text-decoration: underline;
    }
    .style5
    {
        margin-left: 160px;
        }
        .style6
        {
            text-align: center;
            font-size: small;
            height: 21px;
        }
        .style7
        {
            margin-left: 160px;
            height: 21px;
        }
        .style8
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4">
                <strong>Group Menu Item Sale</strong></td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                <telerik:RadComboBox ID="ddlBaseAll" Runat="server" Filter="Contains" 
                    Visible="False">
                </telerik:RadComboBox>
                <telerik:RadComboBox ID="ddlServiceType" Runat="server" Visible="False">
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
            <td class="style1">
            <asp:Label ID="Label1" runat="server" Text="Sale Date :"></asp:Label>
            </td>
            <td class="style5">
                <telerik:RadDatePicker ID="dateSaleDate" Runat="server" 
                    onselecteddatechanged="dateSaleDate_SelectedDateChanged">
                </telerik:RadDatePicker>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
            <asp:Label ID="Label14" runat="server" Text="Ward Room :"></asp:Label>
            </td>
            <td class="style5">
                <telerik:RadTextBox ID="txtWardRoom" Runat="server" Enabled="false">
                </telerik:RadTextBox>
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
            <asp:Label ID="lblAppointmentDes2" runat="server" Text="Reason :"></asp:Label>
            </td>
            <td class="style5">
                <telerik:RadComboBox ID="ddlReason" Runat="server">
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Group 
                Type :</td>
            <td class="style5">
                <telerik:RadComboBox ID="ddlGroupMenu" Runat="server">
                </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Vegetarian/Non-Vegetarian :</td>
            <td class="style5">
            <telerik:RadComboBox ID="ddlVegi" Runat="server">
                <Items>
                    <telerik:RadComboBoxItem runat="server" Text="---Select---" 
                            Value="---Select---" />
                    <telerik:RadComboBoxItem runat="server" Text="Non-Vegetarian" 
                            Value="Non-Vegetarian" />
                    <telerik:RadComboBoxItem runat="server" Text="Vegetarian" Value="Vegetarian" />
                </Items>
            </telerik:RadComboBox>
                <telerik:RadButton ID="btnViewExtra" runat="server" Text="View Group Menu" 
                    Width="130px" onclick="btnViewExtra_Click">
                </telerik:RadButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Group Meal Items :</td>
            <td class="style5">
            <telerik:RadGrid ID="grdReport2" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport2_ItemCommand" 
                                onitemdatabound="grdReport2_ItemDataBound" PageSize="50" 
                                ShowStatusBar="True" Width="70%">
                <ExportSettings ExportOnlyData="True" HideStructureColumns="True" 
                                    IgnorePaging="True">
                </ExportSettings>
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView CommandItemDisplay="Top" Width="100%">
                    <CommandItemSettings ShowAddNewRecordButton="false" 
                                        ShowExportToExcelButton="true" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                                        Visible="True">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                                        Visible="True">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="Sr.No" UniqueName="SlNo">
                            <ItemTemplate>
                                <asp:Label ID="lblSn2" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                          <%-- <telerik:GridBoundColumn DataField="mainItemCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Code" 
                                            UniqueName="mainItemCode">
                        </telerik:GridBoundColumn>--%>
                          <telerik:GridBoundColumn DataField="mainItemCategory" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Category" 
                                            UniqueName="mainItemCategory">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="mainItem" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item" 
                                            UniqueName="mainItem">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="remarks" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Remarks" 
                                            UniqueName="remarks">
                        </telerik:GridBoundColumn>
                 
                         

                  

                       
<%--
                       <telerik:GridTemplateColumn HeaderText="Select" UniqueName="Features">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="headerChkbox" runat="server" AutoPostBack="True" 
                                                                        OnCheckedChanged="ToggleSelectedState" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="cbxSelect" runat="server" AutoPostBack="True" 
                                                                        OnCheckedChanged="ToggleRowSelection" />
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>--%>
                         

                  

                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Group Meal Attendance List :</td>
            <td class="style5">
            <telerik:RadGrid ID="grdReport3" runat="server" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport3_ItemCommand" 
                                onitemdatabound="grdReport3_ItemDataBound" 
                                onneeddatasource="rgdBoardAssessment_NeedDataSource" PageSize="50" 
                                ShowStatusBar="True" Width="100%" 
                onselectedcellchanged="grdReport_SelectedCellChanged">
                <ExportSettings ExportOnlyData="True" HideStructureColumns="True" 
                                    IgnorePaging="True">
                </ExportSettings>
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView CommandItemDisplay="Top" Width="100%">
                    <CommandItemSettings ShowAddNewRecordButton="false" 
                                        ShowExportToExcelButton="true" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                                        Visible="True">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                                        Visible="True">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="Sr.No" UniqueName="SlNo">
                            <ItemTemplate>
                                <asp:Label ID="lblSn3" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <%--     <telerik:GridBoundColumn DataField="serviceType" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Service Type" 
                                            UniqueName="serviceType">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="branchID" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Branch" 
                                            UniqueName="branchID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="officialNo" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Official No." 
                                            UniqueName="officialNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rankRate" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Rank/Rate" 
                                            UniqueName="rankRate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="name" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Name" 
                                            UniqueName="name">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="mealCount" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Meal Count" 
                                            UniqueName="mealCount">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
            <telerik:RadGrid ID="grdReport0" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" 
                                onitemdatabound="grdReport0_ItemDataBound" PageSize="50" 
                                ShowStatusBar="True" Width="100%" Visible="False">
                <ExportSettings ExportOnlyData="True" HideStructureColumns="True" 
                                    IgnorePaging="True">
                </ExportSettings>
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView CommandItemDisplay="Top" Width="100%">
                    <CommandItemSettings ShowAddNewRecordButton="false" 
                                        ShowExportToExcelButton="true" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                                        Visible="True">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                                        Visible="True">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="Sr.No" UniqueName="SlNo">
                            <ItemTemplate>
                                <asp:Label ID="lblSn0" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                          <telerik:GridBoundColumn DataField="officialNo" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Official No" 
                                            UniqueName="officialNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="selectedMeal" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Selected Meal" 
                                            UniqueName="selectedMeal">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="remarks" 
                                            FilterControlAltText="Filter Official_NO column" 
                                            HeaderText="Remarks" UniqueName="remarks">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="noneVegetarian" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="None Vegetarian" 
                                            UniqueName="noneVegetarian">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="vegetarian" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Vegetarian" 
                                            UniqueName="vegetarian">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="mealIn" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Meal In" 
                                            UniqueName="mealIn">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="mealOut" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Meal Out" 
                                            UniqueName="mealOut">
                        </telerik:GridBoundColumn>

                         

                        <telerik:GridBoundColumn DataField="mealCount" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Meal Count" 
                                            UniqueName="mealCount">
                        </telerik:GridBoundColumn>
                         

                  

                        

                  

                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Group Menu Count :</td>
            <td class="style5">
                <asp:Label ID="lblGroupMenuCount" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                <asp:Image ID="imgPerson" runat="server" Height="118px" Width="110px" />
                <asp:Label ID="lblNic" runat="server" Visible="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
            <asp:Label ID="Label11" runat="server" Text="Official No :"></asp:Label>
            </td>
            <td class="style5">
                <telerik:RadTextBox ID="txtOfficialNo" Runat="server">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
            <asp:Label ID="Label12" runat="server" Text="Service Type :"></asp:Label>
            </td>
            <td class="style5">
                <telerik:RadComboBox ID="ddlServiceType0" Runat="server">
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
            <td class="style1">
            <asp:Label ID="Label13" runat="server" Text="O/S :"></asp:Label>
            </td>
            <td class="style5">
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
            <td class="style6">
                Rank :</td>
            <td class="style5">
                <asp:Label ID="lblRank" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Name :</td>
            <td class="style5">
                <asp:Label ID="lblFullName" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Permanent Base :</td>
            <td class="style5">
                <asp:Label ID="lblPermanentBase" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                In Service/Not In Service</td>
            <td class="style5">
                <asp:Label ID="lblIsActive" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
            <asp:Label ID="lblOffNO" runat="server" Text="Official No/Nos :"></asp:Label>
            </td>
            <td class="style5">
                <telerik:RadTextBox ID="txtOffNoList" Runat="server" Width="600px" 
                    TextMode="MultiLine">
                </telerik:RadTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;<asp:LinkButton ID="ViewIngredientsList" runat="server" 
                    onclick="ViewIngredientsList_Click">View Ingredients List :</asp:LinkButton>
            </td>
            <td class="style5">
            <telerik:RadGrid ID="grdReport4" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport0_ItemCommand" 
                                onitemdatabound="grdReport4_ItemDataBound" 
                                onneeddatasource="rgdBoardAssessment_NeedDataSource" PageSize="50" 
                                ShowStatusBar="True" Width="100%" 
                onselectedcellchanged="grdReport_SelectedCellChanged">
                <ExportSettings ExportOnlyData="True" HideStructureColumns="True" 
                                    IgnorePaging="True">
                </ExportSettings>
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView CommandItemDisplay="Top" Width="100%">
                    <CommandItemSettings ShowAddNewRecordButton="false" 
                                        ShowExportToExcelButton="true" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                                        Visible="True">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                                        Visible="True">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="Sr.No" UniqueName="SlNo">
                            <ItemTemplate>
                                <asp:Label ID="lblSn4" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                   <telerik:GridBoundColumn DataField="mainItem" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Meal Name" 
                                            UniqueName="mainItem">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Ingredients" 
                                            UniqueName="item">
                        </telerik:GridBoundColumn>
                    
                        <telerik:GridBoundColumn DataField="qty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Qty." 
                                            UniqueName="qty">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Messurment" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Issueqty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Issue Qty." 
                                            UniqueName="Issueqty">
                        </telerik:GridBoundColumn>
                        
                        
                         

                  

                       <%-- <telerik:GridButtonColumn CommandName="deleteItem" 
                            FilterControlAltText="Filter btnDelete column" Text="Delete" 
                            UniqueName="btnDelete">
                        </telerik:GridButtonColumn>--%>
                         

                  

                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
            <telerik:RadGrid ID="grdReport1" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport_ItemCommand" 
                                onitemdatabound="grdReport1_ItemDataBound" 
                                onneeddatasource="rgdBoardAssessment_NeedDataSource" PageSize="50" 
                                ShowStatusBar="True" Width="100%" 
                onselectedcellchanged="grdReport_SelectedCellChanged" Visible="False">
                <ExportSettings ExportOnlyData="True" HideStructureColumns="True" 
                                    IgnorePaging="True">
                </ExportSettings>
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView CommandItemDisplay="Top" Width="100%">
                    <CommandItemSettings ShowAddNewRecordButton="false" 
                                        ShowExportToExcelButton="true" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                                        Visible="True">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                                        Visible="True">
                    </ExpandCollapseColumn>
                    <Columns>
                      <telerik:GridBoundColumn DataField="offNo" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Off No" 
                                            UniqueName="offNO">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="serviceType" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Service Type" 
                                            UniqueName="serviceType">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="Sr.No" UniqueName="SlNo">
                            <ItemTemplate>
                                <asp:Label ID="lblSn1" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item" 
                                            UniqueName="item">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="qty" 
                                            FilterControlAltText="Filter Official_NO column" 
                                            HeaderText="Qty" UniqueName="qty">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="itemMessurmentCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Messurment" 
                                            UniqueName="itemMessurmentCode">
                        </telerik:GridBoundColumn>
                    

                  

                        

                  

                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                <asp:Label ID="Label15" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:LinkButton ID="lnTotalIngredientsList" runat="server" 
                    onclick="lnTotalIngredientsList_Click">Total Ingredients List</asp:LinkButton>
            </td>
            <td class="style5">
            <telerik:RadGrid ID="grdReport5" runat="server" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" 
                                onitemdatabound="grdReport5_ItemDataBound" PageSize="50" 
                                ShowStatusBar="True" Width="100%" 
                    onneeddatasource="grdReport5_NeedDataSource">
                <ExportSettings ExportOnlyData="True" HideStructureColumns="True" 
                                    IgnorePaging="True">
                </ExportSettings>
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView CommandItemDisplay="Top" Width="100%">
                    <CommandItemSettings ShowAddNewRecordButton="false" 
                                        ShowExportToExcelButton="true" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                                        Visible="True">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                                        Visible="True">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="Sr.No" UniqueName="SlNo">
                            <ItemTemplate>
                                <asp:Label ID="lblSn5" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                   
                        <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Ingredients" 
                                            UniqueName="item">
                        </telerik:GridBoundColumn>
                    
                        <telerik:GridBoundColumn DataField="qty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Qty. for Menu" 
                                            UniqueName="qty">
                        </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="currentStock" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Current Stock" 
                                            UniqueName="currentStock">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Messurment" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="itemCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Code" 
                                            UniqueName="itemCode">
                        </telerik:GridBoundColumn>
                        
                        
                         

                  

                       <%-- <telerik:GridButtonColumn CommandName="deleteItem" 
                            FilterControlAltText="Filter btnDelete column" Text="Delete" 
                            UniqueName="btnDelete">
                        </telerik:GridButtonColumn>--%>
                         

                  

                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                <asp:Label ID="Label18" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
            <asp:Label ID="Label10" runat="server" Text="Item Category :" Visible="False"></asp:Label>
            </td>
            <td class="style5">
            <telerik:RadComboBox ID="ddlItemCat" Runat="server" 
                onselectedindexchanged="ddlItemCat_SelectedIndexChanged" 
                AutoPostBack="True" Width="300px" Visible="False">
            </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
            <asp:Label ID="Label2" runat="server" Text="Item :" Visible="False"></asp:Label>
            </td>
            <td class="style5">
            <telerik:RadComboBox ID="ddlItem" Runat="server" 
                 Width="300px" AutoPostBack="True" 
                    onselectedindexchanged="ddlItem_SelectedIndexChanged" Visible="False">
            </telerik:RadComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:LinkButton ID="linkBtnGetInList" runat="server" 
                    onclick="linkBtnGetInList_Click">Get Ingredients Deduction List</asp:LinkButton>
            </td>
            <td colspan="2">
                <asp:GridView ID="grdMedal" runat="server" AutoGenerateColumns="False" 
                    BackColor="#CC0000" CellPadding="4" ForeColor="#333333" GridLines="None" 
                    onrowcreated="Gridview1_RowCreated" onrowdatabound="Gridview1_RowDataBound" 
                    ShowFooter="True" Width="100%" 
                    onselectedindexchanged="grdMedal_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtID" runat="server" 
                                    MaxLength="10"  ReadOnly="true" Width="60" 
                                    >
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item ID">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtItemCode" runat="server" 
                                    MaxLength="10"  ReadOnly="true" Width="70" 
                                    >
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Item">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtItem" runat="server" ReadOnly="true" Width="150">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="From">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtFrom" runat="server" ReadOnly="true" 
                                    Width="60">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtPrice" runat="server" ReadOnly="true" 
                                    Width="60">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Mesu">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtMesu" runat="server" ReadOnly="true" 
                                    Width="60">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Stock Qty.">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtOnChargeQty" runat="server" ReadOnly="true" Width="60">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sale Qty.">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtSaleQty" runat="server" ReadOnly="true" Width="60" 
                                    AutoPostBack="True">
                                </telerik:RadTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                           <asp:TemplateField HeaderText="Current Qty.">
                            <ItemTemplate>
                                <telerik:RadTextBox ID="txtCurrentQty" runat="server" ReadOnly="true" 
                                    Width="60" >
                                </telerik:RadTextBox>
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
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                <asp:Label ID="Label16" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                <telerik:RadButton ID="btnGetHandStock" runat="server" 
                    onclick="btnGetHandStock_Click" Text="Get Hand Stock" Width="130px">
                </telerik:RadButton>
                <asp:Label ID="lblErrorCurrent" runat="server" Visible="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                <telerik:RadButton ID="btnUpdateStock" runat="server" 
                    onclick="btnUpdateStock_Click" Text="Update Stock" Width="130px">
                </telerik:RadButton>
                <asp:Label ID="lblMsg" runat="server" Font-Bold="false"></asp:Label>
                <asp:Label ID="lblError" runat="server" Visible="False"></asp:Label>
                <asp:LinkButton ID="linkbtnTotalCurrentStock" runat="server" 
                    onclick="linkbtnTotalCurrentStock_Click" Visible="False">Total Current Stock :</asp:LinkButton>
                <asp:Label ID="lblCurrent" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                &nbsp;
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5" colspan="2">
                <asp:Label ID="lblDate" runat="server" Font-Bold="True"></asp:Label>
                -<asp:Label ID="lblReason" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">View Item List by Official No.</asp:LinkButton>
            </td>
            <td class="style5" colspan="2">
            <telerik:RadGrid ID="grdReport" runat="server" 
                                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                GridLines="None" onitemcommand="grdReport_ItemCommand" 
                                onitemdatabound="grdReport_ItemDataBound" 
                                onneeddatasource="rgdBoardAssessment_NeedDataSource" PageSize="50" 
                                ShowStatusBar="True" Width="100%" 
                onselectedcellchanged="grdReport_SelectedCellChanged">
                <ExportSettings ExportOnlyData="True" HideStructureColumns="True" 
                                    IgnorePaging="True">
                </ExportSettings>
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView CommandItemDisplay="Top" Width="100%">
                    <CommandItemSettings ShowAddNewRecordButton="false" 
                                        ShowExportToExcelButton="true" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                                        Visible="True">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                                        Visible="True">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="Sr.No" UniqueName="SlNo">
                            <ItemTemplate>
                                <asp:Label ID="lblSn" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                         <telerik:GridBoundColumn DataField="offNo" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Official No." 
                                            UniqueName="offNo">
                        </telerik:GridBoundColumn>
                    <%--     <telerik:GridBoundColumn DataField="serviceType" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Service Type" 
                                            UniqueName="serviceType">
                        </telerik:GridBoundColumn>--%>
                        
                         
                        <telerik:GridBoundColumn DataField="item" 
                                            FilterControlAltText="Filter Official_NO column" 
                                            HeaderText="Item" UniqueName="item">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="unitPrice" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Unit Price" 
                                            UniqueName="unitPrice">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="saleQty" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Sale Qty." 
                                            UniqueName="saleQty">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="itemMessurment" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Measurement" 
                                            UniqueName="itemMessurment">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="recevedFrom" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Receved From" 
                                            UniqueName="recevedFrom">
                        </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="reason" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Reason" 
                                            UniqueName="reason">
                        </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="GroupMenu" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Menu Type" 
                                            UniqueName="GroupMenu">
                        </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="itemCode" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Code" 
                                            UniqueName="itemCode">
                        </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="itemId" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="Item Id" 
                                            UniqueName="itemId">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="transID" 
                                            FilterControlAltText="Filter Official_NO column" HeaderText="ID" 
                                            UniqueName="transID">
                        </telerik:GridBoundColumn>
                         

                  

                        <telerik:GridButtonColumn CommandName="deleteItem" 
                            FilterControlAltText="Filter btnDelete column" Text="Delete" 
                            UniqueName="btnDelete">
                        </telerik:GridButtonColumn>
                         

                  

                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                <asp:Label ID="Label17" runat="server"></asp:Label>
                <asp:LinkButton ID="linkBtnPrint" runat="server" onclick="linkBtnPrint_Click" 
                    Visible="False">Print Bill</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Get Cost </asp:LinkButton>
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Total Menue Cost :</td>
            <td class="style7">
                <asp:Label ID="Label19" runat="server"></asp:Label>
            </td>
            <td class="style8">
                </td>
        </tr>
        <tr>
            <td class="style1">
                Cost Per Head :</td>
            <td class="style5">
                <asp:Label ID="Label20" runat="server"></asp:Label>
                <asp:Label ID="Label21" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
