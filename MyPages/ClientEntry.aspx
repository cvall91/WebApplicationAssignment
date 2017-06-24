<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="ClientEntry.aspx.cs" Inherits="MyPages_ClientEntry" %>
<%@ Register Src="~/ClientVendorUC.ascx" TagName="RequiredData" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <uc1:RequiredData ID="myUCRequiredData" runat="server" />
</asp:Content>

