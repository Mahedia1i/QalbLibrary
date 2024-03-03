<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="QalbLibrary.Navbar" %>

<style>
    /* Navbar Styles */
    .navbar {
        overflow: hidden;
        background-color: #022632; /* Dark background color */
        padding: 10px 20px;
    }

    .navbar a {
        font-size: 2rem;
        float: left;
        display: block;
        color: white; /* Text color */
        text-align: center;
        padding: 14px 20px; /* Padding */
        text-decoration: none;
    }

    .navbar a:hover {
        background-color: #00e77f; /* Change color on hover */
        color: black; /* Text color on hover */
    }

    .dropdown {
        float: left;
        overflow: hidden;
    }

    .dropdown .dropbtn {
        font-size: 2rem;
        text-align: center;
        border: none;
        outline: none;
        color: white; /* Text color */
        padding: 14px 20px; /* Padding */
        background-color: inherit;
        font-family: inherit;
        margin: 0;
    }

    .dropdown:hover .dropbtn {
        background-color: #00e77f; /* Change color on hover */
        color: black; /* Text color on hover */
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9; /* Background color for dropdown content */
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content a {
        float: none;
        color: black; /* Text color */
        padding: 12px 16px; /* Padding */
        text-decoration: none;
        display: block;
        text-align: left;
    }

    .dropdown-content a:hover {
        background-color: #ddd; /* Change color on hover */
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    .login-btn {
        float: right;
        display: block;
        color: white;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
    }

    .login-btn:hover {
        background-color: #ddd;
        color: black;
    }
    
    .dropdown.dropdown-right {
    float: right;   
}


.dropdown::after {
    content: "";
    clear: both;
    display: table;
}

.dropdown.dropdown-right .dropdown-content {
    right: 0;
    left: auto;
    max-width: 200px; /* Adjust max-width as needed */
    overflow: auto; /* Add overflow to enable scrolling if dropdown is too large */
    white-space: nowrap; /* Prevent text from wrapping */
}

.dropdown.dropdown-right .dropdown-content::before {
    content: ''; /* Create pseudo-element */
    position: absolute;
    top: 0;
    right: 100%;
    border: 10px solid transparent;
    border-right: 10px solid #f9f9f9; /* Match background color of dropdown */
}


</style>

<script>
    function toggleLogin() {
        var isLoggedIn = <%= Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"] ? "true" : "false" %>;
        if (isLoggedIn) {
            // Logout
            window.location.href = "Logout.aspx"; // Redirect to logout page
        } else {
            // Redirect to login page
            window.location.href = "Login.aspx";
        }
    }
</script>

<div class="navbar">
    <a href="index.aspx" class="active">Home</a>
    <a href="#about">About</a>
    <a href="books.aspx">Books</a>
    <%--<div class="dropdown">
        <button class="dropbtn">Details</button>
        <div class="dropdown-content">
            <a href="#" onclick="detailsClick()">Issue Details</a>
            <a href="#" onclick="detailsClick()">Return Details</a>
        </div>
    </div>--%>
    <a href="#" Style="text-transform: none;">Contact us</a>
    <div class="dropdown dropdown-right">
    <button class="dropbtn" ><i class="fas fa-user"></i></button>
    <div class="dropdown-content">
        <a href="profile.aspx" onclick="editProfileClick()">Profile</a>
        <asp:LinkButton ID="loginBtn" runat="server" CssClass="login-btn" OnClick="loginBtn_Click"></asp:LinkButton>
    </div>
</div>

</div>


<script>
    // Update login button text based on session state
    var loginBtn = document.getElementById('<%= loginBtn.ClientID %>');
    var isLoggedIn = <%= Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"] ? "true" : "false" %>;
    if (isLoggedIn) {
        loginBtn.textContent = "Logout";
    } else {
        loginBtn.textContent = "Login";
    }

    function detailsClick() {
        var isLoggedIn = <%= Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"] ? "true" : "false" %>;
        if (!isLoggedIn) {
            // Redirect to login page if user is not logged in
            window.location.href = "Login.aspx";
        }
        // Handle details click event here for logged-in users
    }
</script>
