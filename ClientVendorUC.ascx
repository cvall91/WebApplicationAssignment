<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ClientVendorUC.ascx.cs" Inherits="MyPages_ClientVendorUC" %>

<div id="UserControlDiv">
    <asp:Label ID="lblFedTaxID" runat="server" Text="Federal Tax ID: "></asp:Label>
    <asp:TextBox ID="txtFedTaxID" runat="server" MaxLength="15"></asp:TextBox>
    &nbsp;* <asp:RequiredFieldValidator ID="ReqValFedTaxID" runat="server" ControlToValidate="txtFedTaxID" ErrorMessage ="Please enter your Federal Tax ID" />
    <br />
    <asp:Label ID="lblBusinessName" runat="server" Text="Business Name: "></asp:Label>
    <asp:TextBox ID="txtBusinessName" runat="server" MaxLength="50"></asp:TextBox>
    &nbsp;*<asp:RequiredFieldValidator ID="ReqValtxtBusinessName" runat="server" ControlToValidate="txtBusinessName" ErrorMessage ="Please enter your Business Name" />
    <br />
    <asp:Label ID="lblAddress" runat="server" Text="Address: "></asp:Label>
    <asp:TextBox ID="txtAddress" runat="server" MaxLength="100"></asp:TextBox>
    &nbsp;* <asp:RequiredFieldValidator ID="ReqValtxtAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage ="Please enter your Address" />
    <br />
    <asp:Label ID="lblCity" runat="server" Text="City: "></asp:Label>
    <asp:TextBox ID="txtCity" runat="server" MaxLength="50"></asp:TextBox>
    &nbsp;* <asp:RequiredFieldValidator ID="ReqValtxtCity" runat="server" ControlToValidate="txtCity" ErrorMessage ="Please enter your City" />
    <br />
    <asp:Label ID="lblState" runat="server" Text="State: "></asp:Label>
    &nbsp;<asp:TextBox ID="txtState" runat="server" MaxLength="2" OnTextChanged="txtState_TextChanged"></asp:TextBox>
    *<br />
    <asp:Label ID="lblZipCode" runat="server" Text="Zip Code: "></asp:Label>
    <asp:TextBox ID="txtZipCode" runat="server" MaxLength="5" TextMode="Number"></asp:TextBox>
    &nbsp;* <asp:RequiredFieldValidator ID="ReqValtxtZipCode" runat="server" ControlToValidate="txtZipCode" ErrorMessage ="Please enter your Zip Code" />
    <br />
    <asp:Label ID="lblVendor" runat="server" Text="I'm a Vendor: "></asp:Label>
    <asp:RadioButton ID="rdoButtonYes" GroupName="VendorClient" runat="server" Text="Yes" />
    &nbsp;<asp:RadioButton ID="rdoButtonNo" GroupName="VendorClient" runat="server" Text="No" />
    <br />
    <br />
    <asp:Button ID="btnSaveButton" runat="server" Text="Button" OnClick="btnSaveButton_Click" />
    &nbsp;<asp:Label ID="lblSqlErrorMessage" runat="server"></asp:Label>
    <br />

</div>