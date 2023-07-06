<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="HNEnterpreneur.ShoppingCart1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Shopping Cart
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Home.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li><a href="Products.aspx">Products</a></li>
                <li class="active">Shopping Cart</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!------ Include the above in your HEAD tag ---------->
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-10 col-md-offset-1">
                <form runat="server">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th></th>
                                <th>Quantity</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:DataList ID="dlCart" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <tr>
                                        <td class="col-md-2">
                                            <div class="media">
                                                <a class="thumbnail pull-left" href="?">
                                                    <img class="media-object" src="../Images/FoodImg/<%# Eval("image") %>" style="width: 100px; height: 100px;">
                                                </a>
                                            </div>
                                        </td>
                                        <td class="col-md-4">
                                            <div class="media-body">
                                                <h4 class="media-heading"><%# Eval("name") %></h4>
                                                <h5 class="media-heading">by H&N Enterprise</h5>
                                                <span>Status: </span><span class="text-warning"><strong></strong></span>
                                            </div>
                                        </td>
                                        <td class="col-md-1 text-center"><strong><%# Eval("quantity") %></strong></td>
                                        <td class="col-md-1 text-center"><strong><%# Eval("price","{0:f2}") %></strong></td>
                                        <td class="col-md-1 text-center"><strong><%# String.Format("{0:0.00}", Convert.ToDecimal(Eval("price")) * Convert.ToDecimal(Eval("quantity"))) %></strong></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:DataList>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td class="text-right">
                                    <h5><strong>
                                        <asp:Label ID="lblSubTotal" runat="server" Text=""></asp:Label>
                                    </strong></h5>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <h5>(+)Estimated shipping</h5>
                                </td>
                                <td class="text-right">
                                    <h5><strong>
                                        <asp:Label ID="lblCharge" runat="server" Text=""></asp:Label>
                                    </strong></h5>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <h5>(-)Voucher Discount</h5>
                                </td>
                                <td class="text-right">
                                    <h5><strong> RM
                                        <asp:DropDownList ID="ddlDiscount" runat="server" CssClass="voucher"></asp:DropDownList>
                                    </strong></h5>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <h3>Total</h3>
                                </td>
                                <td class="text-right">
                                    <h3><strong>
                                        <input id="txtTotal" class="txtTotal" runat="server" type="hidden" />
                                        <asp:Label ID="lblTotal" runat="server" Text="" CssClass="totals"></asp:Label>
                                    </strong></h3>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnBack" runat="server" Text="Continue Shopping" CssClass="btn btn-success pull-left" OnClick="btnBack_Click" />

                                </td>
                                <td>
                                    <asp:Button ID="btnChkOut" runat="server" Text="Checkout" CssClass="btn btn-primary pull-right" OnClick="btnChkOut_Click" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            var v = $(".voucher").val();
            var total = $(".txtTotal").val();
            $(".totals").html((total - v).toFixed(2));
        });
        $(".voucher").change(function () {
            var v = $(this).val();
            var total = $(".txtTotal").val();
            $(".totals").html((total - v).toFixed(2));

        });
    </script>
</asp:Content>
