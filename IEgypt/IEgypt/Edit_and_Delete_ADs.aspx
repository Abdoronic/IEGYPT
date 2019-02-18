<%@ Page Language="C#" Inherits="IEgypt.Edit_and_Delete_ADs" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                 <asp:GridView ID="table1" runat="server">
                </asp:GridView>
                 <br />
        </div>
        <p>
            Edit your selected Adverisment Below : </p>
        <p>
            Location :</p>
        <p>
            <asp:TextBox ID="Location" runat="server" Height="30px" Width="147px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        </p>
        <p>
            Description :</p>
        <p>
            <asp:TextBox ID="Description" runat="server" Height="30px" Width="147px" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        </p>
         <asp:Button ID="Button1" runat="server" Text="Confirm Edit" Width="80px" OnClick="Button1_Click" />
        <p>
            Are you sure you want to delete the comment you clicked on&nbsp; ? :
        </p>
         <asp:Button ID="Button2" runat="server" Text="Confirm Deletion" Width="80px" OnClick="Button2_Click" />
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
            
         <asp:Button ID="Button3" runat="server" Text="HomePage" Width="80px" OnClick="Button3_Click" />

    </form>
</body>
</html>
