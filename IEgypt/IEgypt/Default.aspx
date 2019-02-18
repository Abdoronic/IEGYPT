<%@ Page Language="C#" Inherits="IEgypt.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>IEgypt</title>
</head>
<body>
	<form id="form1" runat="server">
            
            <h1 align="center"> IEGYPT </h1>
            
            <br>
            <br>
            <br>
            
            <asp:Button id="login_button" runat="server" Text="Log In" OnClick="login_button_click"/>
            <asp:Button id="register_button" runat="server" Text="Register a new account" OnClick="register_button_click"/>
            <asp:Button id="deactivate_button" runat="server" Text="Deactivate" OnClick="deactivate_button_click"/>
            
            <br>
            <br>
            
            <asp:Button id="view_button" runat="server" Text="View Profile" OnClick="view_button_click"/>
            <asp:Button id="edit_button" runat="server" Text="Edit Profile" OnClick="edit_button_click"/>
            
            <br>
            <br>
            <br>
            
            <h1>Search Content</h1>
            <h3>Content's Category</h3>
            <asp:TextBox id="search_content_category" runat="server"/>
            <h3>Content's Type</h3>
            <asp:TextBox id="search_content_type" runat="server"/>
            <br>
            <br>
            <asp:Button id="search_content_button" runat="server" Text="Search" OnClick="search_content_button_click"/>
            <br>
            <br>
            <asp:Label id = "search_content_label" text = "" runat="server"/>
            <br>
            <asp:GridView ID="search_content_results" runat="server">  </asp:GridView>
            
            <br>
            <br>
            <br>
            <br>
            
            <h1>Search Contributors</h1>
            <h3>Enter contributor's full name </h3>
            <asp:TextBox id="search_contributors_name" runat="server"/>
            <br>
            <br>
            <asp:Button id="search_contributors_button" runat="server" Text="Search" OnClick="search_contributors_button_click"/>
            <br>
            <br>
            <asp:Label id = "search_contributors_label" text = "" runat="server"/>
            <br>
            <asp:GridView ID="search_contributors_results" runat="server">  </asp:GridView>
            
            <br>
            <br>
            <br>
            
            <h1>Show Contributors</h1>
            <h3>Show the contributors with the highest experience </h3>
            <asp:Button id="show_contributors_button" runat="server" Text="Show" OnClick="Show_contributors_button_click"/>
            <br>
            <br>
            <asp:Label id = "show_contributors_label" text = "" runat="server"/>
            <br>
            <asp:GridView ID="show_contributors_results" runat="server">  </asp:GridView>
            
            <br>
            <br>
            <br>
            
            <h1>Show Original Content</h1>
            <h3>Specifiy a contributor's email if wanted </h3>
            <asp:TextBox id="show_original_content" runat="server"/>
            <br>
            <br>
            <asp:Button id="show_original_content_button" runat="server" Text="Search" OnClick="show_original_content_button_click"/>
            <br>
            <br>
            <asp:Label id = "show_original_content_label" text = "" runat="server"/>
            <br>
            <asp:GridView ID="show_original_content_results" runat="server">  </asp:GridView>
            
            <br>
            <br>
            <br>
	</form>
</body>
</html>
