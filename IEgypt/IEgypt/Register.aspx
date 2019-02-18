<%@ Page Language="C#" Inherits="IEgypt.Register" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Register</title>
</head>
<body>
    <form id="form1" runat="server">
            
            <h1 align="center"> Register A New Account </h1>
            
            <br>
            <br>
            <br>
            
            <h3>Register As</h3>
            <asp:DropDownList id = "register_userType" runat="server">
                <asp:ListItem Enabled = "true" Text = "Choose your type" Value = "-1"> </asp:ListItem>
                <asp:ListItem Text = "Viewer" Value = "Viewer"> </asp:ListItem>
                <asp:ListItem Text = "Contributor" Value = "Contributor"> </asp:ListItem>
                <asp:ListItem Text = "Authorized Reviewer" Value = "Authorized Reviewer"> </asp:ListItem>
                <asp:ListItem Text = "Content Manager" Value = "Viewer"> </asp:ListItem>
            </asp:DropDownList>
            
            <br>
            
            <h3>Email</h3>
            <asp:TextBox id="register_email" runat="server"/>
            
            <br>
            
            <h3>Password</h3>
            <asp:TextBox id="register_password" runat="server"/>
            
            <br>
            
            <h3>First name</h3>
            <asp:TextBox id="register_firstname" runat="server"/>
            
            <br>
            
            <h3>Middle name</h3>
            <asp:TextBox id="register_middlename" runat="server"/>
            
            <br>
            
            <h3>Last name</h3>
            <asp:TextBox id="register_lastname" runat="server"/>
            
            <br>
            
            <h3>Birth Date</h3>
            
            <h4>Year</h4>
            <asp:TextBox id="register_birth_year" runat="server"/>
            
            <br>
            
            <h4>Month</h4>
            <asp:TextBox id="register_birth_month" runat="server"/>
            
            <br>
            
            <h4>Day</h4>
            <asp:TextBox id="register_birth_day" runat="server"/>
            
            <br>
            <br>
            
            <h2> Viewer's Part </h2>
            
            <br>
            
            <h3>Working Place Name</h3>
            <asp:TextBox id="register_working_place_name" runat="server"/>

            <br>
            
            <h3>Working Place Type</h3>
            <asp:TextBox id="register_working_place_type" runat="server"/>

            <br>
            
            <h3>Working Place description</h3>
            <asp:TextBox id="register_wokring_place_description" runat="server"/>

            <br>
            <br>
            
            <h2> Contributor's Part </h2>
            
            <br>
            
            <h3>Specilization</h3>
            <asp:TextBox id="register_specilization" runat="server"/>

            <br>
            
            <h3>Portofolio Link</h3>
            <asp:TextBox id="register_portofolio_link" runat="server"/>

            <br>
            
            <h3>Years Experience</h3>
            <asp:TextBox id="register_years_experience" runat="server"/>

            <br>
            <br>
            
            <h2> Staff member's Part </h2>
            
            <br>
            
            <h3>Hire Date</h3>
            
            <h4>Year</h4>
            <asp:TextBox id="register_hire_year" runat="server"/>
            
            <br>
            
            <h4>Month</h4>
            <asp:TextBox id="register_hire_month" runat="server"/>
            
            <br>
            
            <h4>Day</h4>
            <asp:TextBox id="register_hire_day" runat="server"/>
            
            <br>
            
            <h3>Number of Working Hours</h3>
            <asp:TextBox id="register_working_hours" runat="server"/>

            <br>
            
            <h3>Payment Rate</h3>
            <asp:TextBox id="register_payment_rate" runat="server"/>

            <br>
            <br>
            
            <asp:Button id="do_register_button" runat="server" Text="Register" OnClick="do_register_button_click"/>
            
            <br>
            <br>
            <br>
            
            <asp:Button ID="back_to_login_button" runat="server" Text="Already have an account? Log IN" Width="80px" OnClick="back_to_login_button_click" />
            
            <br>
            <br>
            
            <asp:Button ID="BackButton" runat="server" Text="Back" Width="80px" OnClick="BackButton_Click" />
            
            <br>
            <br>
    </form>
</body>
</html>
