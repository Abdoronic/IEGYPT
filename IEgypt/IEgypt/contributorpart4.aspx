<%@ Page Language="C#" Inherits="IEgypt.contributorpart4" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
         #mydiv {
          background-color:silver;
            height: 1065px;
        }
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mydiv">
            <span class="auto-style1">Send message to viewer</span><br />
            <br />
            <asp:GridView ID="table1" runat="server" AutoGenerateColumns="False" Width="593px" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" >
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="first_name" HeaderText="first_name"/>
                    <asp:BoundField DataField="middle_name" HeaderText="middle_name"/>
                   <asp:BoundField DataField="last_name" HeaderText="last_name"/>
                   <asp:BoundField DataField="email" HeaderText="email"/>
                     <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect" Text="Select" runat ="server" CommandArgument='<%# Eval("id")%>' OnClick="linkselect_Click" />
                       </ItemTemplate>
                     </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="."></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="."></asp:Label>
            <br />
            <br />
            Text&nbsp;:&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="194px" Width="327px"></asp:TextBox>
&nbsp;<br />
&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" Text="send" OnClick="Button5_Click" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="."></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Receive messages" />
            <br />
            <asp:Button ID="Button7" runat="server" Text="Back" OnClick="Button7_Click" />
            <br />
            <asp:Label ID="Label4" runat="server" Text="."></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text=".."></asp:Label>
        </div>
    </form>
</body>
</html>
