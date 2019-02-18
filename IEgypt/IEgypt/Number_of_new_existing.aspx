<%@ Page Language="C#" Inherits="IEgypt.Number_of_new_existing" %>
<!DOCTYPE html>

<h1>Possible Contributers</h1>
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
            <br>
            
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" OnRowCommand="grid_RowCommand">
                <Columns>
                    <asp:BoundField DataField="working_place_type" HeaderText="working_place_type" />
                    <asp:BoundField DataField="category" HeaderText="category" />
                    <asp:BoundField DataField="numberofRequests" HeaderText="numberofRequests" />
                </Columns>
            </asp:GridView>
            <br>
            <br>
            <br>
            <asp:Button ID="Button2" runat="server" Text="BACK" Width="114px"  OnClick="button2Clicked"/>

    </form>
</body>
</html>

