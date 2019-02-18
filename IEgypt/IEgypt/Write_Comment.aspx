<%@ Page Language="C#" Inherits="IEgypt.Write_Comment" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
    </title>
</head>
<body>
        <p style="font-family: sans-serif; font-size: large; color: #000000; background-color: #CCCCFF; border: 2px solid #FF6699; font-weight: bold; font-variant: normal; text-transform: none; position: static; right: 15px; left: 15px; text-align: center">Write&nbsp; Comment<form id="form1" runat="server">
        <div>
                <asp:GridView ID="table1" runat="server" AutoGenerateColumns="false" Width="593px" >
                <Columns>
                    <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name"/>
                   <asp:BoundField DataField="type" HeaderText="type"/>
                    <asp:BoundField DataField=" category_type" HeaderText=" category_type"/>
                    <asp:BoundField DataField="uploaded_at" HeaderText="uploaded_at"/>
                     <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect" Text="Write Comment" runat ="server" CommandArgument='<%# Eval("id")%>' OnClick="linkselect_Click" />
                       </ItemTemplate>
                     </asp:TemplateField>
                </Columns>
                </asp:GridView>
        </div>
        <p>
            Write Comment :
        </p>
        <p>
            <asp:TextBox ID="comment" runat="server" Height="55px" OnTextChanged="TextBox1_TextChanged" Width="249px"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Post Comment aw post malone msh damen " />
    </form>
</body>
</html>
