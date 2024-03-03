<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="QalbLibrary.signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sign Up Page</title>
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
                            Sign Up
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="username" Text="Username"></asp:Label>
                                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="usernameRequiredValidator" runat="server" ControlToValidate="username" ErrorMessage="Username is required" CssClass="text-danger" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="email" Text="Email"></asp:Label>
                                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="emailRequiredValidator" runat="server" ControlToValidate="email" ErrorMessage="Email is required" CssClass="text-danger" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" AssociatedControlID="password" Text="Password"></asp:Label>
                                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="passwordRequiredValidator" runat="server" ControlToValidate="password" ErrorMessage="Password is required" CssClass="text-danger" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" AssociatedControlID="confirmPassword" Text="Confirm Password"></asp:Label>
                                <asp:TextBox ID="confirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="confirmPasswordRequiredValidator" runat="server" ControlToValidate="confirmPassword" ErrorMessage="Confirm password is required" CssClass="text-danger" />
                                <asp:CompareValidator ID="confirmPasswordCompareValidator" runat="server" ControlToValidate="confirmPassword" ControlToCompare="password" ErrorMessage="Passwords do not match" CssClass="text-danger" />
                            </div>
                            <asp:Button ID="SignUpButton" runat="server" Text="Sign Up" 
                                CssClass="btn btn-primary btn-block" onclick="SignUpButton_Click"/>
                            <p class="text-center mt-3">Already have an account? <a href="login.aspx">Login</a></p>
                            <asp:Label ID="ErrorMessageLabel" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>


