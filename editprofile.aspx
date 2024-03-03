<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editprofile.aspx.cs" Inherits="QalbLibrary.editprofile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit Profile</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
    <style>
        .profile-picture {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Edit Profile</h2>
            <asp:HyperLink ID="hyper" CssClass="back" NavigateUrl="~/profile.aspx" runat="server">back</asp:HyperLink>
            <div class="profile-info">
                <div class="profile-picture">
                    <img id="profileImage" src="<%= ProfileImageUrl %>" alt="Profile Picture" />
                    <asp:FileUpload ID="fileUpload" runat="server" onchange="previewImage(event)" />
                </div>
                <div class="profile-details">
                    <label for="txtName">Name:</label>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <label for="txtEmail">Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" Style="text-transform: none;"></asp:TextBox>
                    <label for="txtPhone">Phone:</label>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </div>
            </div>
            <button type="button" onclick="document.getElementById('<%= fileUpload.ClientID %>').click()">Change Picture</button>
            <asp:Button ID="btnSaveProfile" runat="server" Text="Save Profile" CssClass="buttonsave" OnClick="SaveProfile_Click" />
            <asp:Button ID="btnInsertProfile" runat="server" Text="Save Profile" CssClass="buttonsave" OnClick="InsertProfile_Click" />
            <asp:Label ID="ErrorMessageLabel" runat="server" Text="" CssClass="text-danger"></asp:Label>
        </div>
    </form>
    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('profileImage');
                output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</body>
</html>
