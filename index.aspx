<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QalbLibrary.index" %>
<%@ Register Src="Navbar.ascx" TagName="Navbar" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QalbLibrary</title>
    <!-- font link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
    <%-- Include the Navbar user control --%>
        <uc:Navbar runat="server" />
    <div>
    <!-- home section start -->

    <section class="home" id="home">

        <div class="row">

            <div class="content">
    <h3>Qalb <span>Library</span></h3>
    <div class="ir">
        <% if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"]) { %>
            <asp:Button ID="btnIssue" runat="server" class="irbtn" Text="Issue Books" 
                onclick="btnIssue_Click"></asp:Button>
            <asp:Button ID="btnReturn" runat="server" class="irbtn" Text="Return Books" 
                onclick="btnReturn_Click"></asp:Button>
        <% } %>
    </div>
</div>

            <div class="image">
                <img src="image/home-img.png" alt="">
                
            </div>

        </div>

    </section>

    <!-- home section end -->

    <!-- counter start -->

    <section class="count">

        <div class="box-container">

            <div class="box">
                <i class="fas fa-graduation-cap"></i>
                <div class="content">
                    <h3>150+</h3>
                    <p>courses</p>
                </div>
            </div>

            <div class="box">
                <i class="fas fa-user-graduate"></i>
                <div class="content">
                    <h3>1300+</h3>
                    <p>student</p>
                </div>
            </div>

            <div class="box">
                <i class="fas fa-chalkboard-user"></i>
                <div class="content">
                    <h3>80+</h3>
                    <p>teacher</p>
                </div>
            </div>

            <div class="box">
                <i class="fas fa-face-smile"></i>
                <div class="content">
                    <h3>99.9%</h3>
                    <p>satisfaction</p>
                </div>
            </div>

        </div>

    </section>

    <!-- counter end -->

    <!-- about start -->

    <section class="about" id="about">

        <div class="row">

            <div class="image">
                <img src="image/about-img.png" alt="" " />
            </div>

            <div class="content">
                <h3>why choose us?</h3>
                <p>We understand that needs don't always adhere to a schedule, which is why our services are available round-the-clock, 24 hours a day, 7 days a week. Whether it's an urgent issue that requires immediate attention or simply a matter of convenience, our dedicated team is here to assist you whenever you need us. Our commitment to providing uninterrupted support means you can rely on us at any hour, ensuring peace of mind and prompt resolution to your inquiries or concerns. With our 24/7 availability, we strive to deliver exceptional service and support whenever you require it, because your satisfaction and convenience are our top priorities.  </p>
                
            </div>

        </div>

    </section>

    <!-- about end -->

     <footer class="footer">
        <section>
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-linkedin"></a>
                <a href="#" class="fab fa-instagram"></a>
            </div>
            <div class="credit">&copy; copyright @ 2024 by <span>mr. mahediali </span>| all rigths reserved!</div>
        </section>
    </footer>
    </div>
    </form>
</body>
</html>
