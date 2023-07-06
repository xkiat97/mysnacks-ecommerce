<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="IngredientFoodLink.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.IngredientFoodLink" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Food linking
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <h2>Food linking</h2>
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
                    </div>
                    <div class="col-md-3">
                        <label for="lblFoodSts">Status :</label>
                        <asp:Label ID="lblFoodSts" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <!-- linked data table-->
            <div class="row">
                <div class="col-lg-12">
                    <asp:LinqDataSource ID="ldsLinkedData" runat="server" ContextTypeName="HNEnterpreneur.HNEnterpreneurDBDataContext" EntityTypeName="" TableName="Ing_lists" Where="ingID == @ingID && Food == @Food">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="lblFoodID" PropertyName="Text" Name="ingID" Type="Int32"></asp:ControlParameter>
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <h4>Food linked:</h4>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="linkedData" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th>Quantity Used</th>
                                            <th>Active/Inactive</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th>Quantity Used</th>
                                            <th>Active/Inactive</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <asp:DataList ID="dlLinkedData" runat="server" RepeatLayout="Flow" DataKeyField="foodId" DataSourceID="ldsLinkedData" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("foodID") %></td>
                                                    <td><%# Eval("Food.name") %></td>
                                                    <td><%# Eval("Food.Category.name") %></td>
                                                    <td><%# Eval("qtyNeeded") %> <%# Eval("Ingredient.balanceType") %></td>
                                                    <td><%# Eval("Food.status") %></td>
                                                    <td>
                                                        <a href="IngredientFoodEdit.aspx?Id=<%# Eval("ingID") %>&Id1=<%# Eval("foodID") %>" class="btn btn-sm btn-outline-success btn-block">Edit</a>
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

            <!-- unlinked data table-->
            <div class="row">
                <div class="col-lg-12">
                    <h4>Select food to link with ingredient:</h4>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="unlinkedData" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <asp:DataList ID="dlFood" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("foodId") %></td>
                                                    <td><%# Eval("name") %></td>
                                                    <td><%# Eval("Category.name") %></td>
                                                    <td>
                                                        <a href="IngredientFoodAdd.aspx?Id=<%# Eval("foodId") %>" class="btn btn-sm btn-primary btn-block">Add</a>
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
            <!-- end of unlinked data table-->
        </form>
    </div>
    <script>
        $(document).ready(function () {
            $('#linkedData').dataTable({
                "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
            });
            $('#unlinkedData').dataTable({
                "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
            });
        });

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
