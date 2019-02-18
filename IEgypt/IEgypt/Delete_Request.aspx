<%@ Page Language="C#" Inherits="IEgypt.Delete_Request" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <p style="font-family: sans-serif; font-size: large; color: #000000; background-color: #CCCCFF; border: 2px solid #FF6699; font-weight: bold; font-variant: normal; text-transform: none; position: static; right: 15px; left: 15px; text-align: center">
            Unconfirmed Requests
        </p>
               <asp:GridView ID="table1" runat="server" AutoGenerateColumns="false" Width="593px" >
                <Columns>
                    <asp:BoundField DataField="information" HeaderText="info"/>
                     <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect" Text="Delete" runat ="server" CommandArgument='<%# Eval("id")%>' OnClick="linkselect_Click" />
                       </ItemTemplate>
                     </asp:TemplateField>
                </Columns>
                </asp:GridView>
         <p>
             <asp:Button ID="Button1" runat="server" Text="Confirm Deletion" />
         </p>
    </form>
</body>
</html>
