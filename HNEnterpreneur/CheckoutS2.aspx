<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CheckoutS2.aspx.cs" Inherits="HNEnterpreneur.CheckoutS2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Checkout Step 2
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="css/Checkout.css" rel="stylesheet" />
    <!-- Vendor libraries -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/1.2.3/jquery.payment.min.js"></script>
    <script>
        jQuery(function ($) {
            $('.cc-number').payment('formatCardNumber');
            //$('.cc-exp').payment('formatCardExpiry');
            $('.cc-cvc').payment('formatCardCVC');
            $('.next').click(function (e) {
                var cardType = $.payment.cardType($('.cc-number').val());
                var valid = true;
                e.preventDefault();
                if (!$.payment.validateCardNumber($('.cc-number').val())) {
                    $('#ccnumber').css("display", "block");
                    valid = false;
                } else {
                    $('#ccnumber').css("display", "none");
                }

                //if (!$.payment.validateCardExpiry($('.cc-exp').payment('cardExpiryVal'))) {
                //    $('#ccexp').css("display", "block");
                //    valid = false;
                //} else {
                //    $('#ccexp').css("display", "none");
                //}

                var month = $("#txtmonth").val();
                var year = $("#txtyear").val();
                var today = new Date();

                $('#ccexp').css("display", "none");
                if (today.getFullYear() == year) {
                    if (today.getMonth() + 1 >= month) {
                        $('#ccexp').css("display", "block");
                        valid = false;
                    }
                }

                if (!$.payment.validateCardCVC($('.cc-cvc').val(), cardType)) {
                    $('#cccvc').css("display", "block");
                    valid = false;
                } else {
                    $('#cccvc').css("display", "none");
                }

                $('.cc-brand').text(cardType);

                if (valid) {
                    $('.success').click();
                }
            });
        });

        function checkExpDate() {
            var month = $("#txtmonth").val();
            var year = $("#txtyear").val();
            var today = new Date();

            if (today.getFullYear() == year) {
                if (today.getMonth + 1 >= month) {
                    $('#ccexp').css("display", "block");
                    valid = false;
                }
            }
            $('#ccexp').css("display", "none");
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Home.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li><a href="Products.aspx">Products</a></li>
                <li class="active">Order Process</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="container">
        <div class="row smpl-step" style="border-bottom: 0; min-width: 500px;">
            <div class="col-xs-4 smpl-step-step complete">
                <div class="text-center smpl-step-num">Delivery Address</div>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
                <a class="smpl-step-icon"><i class="fa fa-user" style="font-size: 60px; padding-left: 12px; padding-top: 3px; color: black;"></i></a>
            </div>

            <div class="col-xs-4 smpl-step-step complete">
                <div class="text-center smpl-step-num">Payment</div>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
                <a class="smpl-step-icon"><i class="fa fa-dollar" style="font-size: 60px; padding-left: 18px; padding-top: 5px; color: black;"></i></a>
            </div>
            <div class="col-xs-4 smpl-step-step">
                <div class="text-center smpl-step-num">Completed</div>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
                <a class="smpl-step-icon"><i class="fa fa-repeat" style="font-size: 60px; padding-left: 7px; padding-top: 7px; color: black;"></i></a>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <form novalidate autocomplete="on" class="form-horizontal" runat="server">
                    <fieldset>
                        <div class="form-group">
                            <label for="txtName" class="control-label">Card Holder's name</label>
                            <input id="txtName" runat="server" type="text" class="form-control" placeholder="Card holder's name" maxlength="30" required autofocus>
                            <asp:RegularExpressionValidator ID="regName" runat="server"
                                ErrorMessage="[Card holder's name] must be alphabel and space" Display="Dynamic" CssClass="alert alert-danger col-sm-12"
                                ValidationExpression="^[a-zA-Z]+(([ ][a-zA-Z ])?[a-zA-Z]*)*$" ControlToValidate="txtName">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label for="cc-number" class="control-label">Card number <small class="text-muted">[<span class="cc-brand">Type</span>]</small></label>
                            <input id="cc-number" type="tel" class="form-control cc-number" autocomplete="cc-number" placeholder="•••• •••• •••• ••••" required>
                            <div id="ccnumber" style="display: none;" class="validation alert alert-danger col-sm-12">Invalid card number</div>
                        </div>
                        <div class="form-group">
                            <label for="cc-exp" class="control-label">Card expiry</label>
                            <%--<input id="cc-exp" type="tel" class="form-control cc-exp" autocomplete="cc-exp" placeholder="•• / ••" required>--%>
                            <div class="row">
                                <div class="col-sm-3">
                                    <select id="txtmonth" class="form-control">
                                        <option>01</option>
                                        <option>02</option>
                                        <option>03</option>
                                        <option>04</option>
                                        <option>05</option>
                                        <option>06</option>
                                        <option>07</option>
                                        <option>08</option>
                                        <option>09</option>
                                        <option>10</option>
                                        <option>11</option>
                                        <option>12</option>
                                    </select>

                                </div>
                                <div class="col-sm-4">
                                    <select id="txtyear" class="form-control">
                                        <option>2018</option>
                                        <option>2019</option>
                                        <option>2020</option>
                                        <option>2021</option>
                                        <option>2022</option>
                                        <option>2023</option>
                                        <option>2024</option>
                                        <option>2025</option>
                                        <option>2026</option>
                                        <option>2027</option>
                                        <option>2028</option>
                                    </select>
                                </div>
                                <div class="col-sm-5"></div>
                            </div>
                            <div id="ccexp" style="display: none;" class="validation alert alert-danger col-sm-12">Invalid card expiry date</div>
                        </div>

                        <div class="form-group">
                            <label for="cc-cvc" class="control-label">Card CVC</label>
                            <input id="cc-cvc" type="password" class="form-control cc-cvc" autocomplete="off" placeholder="•••" required>
                            <div id="cccvc" style="display: none;" class="validation alert alert-danger col-sm-12">Invalid cvc number</div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="pull-right">
                                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-default" OnClick="btnBack_Click" CausesValidation="False" UseSubmitBehavior="False" />
                                    <asp:Button ID="btn" runat="server" Text="" CssClass="success" OnClick="btnNext_Click" Style="display: none;" />
                                    <asp:Button ID="btnNext" runat="server" Text="Complete" CssClass="next btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
