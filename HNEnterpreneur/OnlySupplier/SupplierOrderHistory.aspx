<%@ Page Title="" Language="C#" MasterPageFile="~/OnlySupplier/Supplier.Master" AutoEventWireup="true" CodeBehind="SupplierOrderHistory.aspx.cs" Inherits="HNEnterpreneur.OnlySupplier.SupplierOrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Sales History
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Sales History</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Sent Date</th>
                            <th>Ingredient</th>
                            <th>Quantity</th>
                            <th>Price (RM)</th>
                            <th>Delivery Date</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Sent Date</th>
                            <th>Ingredient</th>
                            <th>Quantity</th>
                            <th>Price (RM)</th>
                            <th>Delivery Date</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlOrd" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ReceivedTime") %></td>
                                    <td><%# Eval("Quotation.Bidding.Ingredient.name") %></td>
                                    <td><%# Eval("Quotation.quantity") %> <%# Eval("Quotation.Bidding.Ingredient.balanceType") %></td>
                                    <td><%# Eval("Quotation.price") %></td>
                                    <td><%# Eval("deliveryDate") %></td>
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