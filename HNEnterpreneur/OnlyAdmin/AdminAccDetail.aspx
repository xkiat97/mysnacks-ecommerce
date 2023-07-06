<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAccDetail.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.AdminAccDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Account Details
    <asp:Label ID="lblUsr" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Account details</h2>
    <hr />
    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
    <div class="container">
        <form id="form1" runat="server" class="col-md-10">
            <!-- user id and its status -->
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-2">
                        User ID :
                        <asp:Label ID="lblUsrID" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-6">
                        <label for="hlUserDetail">Register By : </label>
                        <asp:HyperLink ID="hlUserDetail" runat="server"></asp:HyperLink>
                    </div>
                    <div class="col-md-4">
                        User Status :
                        <asp:Label ID="lblUsrSts" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- email address -->
                <div class="form-group col-md-6">
                    <div class="form-row">
                        <label for="txtEmail">Email address</label>
                        <input class="form-control" id="txtEmail" type="text" aria-describedby="emailHelp" placeholder="Enter email" required runat="server">
                        <asp:Label ID="erremail" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <!-- name -->
                <div class="form-group col-md-6">
                    <div class="form-row">
                        <label for="txtInputName">User Name</label>
                        <input class="form-control" id="txtInputName" type="text" aria-describedby="nameHelp" placeholder="Enter name" required runat="server">
                    </div>
                    <asp:RegularExpressionValidator ID="revInputName" runat="server"
                        ErrorMessage="Value must be alphabel and space" Display="Dynamic" CssClass="alert alert-danger form-row"
                        ValidationExpression="^[a-zA-Z]+(([ ][a-zA-Z ])?[a-zA-Z]*)*$" ControlToValidate="txtInputName"></asp:RegularExpressionValidator>
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
                                Display="Dynamic" CssClass="alert alert-danger"
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
                        <label for="selAccTyp">Account Type</label>
                        <select class="form-control" id="selAccTyp" runat="server">
                            <option value="Admin">Admin</option>
                            <option value="StoreAdmin">Store keeper</option>
                            <option value="CStaff">Cooking staff</option>
                            <option value="DStaff">Delivery staff</option>
                            <option value="PStaff">Preparation staff</option>
                            <option value="Supplier">Supplier</option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="form-row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3">
                        <asp:Button ID="Button1" runat="server" Text="Back" CssClass="btn btn-primary btn-block" formnovalidate OnClick="Button1_Click" />
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="btnModify" runat="server" Text="Modify" CssClass="btn btn-primary btn-block" OnClick="btnModify_Click" />
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="btnBan" runat="server" Text="Ban Account" CssClass="btn btn-outline-danger btn-block" OnClick="btnBan_Click" CausesValidation="False" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
