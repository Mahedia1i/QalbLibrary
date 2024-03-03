<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="books.aspx.cs" Inherits="QalbLibrary.profileimage.books" %>
<%@ Register Src="Navbar.ascx" TagName="Navbar" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Books</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <%-- Include the Navbar user control --%>
        <uc:Navbar ID="Navbar1" runat="server" />

        <div class="book-container">
            <!-- Loop through books and display them in cards -->
            <asp:Repeater ID="BookRepeater" runat="server">
                <ItemTemplate>
                    <div class="book-card">
                    <div class="b-image">
                        <img class="book-image" src='<%# Eval("ImageUrl") %>' alt="Book Image" />
                        </div>
                        <div class="b-text">
                        <div class="book-title"><%# Eval("BookName") %></div>
                        <div class="book-author">by <%# Eval("Author") %></div>
                        <div class="book-description"><%# Eval("Description") %></div>
                        </div>
                        <div class="issue">
                            <asp:Button ID="IssueButton" runat="server" CssClass="issue-btn" Text="Issue" OnClick="IssueButton_Click" CommandArgument='<%# Eval("bookid") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
