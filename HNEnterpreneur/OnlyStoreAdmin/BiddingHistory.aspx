﻿<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyStoreAdmin/Store.Master" AutoEventWireup="true" CodeBehind="BiddingHistory.aspx.cs" Inherits="HNEnterpreneur.OnlyStoreAdmin.BiddingHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Bidding History
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Bidding History</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Date Publish</th>
                            <th>Ingredient</th>
                            <th>Bidding Quantity</th>
                            <th>Max Price</th>
                            <th>Urgency</th>
                            <th>Closing Date</th>
                            <th>Bidder</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Date Publish</th>
                            <th>Ingredient</th>
                            <th>Bidding Quantity</th>
                            <th>Max Price (RM)</th>
                            <th>Urgency</th>
                            <th>Closing Date</th>
                            <th>Bidder</th>
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
                                    <td><%# Eval("maxPrice") %></td>
                                    <td><%# Eval("urgency") %></td>
                                    <td><%# Eval("deliveryDate") %></td>
                                    <td><%# Eval("bidder") %></td>
                                    <td>
                                        <a href="BiddingDetail.aspx?Id=<%# Eval("bidID") %>" class="btn btn-sm btn-outline-success btn-block">Details</a>
                                    </td>
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
