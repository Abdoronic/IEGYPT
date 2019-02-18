<%@ Page Language="C#" Inherits="IEgypt.login" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Login</title>
</head>
<body>
	<form id="form1" runat="server">
            <h1 align="center"> Log In </h1>
            
            <h3>Email</h3>
            <asp:TextBox id="login_email" runat="server"/>
            
            <br>
            
            <h3>Password</h3>
            <asp:TextBox id="login_password" runat="server"/>
            
            <br>
            <asp:Button id="do_login_button" runat="server" Text="Log in" OnClick="do_login_button_click"/>
            <br>
            <br>
            <br>
            <asp:Button id="back_to_register_button" runat="server" Text="You Don't have an account? Create one" OnClick="back_to_register_button_click"/>
            <br>
            <br>
            <asp:Button ID="BackButton" runat="server" Text="Back" Width="80px" OnClick="BackButton_Click" />
            <br>
            <br>
	</form>
</body>
</html>
