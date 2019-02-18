<%@ Page Language="C#" Inherits="IEgypt.Rate" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
              <br/>
        </div>
        Write Rating From 1 to 5 inclusive Please :<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" style="margin-left: 0px" Text="Confrirm Rating" />
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirm" />
        </p>
    </form>
</body>
</html>
