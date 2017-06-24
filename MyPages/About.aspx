<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <script src="/Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="/Scripts/ShowClients.js" type="text/javascript"></script>
    Since 1996, Danger Zone Aviation has been serving the aviation industry with 
    its top notch customer service and agile manufacturing methods. Since their retirement 
    from Top Gun Academy, Its Chief Wingmen Officers LT Pete “Maverick” Mitchell and LT Tom 
    “Iceman” Kazanski have dedicated themselves to finding Godzilla.<br />
    <br />
    <p id="ShowClientsID"> Show Prospect Clients</p>
    <script>
        $(document).ready(function () {
            $('p#ShowClientsID').click(function () {
                $('div#ShowProspectiveClientsView').show();
            });
        });
    </script>
    <div id="ShowProspectiveClientsView" style="display:none">
        SpaceX<br />
        Arianespace<br />
        Blue Origin
    </div>
    <br />
&nbsp;<div id="images">
        <img id="pic1" src="/Images/pic1.png" alt="LT Pete Maverick Mitchell">
        <img id="pic2" src="/Images/pic2.png" alt="LT Tom Iceman Kazanski "><br />
&nbsp;<asp:Label ID="Label1" runat="server" Text="Work Order Completed "></asp:Label>
                <asp:Label ID="lblCounter" runat="server"></asp:Label>
                <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="60000">
                </asp:Timer>
    </div>
</asp:Content>

