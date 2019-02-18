<%@ Page Language="C#" Inherits="IEgypt.Apply_New_Request" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p style="font-family: sans-serif; font-size: large; color: #000000; background-color: #CCCCFF; border: 2px solid #FF6699; font-weight: bold; font-variant: normal; text-transform: none; position: static; right: 15px; left: 15px; text-align: center">
            Apply New For Request 
        </p>
        <p>
            Information About Required Content :</p>
        <p>
            <asp:TextBox ID="info" runat="server" Height="74px" Width="471px"></asp:TextBox>
        </p>
        <p>
            Contributor Email (if you would like to specify any) :</p>
        <p>
&nbsp;<asp:TextBox ID="email" runat="server" Height="16px" style="margin-bottom: 0px" Width="169px"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
            
            <asp:Button ID="ConfirmButton" runat="server" Text="Confirm" Width="80px" OnClick="Confirm_Click" />
        <p>
            &nbsp;</p>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
