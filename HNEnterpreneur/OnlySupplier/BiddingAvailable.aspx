<%@ Page Title="" Language="C#" MasterPageFile="~/OnlySupplier/Supplier.Master" AutoEventWireup="true" CodeBehind="BiddingAvailable.aspx.cs" Inherits="HNEnterpreneur.OnlySupplier.BiddingAvailable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Bidding Channel
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Bidding Channel</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Date Publish</th>
                            <th>Ingredient</th>
                            <th>Bidding Quantity</th>
                            <th>Lowest Price (RM)</th>
                            <th>Delivery Date</th>
                            <th>Closing Date</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Date Publish</th>
                            <th>Ingredient</th>
                            <th>Bidding Quantity</th>
                            <th>Lowest Price (RM)</th>
                            <th>Delivery Date</th>
                            <th>Closing Date</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlBid" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("date") %></td>
                                    <td><%# Eval("Ingredient.name") %></td>
                                    <td><%# Eval("quantity") %> <%# Eval("Ingredient.balanceType") %></td>
                                    <td><%# Eval("lowestPrice") %></td>
                                    <td><%# Eval("delivery") %></td>
                                    <td><%# Eval("deliveryDate") %></td>
                                    <td><%# Eval("bidded") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:DataList>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
    </div>
</asp:Content>
