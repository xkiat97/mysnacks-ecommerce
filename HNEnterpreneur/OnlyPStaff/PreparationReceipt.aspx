<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyPStaff/PreparationStaff.Master" AutoEventWireup="true" CodeBehind="PreparationReceipt.aspx.cs" Inherits="HNEnterpreneur.OnlyPStaff.PreparationReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style media="all">
        .pad-top-botm {
            padding-bottom: 40px;
            padding-top: 60px;
        }

        h4 {
            text-transform: uppercase;
        }
        /* =============================================================
           PAGE STYLES
         ============================================================ */

        .contact-info span {
            font-size: 14px;
            padding: 0px 50px 0px 50px;
        }

        .contact-info hr {
            margin-top: 0px;
            margin-bottom: 0px;
        }

        .client-info {
            font-size: 15px;
        }

        .ttl-amts {
            text-align: right;
            padding-right: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Receipt
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row pad-top-botm ">
        <div class="col-sm-6 ">
            <img src="../Images/System/logo.png" style="padding-bottom: 20px; width:300px; height:150px;" />
        </div>
        <div class="col-sm-3 offset-3">
            <h3>Order ID : <asp:Label ID="lblOrderId" runat="server" Text="" align="center"></asp:Label></h3>
            <strong>
                <asp:Label ID="lblCompanyName" runat="server" Text="" align="center"></asp:Label>
            </strong>
            <br />
            <i>
                <asp:Label ID="lblCompanyAddress" runat="server" Text="" align="center"></asp:Label>
            </i>
        </div>
    </div>
    <div class="row text-center contact-info">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <hr />
            <span>
                <strong>Company E-mail : </strong>
                <asp:Label ID="lblCompanyEmail" runat="server" Text="company email" align="center"></asp:Label>
            </span>
            <span>
                <strong>Company Contact : </strong>
                <asp:Label ID="lblCompanyPhone" runat="server" Text="company phone" align="center"></asp:Label>
            </span>
            <hr />
        </div>
    </div>
    <div class="row pad-top-botm client-info">
        <div class="col-sm-6">
            <h4><strong>Client Information</strong></h4>
            <strong>
                <asp:Label ID="lblName" runat="server" Text="Customer Name"></asp:Label></strong>
            <br />
            <asp:Label ID="lblAddress" runat="server" Text="delivery address"></asp:Label>
            <b>Phone : </b>
            <asp:Label ID="lblPhone" runat="server" Text="(+60)12 - 123 4567"></asp:Label>
            <br />
            <b>E-mail : </b><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
        </div>
        <div class="col-sm-3 offset-3">
            <h4><strong>Payment Details </strong></h4>
            <b>Bill Amount :  RM
                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></b>
            <br />
            <b>Bill Date : </b>
            <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
            <br />
            <b>Preparation Date : </b>
            <asp:Label ID="lblPDate" runat="server" Text=""></asp:Label>
            <br />
            <b>Prepared By : </b>
            <asp:Label ID="lblPStaff" runat="server" Text=""></asp:Label>
            <br />
            <b>Delivery Date : </b>
            <asp:Label ID="lblDDate" runat="server" Text=""></asp:Label>
            <br />
            <b>Delivered By : </b>
            <asp:Label ID="lblDStaff" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Unit Price</th>
                            <th>Sub Total (RM)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:DataList ID="dlOrderList" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("foodId") %></td>
                                    <td><%# Eval("Food.name") %></td>
                                    <td><%# Eval("quantity") %></td>
                                    <td><%# Eval("Food.price","{0:f2}") %></td>
                                    <td><%# String.Format("{0:0.00}", Convert.ToDecimal(Eval("Food.price")) * Convert.ToDecimal(Eval("quantity"))) %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:DataList>
                    </tbody>
                </table>
            </div>
            <hr />
            <div class="ttl-amts">
                <h5>Total Amount : RM
                    <asp:Label ID="lblSubTotal" runat="server" Text=""></asp:Label></h5>
            </div>
            <hr />
            <div class="ttl-amts">
                <h5>(+) Charges : RM 
                    <asp:Label ID="lblCharges" runat="server" Text=""></asp:Label></h5>
            </div>
            <hr />
            <div class="ttl-amts">
                <h5>(-) Discount : RM 
                    <asp:Label ID="lblDiscount" runat="server" Text=""></asp:Label></h5>
            </div>
            <hr />
            <div class="ttl-amts">
                <h4><strong>Bill Amount : RM
                    <asp:Label ID="lblTotal1" runat="server" Text=""></asp:Label></strong> </h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <strong>Important: </strong>
            <ol>
                <li>This is an electronic generated invoice so doesn't require any signature.

                </li>
                <li>Please read all terms and polices on  www.MySnacks.com for returns, replacement and other issues.

                </li>
            </ol>
        </div>
    </div>
    <%--<div class="row pad-top-botm">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <hr />
            <a href="#" class="btn btn-primary btn-lg">Print Invoice</a>
            &nbsp;&nbsp;&nbsp;
              <a href="#" class="btn btn-success btn-lg">Download In Pdf</a>

        </div>
    </div>--%>
</asp:Content>
