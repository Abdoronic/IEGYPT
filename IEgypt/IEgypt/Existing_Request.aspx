<%@ Page Language="C#" Inherits="IEgypt.Existing_Request" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <p style="font-family: sans-serif; font-size: large; color: #000000; background-color: #CCCCFF; border: 2px solid #FF6699; font-weight: bold; font-variant: normal; text-transform: none; position: static; right: 15px; left: 15px; text-align: center">Make an Order </p>

                <asp:GridView ID="Table1" runat="server" AutoGenerateColumns="false" Width="593px" >
                <Columns>
                    <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name"/>
                   <asp:BoundField DataField="type" HeaderText="type"/>
                    <asp:BoundField DataField=" category_type" HeaderText=" category_type"/>
                    <asp:BoundField DataField="uploaded_at" HeaderText="uploaded_at"/>
                     <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect" Text="Select Content" runat ="server" CommandArgument='<%# Eval("id")%>' OnClick="linkselect_Click" />
                       </ItemTemplate>
                     </asp:TemplateField>
                </Columns>
                </asp:GridView>
             <br />
             <br />
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Confirm Order" />
    </form>
</body>
</html>
