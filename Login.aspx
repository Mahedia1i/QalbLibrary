<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QalbLibrary.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login Page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            Login
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="username/Email">Username</label>
                                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="usernameRequiredValidator" runat="server" ControlToValidate="username" ErrorMessage="Username is required" CssClass="text-danger" />
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="passwordRequiredValidator" runat="server" ControlToValidate="password" ErrorMessage="Password is required" CssClass="text-danger" />
                            </div>
                            <asp:Button ID="btnlogin" class="btn btn-primary btn-block" runat="server" 
                                Text="Login" onclick="btnlogin_Click" />
                            <p class="text-center mt-3">Don't have an account? <a href="signup.aspx">Sign up</a></p>
                            <asp:Label ID="ErrorMessageLabel" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
