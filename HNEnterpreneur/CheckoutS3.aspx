<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CheckoutS3.aspx.cs" Inherits="HNEnterpreneur.CheckoutS3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Checkout Step 3
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="css/Checkout.css" rel="stylesheet" media="all" />
    <link href="https://printjs-4de6.kxcdn.com/print.min.css" rel="stylesheet" media="all" />
    <script type="text/javascript" src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
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
            <div class="col-xs-4 smpl-step-step complete">
                <div class="text-center smpl-step-num">Completed</div>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
                <a class="smpl-step-icon"><i class="fa fa-repeat" style="font-size: 60px; padding-left: 7px; padding-top: 7px; color: black;"></i></a>
            </div>
        </div>
        <br />
        <div class="row">
            <form runat="server">
                <div class="btn-group col-lg-4 col-lg-offset-8">
                    <button type="button" class="btn btn-primary" onclick="printJS('receipt', 'html')">Print</button>
                    <a class="btn btn-default" href="Products.aspx">Back to Home</a>
                </div>
            </form>
        </div>
        <br />
        <div class="row" id="receipt">
            <div class="well col-xs-8 col-xs-offset-2">
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
                                        <asp:Label ID="lblDate" runat="server" Text="18-MAR-2018"></asp:Label></em>
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
                                    <h4><strong>RM <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></strong></h4>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
