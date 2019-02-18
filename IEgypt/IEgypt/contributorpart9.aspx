<%@ Page Language="C#" Inherits="IEgypt.contributorpart9" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
         #mydiv {
          background-color:silver;
            height: 1518px;
        }
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body style="height: 1128px">
    <form id="form1" runat="server">
        <div id="mydiv">
            <br class="auto-style1" />
            <span class="auto-style1">advertisements for publicity</span><br />
            <br />
             <asp:GridView ID="table1" runat="server" AutoGenerateColumns="False" Width="1014px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                 <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                     <asp:BoundField DataField="email" HeaderText="email"/>
                    <asp:BoundField DataField="description" HeaderText="description"/>
                   <asp:BoundField DataField="location" HeaderText="location"/>
                    <asp:TemplateField>
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
            <span class="auto-style1">advertisements for events</span><br />
            <asp:GridView ID="table2" runat="server" AutoGenerateColumns="False" Width="1014px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" >
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                     <asp:BoundField DataField="email" HeaderText="email"/>
                    <asp:BoundField DataField="description" HeaderText="description"/>
                   <asp:BoundField DataField="location" HeaderText="location"/>
                   <asp:BoundField DataField="city" HeaderText="city"/>
                    <asp:BoundField DataField="time" HeaderText="time"/>
                    <asp:TemplateField>
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
            <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
