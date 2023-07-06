﻿<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyPStaff/PreparationStaff.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HNEnterpreneur.OnlyPStaff.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Order Preparation
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Order Preparation</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Customer name</th>
                            <th>Contact</th>
                            <th>Days past</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Customer name</th>
                            <th>Contact</th>
                            <th>Days past</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlPreparation" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("orderId") %></td>
                                    <td><%# Eval("orderDate") %></td>
                                    <td><%# Eval("Address.name") %></td>
                                    <td><%# Eval("Address.contact") %></td>
                                    <td><%# Eval("daysPast") %></td>
                                    <td>
                                        <a href="OrderPreparationDetails.aspx?Id=<%# Eval("orderId") %>" class="btn btn-sm btn-outline-success btn-block">Details</a>
                                    </td>
                                    <td>
                                        <a href="PreparationReceipt.aspx?Id=<%# Eval("orderId") %>" class="btn btn-sm btn-outline-default btn-block">Receipt</a>
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
