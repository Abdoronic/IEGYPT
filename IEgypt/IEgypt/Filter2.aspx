<%@ Page Language="C#" Inherits="IEgypt.Filter2" %>
<!DOCTYPE html>

     <h1>Filter Original Content</h1>
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
                    <asp:BoundField DataField="id" HeaderText="ID" />
                     <asp:BoundField DataField="link" HeaderText="link" />
                     <asp:BoundField DataField="uploaded_at" HeaderText="Uploaded_at" />
                     <asp:BoundField DataField="category_type" HeaderText="category_type" />
                     <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name" />
                     <asp:BoundField DataField="type" HeaderText="type" />
                     <asp:BoundField DataField="review_status" HeaderText="review_status" />
                    <asp:ButtonField ButtonType="Button" Text="accept" CommandName="accept" />
                    <asp:ButtonField ButtonType="Button" Text="reject" CommandName="reject" />
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

