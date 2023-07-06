<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SystemForgotPassword.aspx.cs" Inherits="HNEnterpreneur.SystemForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Forgot Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Home.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Forgot Password</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- login -->
    <div class="login">
        <div class="container">
            <h3 class="animated wow zoomIn" data-wow-delay=".5s">Forgot Password</h3>
            <p class="est animated wow zoomIn" data-wow-delay=".5s">
            </p>
            <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                <h6 class="animated wow slideInUp" data-wow-delay=".5s">Reset Your Password With Email</h6>
                <form runat="server">
                    <%-- Email --%>
                    <input id="txtEmail" runat="server" type="email" placeholder="Email Address" required autofocus>
                    <div class="form-row">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter [Email]" ControlToValidate="txtEmail" Display="Dynamic" CssClass="alert alert-danger col-lg-12"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ControlToValidate="txtEmail" CssClass="alert alert-danger col-lg-12" Display="Dynamic" ErrorMessage="Invalid [Email] format" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:Label ID="lblMsg" runat="server" Text="Invalid email account" CssClass="alert alert-success col-lg-12"></asp:Label>
                        <asp:Label ID="lblErr" runat="server" Text="Invalid email account" CssClass="alert alert-danger col-lg-12"></asp:Label>
                    </div>
                    <%-- Back to login --%>
                    <div class="forgot">
                        <a href="SystemLogin.aspx">Back To Login</a>
                    </div>
                    <%-- Submit Button --%>
                    <asp:Button ID="btnResetPass" runat="server" Text="Reset Password" OnClick="btnResetPass_Click" />
                </form>
            </div>
            <h4 class="animated wow slideInUp" data-wow-delay=".5s">For New People</h4>
            <p class="animated wow slideInUp" data-wow-delay=".5s"><a href="SystemRegister.aspx">Register Here</a> (Or) go back to <a href="Home.aspx">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
        </div>
    </div>
</asp:Content>
