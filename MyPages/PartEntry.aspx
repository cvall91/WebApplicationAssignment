<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="PartEntry.aspx.cs" Inherits="PartEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <div style="height: 1339px">
    
        <section runat="server" id="Welcome">
            Welcome to Danger Zone Aviation’s Part Entry page. All information entered will <br />
            be used for mechanical work order inspections. It is extremely important that all information entered <br />
            is verified as factual. Please review all the information entered. <span class="Highlight">Any information 
                wrongfully entered 
            <br />
            could cause Danger Zone Aviation to be financially 
            liable in the event of a problematic part.</span>
        </section>
        <section runat="server" id="savedEntries">
            Your entries have been saved, you can be my wingman anytime.
        </section>
        <br />
        <br />
        <section id="MainControls">
            <asp:Table ID="formTable" runat="server" CellPadding="5" CellSpacing="6" Height="154px" Width="1065px">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblClient" runat="server" Text="Client:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:DropDownList ID="ddlClientList" runat="server" DataSourceID="SqlDataSourceClient" DataTextField="Description" DataValueField="Code" >   
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblRequestOrderNum" runat="server" Text="Request Order #:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="txtRequestOrderNum" runat="server" MaxLength="5" OnTextChanged="txtRequestOrderNum_TextChanged" TextMode="Number"></asp:TextBox></asp:TableCell>
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblDateEntered" runat="server" Text="Date Entered:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="txtDateEntered" runat="server" ReadOnly="True" OnTextChanged="txtDateEntered_TextChanged"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="txtDescription" runat="server" MaxLength="50" OnTextChanged="txtDescription_TextChanged"></asp:TextBox></asp:TableCell>
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblPartNum" runat="server" Text="Part #:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="txtPartNum" runat="server" MaxLength="8" OnTextChanged="txtPartNum_TextChanged"></asp:TextBox></asp:TableCell>
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblSerial" runat="server" Text="Serial:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="txtSerialNum" runat="server" MaxLength="5" OnTextChanged="txtSerialNum_TextChanged" TextMode="Number"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblManufacturer" runat="server" Text="Manufacturer:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:DropDownList ID="ddlManufacturer" runat="server" DataSourceID="SqlDataSourceManufacturer" DataTextField="Description" DataValueField="Code" >                
                        </asp:DropDownList>                
                    </asp:TableCell>
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblModel" runat="server" Text="Model:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="txtModel" runat="server" MaxLength="25" OnTextChanged="txtModel_TextChanged"></asp:TextBox></asp:TableCell>
                    <asp:TableCell runat="server"><asp:Label ID="lblMechanicCallSign" runat="server" Text="Mechanic Call Sign: "></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:DropDownList ID="ddlMechanicCallSign" runat="server" DataSourceID="SqlDataSourceMecCallSign" DataTextField="CallSign" DataValueField="CallSign">
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
             </asp:Table> 
         </section>
        <asp:SqlDataSource ID="SqlDataSourceMecCallSign" runat="server" ConnectionString="<%$ ConnectionStrings:COP4703ConnectionString %>" SelectCommand="SELECT * FROM [MechanicCallSign]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceClient" runat="server" ConnectionString="<%$ ConnectionStrings:COP4703ConnectionString %>" SelectCommand="SELECT * FROM [Client]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceManufacturer" runat="server" ConnectionString="<%$ ConnectionStrings:COP4703ConnectionString %>" SelectCommand="SELECT * FROM [Manufacturer]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:COP4703ConnectionString %>" SelectCommand="SELECT * FROM [PartEntry]"></asp:SqlDataSource>
        <br />
        <section id="Optional">
            <asp:Table ID="optionalTable" runat="server" CellPadding="5" CellSpacing="6" Height="239px" Width="475px" >
                <asp:TableRow ID="Optional_Divider" runat="server">
                    <asp:TableCell runat="server"><asp:Label ID="lblOptionalFields" runat="server" Text="Optional Fields:"></asp:Label></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblInstructions" runat="server" Text="Instructions:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="txtInstructions" runat="server" MaxLength="100" OnTextChanged="txtInstructions_TextChanged" TextMode="MultiLine"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblTroubleReported" runat="server" Text="Trouble Reported:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="txtTroubleReported" runat="server" MaxLength="100" OnTextChanged="txtTroubleReported_TextChanged" TextMode="MultiLine"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" Wrap="False"><asp:Label ID="lblMasterContract" runat="server" Text="Master Contract:"></asp:Label></asp:TableCell>
                    <asp:TableCell runat="server"><asp:CheckBox ID="chkboxMasterContract" runat="server" OnCheckedChanged="chkboxMasterContract_CheckedChanged" Text=" " /></asp:TableCell>
                </asp:TableRow>
            </asp:Table>      
        </section>
        
        <br />
        <br />
        <asp:Button ID="btnSave" runat="server" Text="Save" Width="150px" Height="50px" OnClick="btnSave_Click" />
        <asp:Label ID="lblSqlErrorMessage" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        
        
        
        
        
        
        <asp:HiddenField ID="hiddenSavedValues" runat="server" />
        <br />
        <asp:Label ID="lblSavedValues" runat="server" Text="Saved Values:"></asp:Label>
        &nbsp;<asp:Label ID="lblErrorMissingValues" runat="server" Text="The required fields in the first section have not been populated. Please try again" CssClass="ErrorLabel" Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="txtSavedValues" runat="server" ReadOnly="True" Visible="False" Height="197px" TextMode="MultiLine" Width="341px"></asp:TextBox>       
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PartNum" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Client" HeaderText="Client" SortExpression="Client" />
                <asp:BoundField DataField="RequestOrderNum" HeaderText="RequestOrderNum" SortExpression="RequestOrderNum" />
                <asp:BoundField DataField="DateEntered" HeaderText="DateEntered" SortExpression="DateEntered" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="PartNum" HeaderText="PartNum" ReadOnly="True" SortExpression="PartNum" />
                <asp:BoundField DataField="Serial" HeaderText="Serial" SortExpression="Serial" />
                <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="MechanicCallSign" HeaderText="MechanicCallSign" SortExpression="MechanicCallSign" />
                <asp:BoundField DataField="Instructions" HeaderText="Instructions" SortExpression="Instructions" />
                <asp:BoundField DataField="TroubleReported" HeaderText="TroubleReported" SortExpression="TroubleReported" />
                <asp:CheckBoxField DataField="MasterContract" HeaderText="MasterContract" SortExpression="MasterContract" />
            </Columns>
        </asp:GridView>
        </div>
</asp:Content>