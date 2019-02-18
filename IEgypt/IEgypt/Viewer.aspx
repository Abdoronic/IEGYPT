<%@ Page Language="C#" Inherits="IEgypt.Viewer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
         #mydiv {
          background-color:white;
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1"><strong>Viewer HOME PAGE<br />
            <br />
            <br />
            </strong></span>Adevertisment<br />
            <asp:Button ID="Button1" runat="server" Text="choose" Width="80px" OnClick="Button1_Click" />
            <br />
            <br />
            Apply New Request<br />
            <asp:Button ID="Button2" runat="server" Text="choose" Width="80px" OnClick="Button2_Click" />
            <br />
            <br />
            Create Event<br />
            <asp:Button ID="Button3" runat="server" Text="choose" Width="80px" OnClick="Button3_Click" />
            <br />
            <br />
            Delete Request<br />
            <asp:Button ID="Button4" runat="server" Text="choose" Width="80px" OnClick="Button4_Click" />
            <br />
            <br />
            Edit and Delete ADs<br />
            <asp:Button ID="Button5" runat="server" Text="choose" Width="80px" OnClick="Button5_Click" />
            <br />
            <br />
            Write Comments<br />
            <asp:Button ID="Button10" runat="server" Text="choose" Width="80px" OnClick="Button10_Click" />
            <br />
            <br />
            Edit and Delete Comments<br />
            <asp:Button ID="Button6" runat="server" Text="choose" Width="80px" OnClick="Button6_Click" />
            <br />
            <br />
            Existing Request<br />
            <asp:Button ID="Button7" runat="server" Text="choose" Width="80px" OnClick="Button7_Click" />
            <br />
            <br />
            Rate<br />
            <asp:Button ID="Button8" runat="server" Text="choose" Width="80px" OnClick="Button8_Click" />
            <br />
            <br />
            Show New<br />
            <asp:Button ID="Button9" runat="server" Text="choose" Width="80px" OnClick="Button9_Click" />
            <br>
            <br>
            <asp:Button ID="BackButton" runat="server" Text="Back" Width="80px" OnClick="BackButton_Click" />
            </div>
    </form>
</body>
</html>