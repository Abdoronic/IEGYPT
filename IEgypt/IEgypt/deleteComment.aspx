<%@ Page Language="C#" Inherits="IEgypt.deleteComment" %>
<!DOCTYPE html>

     <h1>Delete Comment</h1>
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
                       <asp:BoundField DataField="viewer_id" HeaderText="viewer_id" />
                    <asp:BoundField DataField="original_content_id" HeaderText="original_content_id" />
                     <asp:BoundField DataField="link" HeaderText="link" />
                     <asp:BoundField DataField="date" HeaderText="date" />
                     <asp:BoundField DataField="TEXT" HeaderText="TEXT" />
                    <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="Delete" />
                </Columns>
            </asp:GridView>
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="BACK" Width="114px"  OnClick="button2Clicked"/>
        </p>

    </form>
</body>
</html>
