<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCateBanned.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.AdminCateBanned" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Deleted Category
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:LinqDataSource ID="dsCategory" runat="server" ContextTypeName="HNEnterpreneur.HNEnterpreneurDBDataContext" EntityTypeName="" TableName="Categories" Where="status=='F'"></asp:LinqDataSource>
    <h2>Deleted Category</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Register By</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Register By</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlCategory" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" DataSourceID="dsCategory">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("catId") %></td>
                                    <td><%# Eval("name") %></td>
                                    <td><%# Eval("description") %></td>
                                    <td><%# Eval("User.name") %></td>
                                    <td>
                                        <a href="AdminCateDetail.aspx?Id=<%# Eval("catId") %>" class="btn btn-sm btn-outline-success btn-block">Details</a>
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
