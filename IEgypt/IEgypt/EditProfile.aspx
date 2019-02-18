<%@ Page Language="C#" Inherits="IEgypt.EditProfile" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>EditProfile</title>
</head>
<body>
	<form id="form1" runat="server">
            <h1 align="center"> Edit Profile </h1>
            
            <br>
            
            <h2>Enter the data you want to update</h2>
            
            <br>
            <br>
            
            <h3>Email</h3>
            <asp:TextBox id="edit_email" runat="server"/>
            
            <br>
            
            <h3>Password</h3>
            <asp:TextBox id="edit_password" runat="server"/>
            
            <br>
            
            <h3>First name</h3>
            <asp:TextBox id="edit_firstname" runat="server"/>
            
            <br>
            
            <h3>Middle name</h3>
            <asp:TextBox id="edit_middlename" runat="server"/>
            
            <br>
            
            <h3>Last name</h3>
            <asp:TextBox id="edit_lastname" runat="server"/>
            
            <br>
            
            <h3>Birth Date</h3>
            
            <h4>Year</h4>
            <asp:TextBox id="edit_birth_year" runat="server"/>
            
            <br>
            
            <h4>Month</h4>
            <asp:TextBox id="edit_birth_month" runat="server"/>
            
            <br>
            
            <h4>Day</h4>
            <asp:TextBox id="edit_birth_day" runat="server"/>
            
            <br>
            <br>
            
            <h2> Viewer's Part </h2>
            
            <br>
            
            <h3>Working Place Name</h3>
            <asp:TextBox id="edit_working_place_name" runat="server"/>

            <br>
            
            <h3>Working Place Type</h3>
            <asp:TextBox id="edit_working_place_type" runat="server"/>

            <br>
            
            <h3>Working Place description</h3>
            <asp:TextBox id="edit_wokring_place_description" runat="server"/>

            <br>
            <br>
            
            <h2> Contributor's Part </h2>
            
            <br>
            
            <h3>Specilization</h3>
            <asp:TextBox id="edit_specilization" runat="server"/>

            <br>
            
            <h3>Portofolio Link</h3>
            <asp:TextBox id="edit_portofolio_link" runat="server"/>

            <br>
            
            <h3>Years Experience</h3>
            <asp:TextBox id="edit_years_experience" runat="server"/>

            <br>
            <br>
            
            <h2> Staff member's Part </h2>
            
            <br>
            
            <h3>Hire Date</h3>
            
            <h4>Year</h4>
            <asp:TextBox id="edit_hire_year" runat="server"/>
            
            <br>
            
            <h4>Month</h4>
            <asp:TextBox id="edit_hire_month" runat="server"/>
            
            <br>
            
            <h4>Day</h4>
            <asp:TextBox id="edit_hire_day" runat="server"/>
            
            <br>
            
            <h3>Number of Working Hours</h3>
            <asp:TextBox id="edit_working_hours" runat="server"/>

            <br>
            
            <h3>Payment Rate</h3>
            <asp:TextBox id="edit_payment_rate" runat="server"/>

            <br>
            <br>
            
            <asp:Button id="do_edit_button" runat="server" Text="Edit Profile" OnClick="do_edit_button_click"/>
            
            <br>
            <br>
            <br>
            
            <asp:Button ID="BackButton" runat="server" Text="Back" Width="80px" OnClick="BackButton_Click" />
            
            <br>
            <br>
	</form>
</body>
</html>
