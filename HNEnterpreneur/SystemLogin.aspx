<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SystemLogin.aspx.cs" Inherits="HNEnterpreneur.SystemLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Home.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Login</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- login -->
    <div class="login">
        <div class="container">
            <h3 class="animated wow zoomIn" data-wow-delay=".5s">Login</h3>
            <p>
                <asp:Label ID="lblLogin" runat="server" Text=""></asp:Label>
            </p>
            <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                <form runat="server">
                    <%-- Email --%>
                    <input id="txtEmail" runat="server" type="email" placeholder="Email Address" required autofocus>
                    <div class="form-row">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter [Email]" ControlToValidate="txtEmail" Display="Dynamic" CssClass="alert alert-danger col-lg-12"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ControlToValidate="txtEmail" CssClass="alert alert-danger col-lg-12" Display="Dynamic" ErrorMessage="Invalid [Email] format" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <asp:Label ID="errusr" runat="server" Text=""></asp:Label>
                    <%-- Password --%>
                    <input id="txtPW" runat="server" type="password" placeholder="Password" required>
                    <div class="form-row">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter [Password]" ControlToValidate="txtPW" CssClass="alert alert-danger col-lg-12" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvNotMatched" runat="server" ErrorMessage="[Password] and [Email] not matched" ControlToValidate="txtPW" CssClass="alert alert-danger col-lg-12" Display="Dynamic"></asp:CustomValidator>
                    </div>
                    <%-- Forgot Password --%>
                    <div class="forgot">
                        <a href="SystemForgotPassword.aspx">Forgot Password?</a>
                    </div>
                    <%-- Submit Button --%>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                </form>
            </div>
            <h4 class="animated wow slideInUp" data-wow-delay=".5s">For New People</h4>
            <p class="animated wow slideInUp" data-wow-delay=".5s"><a href="SystemRegister.aspx">Register Here</a> (Or) go back to <a href="Home.aspx">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
        </div>
    </div>
    <!-- //login -->
</asp:Content>
