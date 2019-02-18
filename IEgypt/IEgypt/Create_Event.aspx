<%@ Page Language="C#" Inherits="IEgypt.Create_Event" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
      
    </title>
</head>
<body>
                <p style="font-family: sans-serif; font-size: large; color: #FFFFFF; background-color: #000000; border: 2px solid #FF6699; font-weight: bold; font-variant: normal; text-transform: none; position: static; right: 15px; left: 15px; text-align: center">&nbsp;Create New Event<form id="form2" runat="server"> <p/>
        <br />
        Description :<br />
        <asp:TextBox ID="Description" runat="server" Height="10px"></asp:TextBox>
        <br />
        <br />
        Location :<br />
&nbsp;<asp:TextBox ID="Location" runat="server" Height="10px"></asp:TextBox>
        <br />
        <br />
        City:<br />
        <asp:TextBox ID="City" runat="server" Height="10px"></asp:TextBox>
        <br />
        <br />
        Time:<br />
&nbsp;<asp:TextBox ID="Time" runat="server" Height="10px"></asp:TextBox>
        <br />
        <br />
        Entertainer:<br />
&nbsp;<asp:TextBox ID="Entertainer" runat="server" Height="10px"></asp:TextBox>
        <br />
        <br />
        Insert Event Photos Link:
        <br />
&nbsp;<asp:TextBox ID="Photo" runat="server" Height="10px" style="margin-top: 11px"></asp:TextBox>
        <br />
        <br />
        Insert Event Videos Link:<br />
&nbsp;<asp:TextBox ID="Video" runat="server" Height="10px" style="margin-top: 11px"></asp:TextBox>
        <br />
        <br />
        Would You Like to Send An Advertisment For Your Event ?<br />
        <asp:CheckBox ID="CheckBoxAD" runat="server" BorderColor="White" BorderStyle="Dashed" Text="Yes" />
        <p>
            <asp:Button ID="Confirm" runat="server" Text="Confirm " OnClick="Confirm_Click" />
        </p>
    </form>
    
    </body>
</html>
