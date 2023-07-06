<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OrderReceipt.aspx.cs" Inherits="HNEnterpreneur.OrderReceipt" %>

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
    <link href="https://printjs-4de6.kxcdn.com/print.min.css" rel="stylesheet" />
    <script type="text/javascript" src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
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
                        <li class="brand-nav active"><a href="ProfileMyOrders.aspx"><i class="fa fa-book"></i>&nbsp;My Orders</a></li>
                        <li class="brand-nav"><a href="ProfileMemberPoint.aspx"><i class="fa fa-user-circle-o"></i>&nbsp;Member Point</a></li>
                        <li class="brand-nav"><a href="ProfileDeliveryAddress.aspx"><i class="fa fa-address-card-o"></i>&nbsp;Delivery address</a></li>
                        <li class="brand-nav"><a href="ProfileChangePassword.aspx"><i class="fa fa-lock"></i>&nbsp;Change password</a></li>
                        <li class="brand-nav"><a href="ProfileReports.aspx"><i class="fa fa-bar-chart-o"></i>&nbsp;Reports&Analyst</a></li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    <div id="receipt">
                        <div class="well col-xs-10 col-xs-offset-1">
                            <div class="row">
                                <table class="table" style="width: 100%;">
                                    <tr>
                                        <td style="width: 30%; text-align: left;" class="col-lg-6">
                                            <br />
                                            <br />
                                            <br />
                                            <address>
                                                <strong>
                                                    <asp:Label ID="lblName" runat="server" Text="Customer Name"></asp:Label>
                                                </strong>
                                                <br />
                                                <asp:Label ID="lblAddress" runat="server" Text="delivery address"></asp:Label>
                                                <br />
                                                <abbr title="Phone">H/P:</abbr>
                                                <asp:Label ID="lblPhone" runat="server" Text="(+60)12 - 123 4567"></asp:Label>
                                                <br />
                                            </address>
                                        </td>
                                        <td style="width: 40%; text-align: center;" class="col-lg-6">
                                            <h3><b>Order Receipt</b></h3>
                                            <h4>
                                                <asp:Label ID="lblCompanyName" runat="server" Text="My Snack" align="center"></asp:Label></h4>
                                            <h5>
                                                <asp:Label ID="lblCompanyAddress" runat="server" Text="company address" align="center"></asp:Label></h5>
                                            <h5>
                                                <asp:Label ID="lblCompanyEmail" runat="server" Text="company email" align="center"></asp:Label></h5>
                                            <h5>
                                                <asp:Label ID="lblCompanyPhone" runat="server" Text="company phone" align="center"></asp:Label></h5>
                                        </td>
                                        <td style="width: 30%; text-align: right;" class="col-lg-6">
                                            <br />
                                            <br />
                                            <br />
                                            <p>
                                                <em>Date:
                                        <asp:Label ID="lblDate" runat="server" Text=""></asp:Label></em>
                                            </p>
                                            <p>
                                                <em>Receipt #: OL<asp:Label ID="lblOrderId" runat="server" Text=""></asp:Label></em>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>#</th>
                                            <th class="text-center">Price</th>
                                            <th class="text-center">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:DataList ID="dlOrderList" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="col-md-6"><em><%# Eval("Food.name") %></em></td>
                                                    <td class="col-md-2" style="text-align: center"><%# Eval("quantity") %></td>
                                                    <td class="col-md-2 text-center">RM <%# Eval("Food.price","{0:f2}") %></td>
                                                    <td class="col-md-2 text-center">RM <%# String.Format("{0:0.00}", Convert.ToDecimal(Eval("Food.price")) * Convert.ToDecimal(Eval("quantity"))) %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td class="text-right">
                                                <p>
                                                    <strong>Subtotal: </strong>
                                                </p>
                                                <p>
                                                    <strong>(+)Charges: </strong>
                                                </p>
                                                <p>
                                                    <strong>(-)Discount: </strong>
                                                </p>
                                            </td>
                                            <td class="text-center">
                                                <p>
                                                    <strong>RM
                                                    <asp:Label ID="lblSubTotal" runat="server" Text=""></asp:Label></strong>
                                                </p>
                                                <p>
                                                    <strong>RM
                                                    <asp:Label ID="lblCharges" runat="server" Text=""></asp:Label></strong>
                                                </p>
                                                <p>
                                                    <strong>RM
                                                    <asp:Label ID="lblDiscount" runat="server" Text=""></asp:Label></strong>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td class="text-right">
                                                <h4><strong>Total: </strong></h4>
                                            </td>
                                            <td class="text-center text-danger">
                                                <h4><strong>RM
                                                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></strong></h4>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <form runat="server">
                        <div class="btn-group col-lg-4 col-lg-offset-8">
                            <button type="button" class="btn btn-primary" onclick="printJS('receipt', 'html')">Print</button>
                            <asp:Label ID="lblOrdCan" runat="server" Text=""></asp:Label>
                            <a class="btn btn-default" href="ProfileMyOrders.aspx">Back</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
