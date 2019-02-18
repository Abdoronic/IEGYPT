﻿<%@ Page Language="C#" Inherits="IEgypt.contributorpart6" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
         #mydiv {
          background-color:silver;
            height: 1247px;
        }
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mydiv">

             <br />
             <span class="auto-style1">delete from original content</span><br />

             <asp:GridView ID="table1" runat="server" AutoGenerateColumns="False" Width="904px" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"  >
                 <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                  
                    <asp:BoundField DataField="link" HeaderText="link"/>
                   <asp:BoundField DataField="uploaded_at" HeaderText="uploaded_at"/>
                     <asp:BoundField DataField="category_type" HeaderText="category_type"/>
                     <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name"/>
                    <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect" Text="delete" runat ="server" CommandArgument='<%# Eval("id")%>' OnClick="linkselect_Click" />
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
             <span class="auto-style1">delete from new content</span><asp:GridView ID="table2" runat="server" AutoGenerateColumns="False" Width="904px" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" >
                 <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                
                    <asp:BoundField DataField="link" HeaderText="link"/>
                   <asp:BoundField DataField="uploaded_at" HeaderText="uploaded_at"/>
                     <asp:BoundField DataField="category_type" HeaderText="category_type"/>
                     <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name"/>
                    <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect" Text="delete" runat ="server" CommandArgument='<%# Eval("id")%>' OnClick="linkselect_Click" />
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
             <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click1" />
            <br />
             <asp:Label ID="Label3" runat="server" Text=".."></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="."></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="."></asp:Label>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
