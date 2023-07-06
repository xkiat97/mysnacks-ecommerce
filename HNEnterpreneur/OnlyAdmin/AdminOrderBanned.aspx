<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminOrderBanned.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.AdminOrderBanned" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Deleted Order
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Deleted Order</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Date & Time</th>
                            <th>Discount (RM)</th>
                            <th>Charge (RM)</th>
                            <th>Total (RM)</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Date & Time</th>
                            <th>Discount (RM)</th>
                            <th>Charge (RM)</th>
                            <th>Total (RM)</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlOrder" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("orderId") %></td>
                                    <td><%# Eval("datetime") %></td>
                                    <td><%# Eval("discountPrice", "{0:f2}") %></td>
                                    <td><%# Eval("charge","{0:f2}") %></td>
                                    <td><%# Eval("total","{0:f2}") %></td>
                                    <td>
                                        <a href="AdminOrderDetail.aspx?Id=<%# Eval("orderId") %>" class="btn btn-sm btn-outline-success btn-block">Details</a>
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
