<%@ Page Language="C#" Inherits="IEgypt.Edit_and_Delete_Comments" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                 <asp:GridView ID="table1" runat="server" AutoGenerateColumns="false" Width="593px" >
                <Columns>
                    <asp:BoundField DataField="information" HeaderText="info"/>
                    <asp:BoundField DataField="information" HeaderText="info"/>
                    <asp:BoundField DataField="information" HeaderText="info"/>
                     <asp:TemplateField>
                       <ItemTemplate>
                        <asp:LinkButton ID ="linkselect" Text="Delete" runat ="server" CommandArgument='<%# Eval("id")%>' OnClick="linkselect_Click" />
                           </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField>
                               <ItemTemplate>
                           <asp:LinkButton ID ="LinkButton1" Text="Edit" runat ="server" CommandArgument='<%# Eval("id")%>' OnClick="LinkButton1_Click" />
                       </ItemTemplate>
                     </asp:TemplateField>
                </Columns>
                </asp:GridView>
                 <br />
        </div>
        <p>
            Edit your selected comment Below : </p>
        <p>
            <asp:TextBox ID="TextBox1" runat="server" Height="62px" Width="212px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Confirm Edit" />
        </p>
        <p>
            Are you sure you want to delete the comment you clicked on&nbsp; ? :
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirm Deletion" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button3" runat="server" Text="HomePage" OnClick="Button3_Click" />
        </p>
    </form>
</body>
</html>
