<%@ Page Language="C#" Inherits="IEgypt.ViewProfile" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>ViewProfile</title>
</head>
<body>
	<form id="form1" runat="server">
            <h1>Profile Information</h1>
            <asp:Label id = "userType_label" text = "" runat="server"/>
            <br>
            <asp:GridView ID="view_results" runat="server">  </asp:GridView>
            
            <br>
            <br>
            <br>
            
            <asp:Button id="show_more_button" runat="server" Text="Show More Options" OnClick="show_more_button_click"/>
            <br>
            <br>
            
            <asp:Button ID="BackButton" runat="server" Text="Back" Width="80px" OnClick="BackButton_Click" />
            <br>
            <br>
           
	</form>
</body>
</html>
