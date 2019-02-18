<%@ Page Language="C#" Inherits="IEgypt.Adevertisment" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <p style="font-family: sans-serif; font-size: large; color: #FFFFFF; background-color: #000000; border: 2px solid #FF6699; font-weight: bold; font-variant: normal; text-transform: none; position: static; right: 15px; left: 15px; text-align: center"> Create Adverisment </p>

        </div>
        Location :<br />
        <asp:TextBox ID="Location" runat="server"></asp:TextBox>
    <p>
            Description :<br />
            <asp:TextBox ID="Description" runat="server"></asp:TextBox>
&nbsp;&nbsp;</p>
        <p>
            &nbsp;</p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send Adevertisment" />
    <br />
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </form>
</body>
</html>