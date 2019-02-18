<%@ Page Language="C#" Inherits="IEgypt.Staff" %>
<!DOCTYPE html>
<html>

<head runat="server">
    <title>StaffMember</title>
</head>

<body>

<form id="form1" runat="server">
    <h1>Functionalities of every staff member</h1>
    <asp:DropDownList ID="DropDownList1" runat="server" Height="142px" Width="201px" style="margin-left: 0px">
        <asp:ListItem>Filter original content</asp:ListItem>
        <asp:ListItem>New category</asp:ListItem>
        <asp:ListItem>New Type</asp:ListItem>
        <asp:ListItem>Show existing requests</asp:ListItem>
        <asp:ListItem>Show number requests</asp:ListItem>
        <asp:ListItem>Notifications</asp:ListItem>
        <asp:ListItem>Delete comment</asp:ListItem>
        <asp:ListItem>Delete Original Contnet</asp:ListItem>
         <asp:ListItem>Delete New Contnet</asp:ListItem>
        <asp:ListItem>Order contributors</asp:ListItem>
        <asp:ListItem>Assign contributor</asp:ListItem>
    </asp:DropDownList>
    <br>
    <br>
    <br>
    <br>

    <asp:button id="button1" runat="server" text="GO" Width="107px" OnClick="button2Clicked"/>

    <br>
    <br>
    <br>
    <br>
    
    <asp:Button ID="Button2" runat="server" Text="BACK" Width="138px" OnClick = "backClicked" />

</form>
    </body>
    </html>