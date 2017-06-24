<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="WorkOrders.aspx.cs" Inherits="MyPages_WorkOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:Label ID="lblWorkOrderNum" runat="server" Text="Work Order Num: "></asp:Label>
    <asp:TextBox ID="txtWorkOrderNum" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblMechanicCallSign" runat="server" Text="Mechanic Call Sign: "></asp:Label>
    <asp:DropDownList ID="ddlMecCallSign" runat="server" DataSourceID="SqlDataSource2" DataTextField="MechanicCallSign" DataValueField="MechanicId">
    </asp:DropDownList>
    <br />
    <asp:Label ID="lblPartNum" runat="server" Text="Part Number: "></asp:Label>
    <asp:TextBox ID="txtPartNum" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblInspectionComments" runat="server" Text="Inspection Comments: "></asp:Label>
    <asp:TextBox ID="txtInspectionComments" runat="server" TextMode="MultiLine"></asp:TextBox>
    .<br />
    <asp:Label ID="lblDateTimeInspected" runat="server" Text="Date/Time Inspected: "></asp:Label>
    <asp:TextBox ID="txtDateTimeInspected" runat="server" TextMode="DateTime"></asp:TextBox>
    <br />
    <asp:Label ID="lblExpires" runat="server" Text="Expires: "></asp:Label>
    <asp:Calendar ID="calExpires" runat="server"></asp:Calendar>
    <br />
    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save Work Order" />
    <asp:Label ID="lblSqlErrorMessage" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="WorkOrderNum" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="WorkOrderNum" HeaderText="WorkOrderNum" ReadOnly="True" SortExpression="WorkOrderNum" />
            <asp:BoundField DataField="MechanicCallSign" HeaderText="MechanicCallSign" SortExpression="MechanicCallSign" />
            <asp:BoundField DataField="PartNum" HeaderText="PartNum" SortExpression="PartNum" />
            <asp:BoundField DataField="InspectionComments" HeaderText="InspectionComments" SortExpression="InspectionComments" />
            <asp:BoundField DataField="Expires" HeaderText="Expires" SortExpression="Expires" />
            <asp:BoundField DataField="DateTimeInspected" HeaderText="DateTimeInspected" SortExpression="DateTimeInspected" />
        </Columns>
    </asp:GridView>

    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="WorkOrderNum" DataSourceID="SqlDataSource3" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="WorkOrderNum" HeaderText="WorkOrderNum" ReadOnly="True" SortExpression="WorkOrderNum" />
            <asp:BoundField DataField="MechanicCallSign" HeaderText="MechanicCallSign" SortExpression="MechanicCallSign" />
            <asp:BoundField DataField="PartNum" HeaderText="PartNum" SortExpression="PartNum" />
            <asp:BoundField DataField="InspectionComments" HeaderText="InspectionComments" SortExpression="InspectionComments" />
            <asp:BoundField DataField="Expires" HeaderText="Expires" SortExpression="Expires" />
            <asp:BoundField DataField="DateTimeInspected" HeaderText="DateTimeInspected" SortExpression="DateTimeInspected" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:COP4703ConnectionString %>" SelectCommand="SELECT * FROM [WorkOrder] WHERE ([WorkOrderNum] = @WorkOrderNum)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="WorkOrderNum" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:COP4703ConnectionString %>" SelectCommand="SELECT * FROM [WorkOrder]" DeleteCommand="DELETE FROM [WorkOrder] WHERE [WorkOrderNum] = @WorkOrderNum"
        UpdateCommand="UPDATE [WorkOrder] SET [MechanicCallSign] = @MechanicCallSign, [PartNum] = @PartNum, [InspectionComments] = @InspectionComments, [Expires] = @Expires, [DateTimeInspected] = @DateTimeInspected WHERE [WorkOrderNum] = @WorkOrderNum">

        <DeleteParameters>
            <asp:Parameter Name="WorkOrderNum" Type="Int32" />
        </DeleteParameters>

        <UpdateParameters>
            <asp:Parameter Name="MechanicCallSign" Type="Int32" />
            <asp:Parameter Name="PartNum" Type="String" />
            <asp:Parameter Name="InspectionComments" Type="String" />
            <asp:Parameter Name="Expires" Type="String" />
            <asp:Parameter Name="DateTimeInspected" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:COP4703ConnectionString %>" SelectCommand="SELECT [MechanicCallSign], [MechanicId] FROM [Mechanic]"></asp:SqlDataSource>

</asp:Content>

