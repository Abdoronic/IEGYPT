<%@ Page Language="C#" Inherits="IEgypt.category" %>
<!DOCTYPE html>
<h1>Review Original Content</h1>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<form id="form1" runat="server">
    <p>
        Category Name</p>
    <p>
       <asp:TextBox ID="TextBox1" runat="server" Height="23px" style="margin-left: 134px; margin-top: 25px" Width="172px"></asp:TextBox>
    </p>
    <p>
        Subcategory Name</p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Width="173px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Height="26px" style="margin-left: 472px" Text="ADD" Width="81px" OnClick="button2Clicked"/>
    </p>
</form>
</body>
</html>

