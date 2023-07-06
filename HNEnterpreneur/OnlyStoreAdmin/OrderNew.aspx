<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyStoreAdmin/Store.Master" AutoEventWireup="true" CodeBehind="OrderNew.aspx.cs" Inherits="HNEnterpreneur.OnlyStoreAdmin.OrderNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    New Orders
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>New Orders</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Ingredient</th>
                            <th>Quantity</th>
                            <th>Price (RM)</th>
                            <th>Delivery Date</th>
                            <th>Company Name</th>
                            <th>Changing Rate (%)</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Date</th>
                            <th>Ingredient</th>
                            <th>Quantity</th>
                            <th>Price (RM)</th>
                            <th>Delivery Date</th>
                            <th>Company Name</th>
                            <th>Changing Rate (%)</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlOrd" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Quotation.Bidding.date") %></td>
                                    <td><%# Eval("Quotation.Bidding.Ingredient.name") %></td>
                                    <td><%# Eval("Quotation.quantity") %> <%# Eval("Quotation.Bidding.Ingredient.balanceType") %></td>
                                    <td><%# Eval("Quotation.price") %></td>
                                    <td><%# Eval("deliveryDate") %></td>
                                    <td><%# Eval("Quotation.Bidder.name") %></td>
                                    <td><%# Eval("rate") %></td>
                                    <td>
                                        <a href="StockReceived.aspx?Id=<%# Eval("traID") %>" class="btn btn-sm btn-outline-danger btn-block">Receive stock</a>
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
