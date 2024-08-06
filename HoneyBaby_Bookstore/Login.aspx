<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HoneyBaby_Bookstore.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap Darkly theme CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/darkly/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="Content/site.css" rel="stylesheet" />
</head>
<body class="login">
    <form id="form1" runat="server" class="form-horizontal">
         
            <div class="shadow-box w-100 login-box">
                   <h2 class="text-center">Login</h2>
            <div class="form-group">
                <label class="control-label col-sm-2" for="txtFirstName">First Name:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="txtLastName">Last Name:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" Height="34px" Width="105px" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" Height="34px" Width="104px" />
                </div>
            </div>
                   <div class="form-group">
                        <br />
            <%-- message label --%>
                     <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-info col-sm-12 login-error" EnableViewState="False" ForeColor="#FF3300"></asp:Label>
                   </div>
        </div>
        
    </form>
</body>
</html>
