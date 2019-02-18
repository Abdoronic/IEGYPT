<%@ Page Language="C#" Inherits="IEgypt.deactivate" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Deactivate</title>
</head>
<body>
	<form id="form1" runat="server">
            <h1 align="center"> Deactivate </h1>
            
            <h3>Email</h3>
            <asp:TextBox id="deactivate_email" runat="server"/>
            
            <br>
            
            <h3>Password</h3>
            <asp:TextBox id="deactivate_password" runat="server"/>
            
            <br>
            <br>
            
            <asp:Button id="do_deactivate_button" runat="server" Text="Deactivate" OnClick="do_deactivate_button_click"/>
            <br>
            <br>
            <asp:Button ID="BackButton" runat="server" Text="Back" Width="80px" OnClick="BackButton_Click" />
            <br>
            <br>
	</form>
</body>
</html>
