﻿<%@ Page Language="C#" Inherits="IEgypt.contributorpart5" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
         #mydiv {
          background-color:silver;
        }
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mydiv">

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1">Contributor upload new content</span><br />
            <br />

               <asp:GridView ID="table1" runat="server" AutoGenerateColumns="False" Width="904px" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                   <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                     <asp:BoundField DataField="email" HeaderText="email"/>
                    <asp:BoundField DataField="accept_status" HeaderText="accept_status"/>
                   <asp:BoundField DataField="specified" HeaderText="specified"/>
                   <asp:BoundField DataField="information" HeaderText="information"/>
                     <asp:BoundField DataField="accept_date" HeaderText="accept_date"/>
                    <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect" Text="reply on" runat ="server" CommandArgument='<%# Eval("id")%>' OnClick="linkselect_Click" />
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

               choose type<br />
             <asp:GridView ID="table2" runat="server" AutoGenerateColumns="False" Width="907px" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                 <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="type" HeaderText="type"/>
                     <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect1" Text="Select" runat ="server" CommandArgument='<%# Eval("type")%>' OnClick="linkselect1_Click" />
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
            choose
            Subcategory<asp:GridView ID="table3" runat="server" AutoGenerateColumns="False" Width="904px" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="category_type" HeaderText="cat"/>
                    <asp:BoundField DataField="name" HeaderText="sub_cat"/>
                     <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect2" Text="Select" runat ="server" CommandArgument='<%# Eval("name")%>' OnClick="linkselect2_Click" />
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
            choose
            Category<asp:GridView ID="table4" runat="server" AutoGenerateColumns="False" Width="904px" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="type" HeaderText="category"/>
                     <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect3" Text="Select" runat ="server" CommandArgument='<%# Eval("type")%>' OnClick="linkselect3_Click" />
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
            &nbsp;request id<br />
               <asp:Label ID="Label2" runat="server" Text="."></asp:Label>
               <br />
            <br />
            <br />
            Enter URL for the content<br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload content" Width="119px" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="."></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text=".."></asp:Label>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
