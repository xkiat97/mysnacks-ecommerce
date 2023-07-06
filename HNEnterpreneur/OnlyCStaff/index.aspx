<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyCStaff/CookingStaff.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HNEnterpreneur.OnlyCStaff.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Cooking Available
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Stock Refill</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Food ID</th>
                            <th>Food Name</th>
                            <th>Balance</th>
                            <th>Max Quantity</th>
                            <th>Shortage</th>
                            <th>Cook Available</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Food ID</th>
                            <th>Food Name</th>
                            <th>Balance</th>
                            <th>Max Quantity</th>
                            <th>Shortage</th>
                            <th>Cook Available</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlFood" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("foodId") %></td>
                                    <td><%# Eval("name") %></td>
                                    <td><%# Eval("quantity") %></td>
                                    <td><%# Eval("reservedQty") %></td>
                                    <td><%# Eval("shortage") %></td>
                                    <td><%# Eval("available") %></td>
                                    <td><a href="StockRefill.aspx?Id=<%# Eval("foodId") %>" class="btn btn-sm btn-outline-success">Add</a></td>
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
