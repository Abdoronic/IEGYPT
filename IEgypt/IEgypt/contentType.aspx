<%@ Page Language="C#" Inherits="IEgypt.contentType" %>

<!DOCTYPE html>
<h1>Create New Content Type</h1>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<form id="form1" runat="server">
    <p>
        Enter Type</p>
    <p>
       <asp:TextBox ID="TextBox1" runat="server" Height="23px" style="margin-left: 134px; margin-top: 25px" Width="172px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Height="26px" style="margin-left: 472px" Text="ADD" Width="81px" OnClick="button2Clicked"/>
    </p>
</form>
</body>
</html>

