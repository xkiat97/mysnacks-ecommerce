<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProfileChangePassword.aspx.cs" Inherits="HNEnterpreneur.ProfileChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        @media (min-width: 768px) {

            .brand-pills > li > a {
                border-top-right-radius: 0px;
                border-bottom-right-radius: 0px;
            }

            li.brand-nav.active a:after {
                content: " ";
                display: block;
                width: 0;
                height: 0;
                border-top: 20px solid transparent;
                border-bottom: 20px solid transparent;
                border-left: 9px solid #428bca;
                position: absolute;
                top: 50%;
                margin-top: -20px;
                left: 100%;
                z-index: 2;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Home.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Profile</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="container">
        <div class="row">
            <br />
            <hr />
            <div role="tabpanel">
                <div class="col-sm-3">
                    <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                        <li class="brand-nav"><a href="ProfileMyOrders.aspx"><i class="fa fa-book"></i>&nbsp;My Orders</a></li>
                        <li class="brand-nav"><a href="ProfileMemberPoint.aspx"><i class="fa fa-user-circle-o"></i>&nbsp;Member Point</a></li>
                        <li class="brand-nav"><a href="ProfileDeliveryAddress.aspx"><i class="fa fa-address-card-o"></i>&nbsp;Delivery address</a></li>
                        <li class="brand-nav active"><a href="ProfileChangePassword.aspx"><i class="fa fa-lock"></i>&nbsp;Change password</a></li>
                        <li class="brand-nav"><a href="ProfileReports.aspx"><i class="fa fa-bar-chart-o"></i>&nbsp;Reports&Analyst</a></li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    <div class="tab-content">
                        <div class="tab-pane active" style="min-height: 500px;">
                            <form class="form-horizontal" role="form" runat="server">
                                <fieldset>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="textinput">Current Password</label>
                                        <div class="col-sm-9">
                                            <input id="txtOldPass" runat="server" type="password" placeholder="Enter your current password" class="form-control" maxlength="15" autofocus required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <asp:CustomValidator ID="cvNotMatched" runat="server" ErrorMessage="[Password] Incorrect, please try again" ControlToValidate="txtOldPass" CssClass="alert alert-danger col-lg-12" Display="Dynamic"></asp:CustomValidator>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="textinput">New Password</label>
                                        <div class="col-sm-9">
                                            <input id="txtNewPass" runat="server" type="password" placeholder="Enter your new password" class="form-control" maxlength="15" required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                            ErrorMessage="Value must between 8-15, contain at least 2 number and all letter"
                                            Display="Dynamic" CssClass="alert alert-danger col-md-12"
                                            ValidationExpression='^(?=.*[0-9].*[0-9])(?=.*[a-zA-z]).{8,15}$'
                                            ControlToValidate="txtNewPass"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <div class="pull-right">
                                                <asp:Button ID="btnChgPass" runat="server" Text="Change Password" CssClass="btn btn-primary" OnClick="btnChgPass_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
