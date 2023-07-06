<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProfileMemberPoint.aspx.cs" Inherits="HNEnterpreneur.ProfileMemberPoint" %>

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
                        <li class="brand-nav active"><a href="ProfileMemberPoint.aspx"><i class="fa fa-user-circle-o"></i>&nbsp;Member Point</a></li>
                        <li class="brand-nav"><a href="ProfileDeliveryAddress.aspx"><i class="fa fa-address-card-o"></i>&nbsp;Delivery address</a></li>
                        <li class="brand-nav"><a href="ProfileChangePassword.aspx"><i class="fa fa-lock"></i>&nbsp;Change password</a></li>
                        <li class="brand-nav"><a href="ProfileReports.aspx"><i class="fa fa-bar-chart-o"></i>&nbsp;Reports&Analyst</a></li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    <div class="tab-content">
                        <div class="tab-pane active" style="min-height: 500px;">
                            <div class="row">
                                <div><h1 class="text-center">Your current points:</h1></div>
                            </div>
                            <br />
                            <div class="row">
                                <div><h1 class="text-center" style="font-size:100px;"><asp:Label ID="lblPoints" runat="server" Text="0"></asp:Label></h1></div>
                            </div>
                            <div class="row">
                                <br />
                                <br />
                                <br />
                                <h4><b>Point policies:</b></h4>
                                <hr />
                                <p>1. Points shown above are used to redeem voucher for discount purpose.</p>
                                <p>2. 10 points can be redeemed as RM1, every purchase of RM1 equals to 1 point.</p>
                                <p>3. Voucher is only available if the total price of the snacks exceeds the minimum price of voucher. (Not including delivery fees)</p>
                                <p>4. One voucher can only be used for one transaction. (RM5, RM10, RM15)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>