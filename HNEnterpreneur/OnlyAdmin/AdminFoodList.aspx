<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminFoodList.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.AdminFoodList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Food List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:LinqDataSource ID="dsFood" runat="server" ContextTypeName="HNEnterpreneur.HNEnterpreneurDBDataContext" EntityTypeName="" TableName="Foods" Where="status == @status">
        <WhereParameters>
            <asp:Parameter DefaultValue="T" Name="status" Type="Char"></asp:Parameter>
        </WhereParameters>
    </asp:LinqDataSource>
    <h2>Food List</h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Time used (min)</th>
                            <th>Quantity</th>
                            <th>Price (RM)</th>
                            <th>Category</th>
                            <th>Registed By</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Time used (min)</th>
                            <th>Quantity</th>
                            <th>Price (RM)</th>
                            <th>Category</th>
                            <th>Registed By</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlFood" runat="server" RepeatLayout="Flow" DataKeyField="foodId" DataSourceID="dsFood" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("foodId") %></td>
                                    <td><%# Eval("name") %></td>
                                    <td><%# Eval("timeUsedSec") %></td>
                                    <td><%# Eval("quantity") %></td>
                                    <td><%# Eval("price","{0:f2}") %></td>
                                    <td><%# Eval("Category.name") %></td>
                                    <td><%# Eval("User.name") %></td>
                                    <td>
                                        <a href="AdminFoodDetail.aspx?Id=<%# Eval("foodId") %>" class="btn btn-sm btn-outline-success btn-block">Details</a>
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