<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminRegisterAcc.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.AdminRegisterAcc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Register New Account
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Register an Account</h2>
    <hr />
    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
    <div class="container">
        <form id="form1" runat="server" class="col-md-10">
            <div class="row">
                <!-- name -->
                <div class="form-group col-md-6">
                    <div class="form-row">
                        <label for="txtInputName">User name</label>
                        <input class="form-control" id="txtInputName" type="text" aria-describedby="nameHelp" placeholder="Enter name" required runat="server">
                        <asp:RegularExpressionValidator ID="revInputName" runat="server"
                            ErrorMessage="Value must be alphabel and space" Display="Dynamic" CssClass="alert alert-danger col-sm-12"
                            ValidationExpression="^[a-zA-Z]+(([ ][a-zA-Z ])?[a-zA-Z]*)*$" ControlToValidate="txtInputName"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <!-- email address -->
                <div class="form-group col-md-6">
                    <div class="form-row">
                        <label for="txtEmail">Email address</label>
                        <%--<input class="form-control" id="txtEmail" type="text" aria-describedby="emailHelp" placeholder=" required runat="server">--%>
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter email" CssClass="form-control" TextMode="Email" required></asp:TextBox>
                        <asp:Label ID="erremail" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <!-- password -->
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-6">
                        <label for="pwdPassword1">Password</label>
                        <input class="form-control" id="pwdPassword1" type="password" placeholder="Password" maxlength="15" required runat="server">
                        <div class="form-row">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                ErrorMessage="Value must between 8-15, contain at least 2 number and all letter"
                                Display="Dynamic" CssClass="alert alert-danger col-md-12"
                                ValidationExpression='^(?=.*[0-9].*[0-9])(?=.*[a-zA-z]).{8,15}$'
                                ControlToValidate="pwdPassword1"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="pwdPassword2">Confirm password</label>
                        <input class="form-control" id="pwdPassword2" type="password" placeholder="Confirm password" maxlength="15" required runat="server">
                        <div class="form-row">
                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                ControlToValidate="pwdPassword1"
                                CssClass="alert alert-danger col-md-12"
                                ControlToCompare="pwdPassword2"
                                ErrorMessage="Comfirm Password no match"
                                ToolTip="Password must be the same" Display="Dynamic" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- user type -->
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-6">
                        <label for="sel1">Account Type</label>
                        <select class="form-control" id="selAccTyp" runat="server">
                            <option value="Admin">Admin</option>
                            <option value="StoreAdmin">Store keeper</option>
                            <option value="CStaff">Cooking staff</option>
                            <option value="DStaff">Delivery staff</option>
                            <option value="PStaff">Preparation staff</option>
                            <option value="Supplier">Supplier</option>
                            <option value="Member">Member</option>
                        </select>
                    </div>
                </div>
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary btn-block float-sm-right col-3" OnClick="btnRegister_Click" />
        </form>
    </div>
    <script>
        function validate(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
            var regex = /[0-9]/;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault) theEvent.preventDefault();
            }
        }
    </script>
</asp:Content>