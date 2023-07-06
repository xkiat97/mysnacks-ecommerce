<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyDStaff/DeliveryStaff.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HNEnterpreneur.OnlyDStaff.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    My delivery schedules
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>My delivery schedules</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Name</th>
                            <th>Contact</th>
                            <th>Address</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Name</th>
                            <th>Contact</th>
                            <th>Address</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlDelivery" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("orderId") %></td>
                                    <td><%# Eval("orderDate") %></td>
                                    <td><%# Eval("Address.name") %></td>
                                    <td><%# Eval("Address.contact") %></td>
                                    <td><%# Eval("Address.line1") %>,
                                        <%# Eval("Address.line2") %>,
                                        <%# Eval("Address.city") %>,
                                        <%# Eval("Address.postcode") %>, 
                                        <%# Eval("Address.state") %>, 
                                        <%# Eval("Address.country") %>
                                    </td>
                                    <td>
                                        <a href="index.aspx?Id=<%# Eval("orderId") %>&q=t" class="btn btn-sm btn-outline-success btn-block">Complete</a>
                                    </td>
                                    <td>
                                        <a href="index.aspx?Id=<%# Eval("orderId") %>" data-toggle="confirmation" class="btn btn-sm btn-outline-danger btn-block">Drop</a>
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
