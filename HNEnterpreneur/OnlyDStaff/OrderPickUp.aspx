<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyDStaff/DeliveryStaff.Master" AutoEventWireup="true" CodeBehind="OrderPickUp.aspx.cs" Inherits="HNEnterpreneur.OnlyDStaff.OrderPickUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Order Pick Up</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Street</th>
                            <th>City</th>
                            <th>Postal Code</th>
                            <th>State</th>
                            <th>Country</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Street</th>
                            <th>City</th>
                            <th>Postal Code</th>
                            <th>State</th>
                            <th>Country</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlDelivery" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" DataSourceID="dsDOrder">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("orderId") %></td>
                                    <td><%# Eval("orderDate") %></td>
                                    <td><%# Eval("Address.line1") %>, <%# Eval("Address.line2") %></td>
                                    <td><%# Eval("Address.city") %></td>
                                    <td><%# Eval("Address.postcode") %></td>
                                    <td><%# Eval("Address.state") %></td>
                                    <td><%# Eval("Address.country") %></td>
                                    <td>
                                        <a href="?Id=<%# Eval("orderId") %>" class="btn btn-sm btn-outline-success btn-block">Pick Up</a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:LinqDataSource runat="server" EntityTypeName="" ID="dsDOrder" ContextTypeName="HNEnterpreneur.HNEnterpreneurDBDataContext" TableName="Orders" Where="status == @status">
                            <WhereParameters>
                                <asp:Parameter DefaultValue="P" Name="status" Type="Char"></asp:Parameter>
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
    </div>
</asp:Content>
