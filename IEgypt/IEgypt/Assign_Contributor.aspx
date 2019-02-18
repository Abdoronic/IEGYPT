<%@ Page Language="C#" Inherits="IEgypt.Assign_Contributor" %>
<!DOCTYPE html>

     <h1>Assign Contributor</h1>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <asp:Table ID="Table1" runat="server">
            </asp:Table>
            <br>
            <br>
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" OnRowCommand="grid_RowCommand">
                <Columns>
                       <asp:BoundField DataField="id" HeaderText="id" />
                     <asp:BoundField DataField="bb" HeaderText="id" />
                     <asp:BoundField DataField="information" HeaderText="information" />
                     <asp:BoundField DataField="email" HeaderText="email" />
                    <asp:ButtonField ButtonType="Button" Text="Assign" CommandName="Delete" />
                </Columns>
            </asp:GridView>
            <br>
            <br>
            <br>
            <asp:Button ID="Button2" runat="server" Text="BACK" Width="114px"  OnClick="button2Clicked"/>

    </form>
</body>
</html>

