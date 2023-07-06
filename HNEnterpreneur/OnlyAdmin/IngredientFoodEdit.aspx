<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="IngredientFoodEdit.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.IngredientFoodEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Food Edit
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:LinqDataSource ID="dsFood" runat="server" ContextTypeName="HNEnterpreneur.HNEnterpreneurDBDataContext" EntityTypeName="" TableName="Ing_lists" Where="foodID == @foodID && ingID != @ingID">
        <WhereParameters>
            <asp:ControlParameter ControlID="lblFoodID1" PropertyName="Text" Name="foodID" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="lblFoodID" PropertyName="Text" Name="ingID" Type="Int32"></asp:ControlParameter>
        </WhereParameters>
    </asp:LinqDataSource>
    <div class="container">
        <h2>Food Edit</h2>
        <hr />
        <form id="form1" runat="server" class="col-md-10">
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-3">
                        <label for="lblFoodID">Ingredient ID :</label>
                        <asp:Label ID="lblFoodID" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <label for="lblFoodName">Ingredient Name :</label>
                        <asp:Label ID="lblFoodName" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <label for="lblFoodID1">Food ID :</label>
                        <asp:Label ID="lblFoodID1" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <label for="lblFoodName1">Food Name :</label>
                        <asp:Label ID="lblFoodName1" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                    <label>Quantity Used*</label>&emsp;
                    <input class="form-control" id="txtQtyUsed" type="text" placeholder="Enter quantity used" required autofocus runat="server">
                    <asp:RegularExpressionValidator ID="revQtyUsed" runat="server" ErrorMessage="Value must be integer or 2 decimal."
                        ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" ControlToValidate="txtQtyUsed" Display="Dynamic"
                        CssClass="alert alert-danger col-md-12"></asp:RegularExpressionValidator>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-4 offset-8">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block align-bottom" OnClick="btnsubmit_Click" />
                </div>
            </div>
            <br />
            <div class="row">
                <label>Other ingredient lists:</label>&emsp;
                <div class="col-lg-12">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="unlinkedData" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Quantity Used</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Quantity Used</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <asp:DataList ID="dlFood" runat="server" RepeatLayout="Flow" DataKeyField="foodId" DataSourceID="dsFood" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("ingID") %></td>
                                            <td><%# Eval("Ingredient.name") %></td>
                                            <td><%# Eval("qtyNeeded") %> <%# Eval("Ingredient.balanceType") %></td>
                                            <td>
                                                <a href="IngredientFoodEdit.aspx?Id=<%# Eval("ingID") %>&Id1=<%# Eval("foodID") %>" class="btn btn-sm btn-success btn-block">Edit</a>
                                            </td>
                                            <td>
                                                <a onclick="del(<%# Eval("ingID") %>,<%# Eval("foodID") %>)" href="" class="btn btn-sm btn-outline-danger btn-block">Remove</a>
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
                </div>
            </div>
        </form>
    </div>
    <script>
        function del(ingID, foodID) {
            $.ajax({
                type: "POST",
                url: "IngredientFoodEdit.aspx/delFood",
                data: '{ingID:"' + ingID + '", foodID:"' + foodID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: OnFailure
            });
        }

        function OnSuccess() {
            location.reload();
        }

        function OnFailure() {
            alert("Failure");
        }
    </script>
</asp:Content>
