﻿<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="IngredientBanned.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.IngredientBanned" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Deleted Ingredient
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<h2>Deleted Ingredient</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Balance</th>
                            <th>Food Needed</th>
                            <th>Shortage</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Balance</th>
                            <th>Food Needed</th>
                            <th>Shortage</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlIng" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ingID") %></td>
                                    <td><%# Eval("name") %></td>
                                    <td><%# Eval("desc") %></td>
                                    <td>(<%# Eval("balanceRate") %> %) <%# Eval("balance") %> <%# Eval("balanceType") %></td>
                                    <td><%# Eval("qtyNeed") %> <%# Eval("balanceType") %></td>
                                    <td><%# Eval("shortage") %> <%# Eval("balanceType") %></td>
                                    <td>
                                        <a href="IngredientDetail.aspx?Id=<%# Eval("ingID") %>" class="btn btn-sm btn-outline-success btn-block">Details</a>
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
