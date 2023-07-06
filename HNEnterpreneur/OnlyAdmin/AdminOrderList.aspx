<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminOrderList.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.AdminOrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Order List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Order List</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Customer</th>
                            <th>Total (RM)</th>
                            <th>Status</th>
                            <th>Delivered By</th>
                            <th>Prepared By</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Customer</th>
                            <th>Total (RM)</th>
                            <th>Status</th>
                            <th>Delivered By</th>
                            <th>Prepared By</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlOrder" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("orderId") %></td>
                                    <td><%# Eval("datetime") %></td>
                                    <td><%# Eval("email") %></td>
                                    <td><%# Eval("total","{0:f2}") %></td>
                                    <td><%# Eval("status") %></td>
                                    <td><%# Eval("deliveryMan") %></td>
                                    <td><%# Eval("preparationMan") %></td>
                                    <td>
                                        <a href="AdminOrderReceipt.aspx?Id=<%# Eval("orderId") %>" class="btn btn-sm btn-outline-success btn-block">Details</a>
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