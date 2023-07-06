<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SystemResetPassword.aspx.cs" Inherits="HNEnterpreneur.SystemResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Reset Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Home.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Reset Password</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- register -->
    <div class="register">
        <div class="container">
            <h3 class="animated wow zoomIn" data-wow-delay=".5s">Reset Password</h3>
            <p class="est animated wow zoomIn" data-wow-delay=".5s">
                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia 
				deserunt mollit anim id est laborum.
            </p>
            <div class="login-form-grids">
                <h6 class="animated wow slideInUp" data-wow-delay=".5s">Enter New Password</h6>
                <form runat="server" class="animated wow slideInUp" data-wow-delay=".5s">
                    <%-- Email --%>
                    <input id="txtEmail" class="disabled" runat="server" type="email" placeholder="Email Address" required disabled>
                    <asp:Label ID="erremail" runat="server" Text=""></asp:Label>
                    <div class="form-row">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter [Email]" ControlToValidate="txtEmail" Display="Dynamic" CssClass="alert alert-danger col-lg-12"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ControlToValidate="txtEmail" CssClass="alert alert-danger col-lg-12" Display="Dynamic" ErrorMessage="Invalid [Email] format" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <%-- Password --%>
                    <input id="txtPass" runat="server" type="password" placeholder="New Password"  maxlength="15" required autofocus>
                    <div class="form-row">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ErrorMessage="Value must between 8-15, contain at least 2 number and all letter"
                            Display="Dynamic" CssClass="alert alert-danger col-md-12"
                            ValidationExpression='^(?=.*[0-9].*[0-9])(?=.*[a-zA-z]).{8,15}$'
                            ControlToValidate="txtPass"></asp:RegularExpressionValidator>
                    </div>
                    <%-- Password Comfirmation --%>
                    <input id="txtPassComf" runat="server" type="password" placeholder="New Password Confirmation"  maxlength="15" required>
                    <div class="form-row">
                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ControlToValidate="txtPass"
                            CssClass="alert alert-danger col-md-12"
                            ControlToCompare="txtPassComf"
                            ErrorMessage="Password Comfirmation no match"
                            ToolTip="Password must be the same" Display="Dynamic" />
                        
                        <asp:Label ID="lblErr" runat="server" Text="There are some errors occur, please try reset again." CssClass="alert alert-danger col-lg-12"></asp:Label>
                    </div>
                    <%-- Reset Button --%>
                    <asp:Button ID="btnResetPass" runat="server" Text="Reset Password" OnClick="btnResetPass_Click" />
                </form>
            </div>
            <div class="register-home animated wow slideInUp" data-wow-delay=".5s">
                <a href="Home.aspx">Home</a>
            </div>
        </div>
    </div>
    <!-- //register -->
</asp:Content>
