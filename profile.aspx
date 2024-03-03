<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="QalbLibrary.profile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Profile</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
    <!-- Add JavaScript function to print page -->
    <script>
        function printPage() {
            window.print();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>
                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/index.aspx" runat="server">Profile</asp:HyperLink></h2>
            <div class="profile-info">
                <div class="profile-picture">
                    <asp:Image ID="profileImage" runat="server" CssClass="profile-picture" AlternateText="Profile Picture" />
                </div>
                <div class="profile-details">
                    <div class="rows">
                        <label class="profile-label">Name:</label>
                        <asp:Label ID="lblName" runat="server" CssClass="profile-text"></asp:Label>
                        <div class="row-line"></div>
                    </div>
                    <div class="rows">
                        <label class="profile-label">Email:</label>
                        <asp:Label ID="lblEmail" runat="server" CssClass="profile-text" Style="text-transform: none;"></asp:Label>
                        <div class="row-line"></div>
                    </div>
                    <div class="rows">
                        <label class="profile-label">Phone:</label>
                        <asp:Label ID="lblPhone" runat="server" CssClass="profile-text"></asp:Label>
                        <div class="row-line"></div>
                    </div>
                </div>
            </div>
            <asp:Button ID="btnEditProfile" CssClass="buttonsave" runat="server" Text="Edit Profile" onclick="btnEditProfile_Click"  />
            <!-- Call printPage function when Download iCard button is clicked -->
            <asp:Button ID="btndload" CssClass="dload" runat="server" Text="Download iCard" OnClientClick="printPage(); return false;" />
        </div>
    </form>
</body>
</html>
