<%@ Page Language="C#" Inherits="IEgypt.notifications" %>
<!DOCTYPE html>

     <h1>MY Notifications</h1>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Table ID="Table1" runat="server">
            </asp:Table>
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" OnRowCommand="grid_RowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" />
                    <asp:BoundField DataField="notification_object_id" HeaderText="notification_object_id" />
                     <asp:BoundField DataField="description" HeaderText="description" />
                     <asp:BoundField DataField="location" HeaderText="location" />
                     <asp:BoundField DataField="city" HeaderText="city" />
                     <asp:BoundField DataField="time" HeaderText="time" />
                     <asp:BoundField DataField="entertainer" HeaderText="entertainer" />
                     <asp:BoundField DataField="sent_at" HeaderText="sent_at" />

                </Columns>
            </asp:GridView>
        </div>
        <p>
            &nbsp;</p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="BACK" Width="114px"  OnClick="button2Clicked"/>
        </p>
    </form>
</body>
</html>

