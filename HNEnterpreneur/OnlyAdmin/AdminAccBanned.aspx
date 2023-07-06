<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAccBanned.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.AdminAccBanned" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Account-Banned Account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h2>Banned Account</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Registed By ID</th>
                            <th>User Type</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Registed By ID</th>
                            <th>User Type</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlAcc" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("userId") %></td>
                                    <td><%# Eval("name") %></td>
                                    <td><%# Eval("email") %></td>
                                    <td><%# Eval("RegistedID") %></td>
                                    <td><%# Eval("userType") %></td>
                                    <td>
                                        <a href="AdminAccDetail.aspx?Id=<%# Eval("userId") %>" class="btn btn-sm btn-outline-success btn-block">Details</a>
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