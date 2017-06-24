<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="CreateMechanic.aspx.cs" Inherits="MyPages_CreateMechanic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <script src="/Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="/Scripts/CreateMechanic3.js" type="text/javascript"></script>
    <asp:Label ID="lblMechanicCallSign" runat="server" Text="Mechanic Call Sign: "></asp:Label>
    <asp:TextBox ID="txtMechanicCallSign" runat="server" ClientIDMode="Static"></asp:TextBox>
&nbsp;* 
    <input id="btnCheckMecCallSign" type="button" value="Check call sign" onclick="checkMecCallSign();" />

&nbsp;<asp:RequiredFieldValidator ID="ReqValMechanicCallSign" runat="server" ControlToValidate="txtMechanicCallSign" ErrorMessage ="Please enter a Mechanic Call Sign" />

    <br />
    <asp:Label ID="lblCallSignCheck" runat="server" ClientIDMode="Static"></asp:Label>
    <br />
    <asp:Label ID="lblFirstName" runat="server" Text="First Name: "></asp:Label>
    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="25"></asp:TextBox>
&nbsp;* <asp:RequiredFieldValidator ID="ReqValtxtFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage ="Please enter your first name" />
    <br />
    <asp:Label ID="lblLastName" runat="server" Text="Last Name: "></asp:Label>
    <asp:TextBox ID="txtLastName" runat="server" MaxLength="25"></asp:TextBox>
&nbsp;* <asp:RequiredFieldValidator ID="ReqValtxtLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage ="Please enter your last name" />
    <br />
    <asp:Label ID="lblSpecialty" runat="server" Text="Specialty: "></asp:Label>
    <asp:DropDownList ID="ddlSpecialty" runat="server" style="margin-top: 0px">
        <asp:ListItem Selected="True">(Select One)</asp:ListItem>
        <asp:ListItem>Avionics</asp:ListItem>
        <asp:ListItem>Flight System</asp:ListItem>
        <asp:ListItem>Engine</asp:ListItem>
        <asp:ListItem>Landing Gear</asp:ListItem>
    </asp:DropDownList>
&nbsp;*
    <asp:Label ID="lblSpecialtyCheck" runat="server"></asp:Label>
    <br />
    <asp:Button ID="btnSaveButton" runat="server" OnClick="btnSaveButton_Click" Text="Save" />
    <br />
</asp:Content>

