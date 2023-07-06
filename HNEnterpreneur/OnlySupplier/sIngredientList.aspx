<%@ Page Title="" Language="C#" MasterPageFile="~/OnlySupplier/Supplier.Master" AutoEventWireup="true" CodeBehind="sIngredientList.aspx.cs" Inherits="HNEnterpreneur.OnlySupplier.sIngredientList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Ingredient List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:LinqDataSource ID="ldsIngredient" runat="server" ContextTypeName="HNEnterpreneur.HNEnterpreneurDBDataContext" EntityTypeName="" TableName="Ingredients" Where="status == @status">
        <WhereParameters>
            <asp:Parameter DefaultValue="T" Name="status" Type="Char"></asp:Parameter>
        </WhereParameters>
    </asp:LinqDataSource>
<h2>Ingredient List</h2>
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
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Balance</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlIng" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" DataSourceID="ldsIngredient">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ingID") %></td>
                                    <td><%# Eval("name") %></td>
                                    <td><%# Eval("desc") %></td>
                                    <td><%# Eval("balance") %> <%# Eval("balanceType") %></td>
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
