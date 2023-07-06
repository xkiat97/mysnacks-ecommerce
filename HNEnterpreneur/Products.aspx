<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="HNEnterpreneur.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Products
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Home.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Products</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <br />
    <form id="form" runat="server">
        <asp:LinqDataSource ID="dsCategory" runat="server" ContextTypeName="HNEnterpreneur.HNEnterpreneurDBDataContext" EntityTypeName="" TableName="Categories" Select="new (catId, name, status)" Where="status == @status">
            <WhereParameters>
                <asp:Parameter DefaultValue="T" Name="status" Type="Char"></asp:Parameter>
            </WhereParameters>
        </asp:LinqDataSource>
        <div class="container">
            <div class="col-lg-7">
                <ul class="nav nav-tabs">
                    <li id="all" class=""><a href="?">All</a></li>
                    <asp:Repeater ID="rCategory" runat="server" DataSourceID="dsCategory">
                        <ItemTemplate>
                            <li class="" id="<%# Eval("catId") %>"><a href="?Id=<%# Eval("catId") %>"><%# Eval("name") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" style="overflow: auto; overflow-x: hidden; height: 75vh;">
                        <h3></h3>
                        <asp:ListView ID="lvFood" runat="server" GroupItemCount="3">
                            <LayoutTemplate>
                                <div>
                                    <asp:PlaceHolder ID="groupPlaceholder" runat="server"></asp:PlaceHolder>
                                </div>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <div class="row">
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                </div>
                            </GroupTemplate>
                            <ItemTemplate>
                                <div class="col-lg-4">
                                    <div class="thumbnail food" data-toggle="modal" data-target="#foodDetails">
                                        <input class="foodId" type="hidden" value="<%# Eval("foodId") %>" />
                                        <img class="img-rounded" src="../Images/FoodImg/<%# Eval("image") %>" style="width: 200px; height: 150px" />
                                        <div class="caption">
                                            <p class="text-center"><%# Eval("name") %></p>
                                            <p class="text-center">RM <%# Eval("price","{0:f2}") %></p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab">Order List</a></li>
                </ul>
                <div class="tab-content">
                    <h3></h3>
                    <div id="ordLst" class="tab-pane fade in active">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Food Name</th>
                                    <th>Price (RM)</th>
                                    <th>Quantity</th>
                                    <th>Amount</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:DataList ID="dlCart" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <tr class="cartFood" data-toggle="modal" data-target="#foodDetails">
                                            <input id="cartItem" class="foodId" type="hidden" value="<%# Eval("foodId") %>" />
                                            <td><%# Eval("name") %></td>
                                            <td><%# Eval("price","{0:f2}") %></td>
                                            <td class="<%# Eval("foodId") %>"><%# Eval("quantity") %></td>
                                            <td><%# String.Format("{0:0.00}", Convert.ToDecimal(Eval("price")) * Convert.ToDecimal(Eval("quantity"))) %></td>
                                            <td><a onclick="delToCart(<%# Eval("foodId") %>);"><i class="fa fa-trash-o"></i></a></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:DataList>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="3">Total Amount RM</th>
                                    <th>
                                        <asp:Label ID="lblTotalAmount" runat="server" Text="Label"></asp:Label></th>
                                    <th></th>
                                </tr>
                            </tfoot>
                        </table>
                        <hr />
                        <asp:Button ID="btnChkOut" class="btn btn-success btnChkOut" runat="server" Text="Check Out" OnClick="btnChkOut_Click" />
                        <asp:Button ID="btnClear" class="btn btn-danger pull-right" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div id="foodDetails" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="foodName">food name</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-5">
                                <img id="cimg" src="../Images/FoodImg/noAvailable.jpg" width="200" height="200" />
                            </div>
                            <div class="col-lg-7">
                                <p><strong>Food Name : </strong><span id="cname"></span></p>
                                <p><strong>Description : </strong><span id="cdescription"></span></p>
                                <p><strong>Price (RM) : </strong><span id="cprice"></span></p>
                                <div class="form-group">
                                    <label for="cdesc">Remarks:</label>
                                    <textarea id="cdesc" cols="20" rows="2" class="form-control cdesc" placeholder="Put your remarks here" style="resize: none;"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="cqty">Quantity:</label>
                                    <input id="cid" type="hidden" class="form-control" />
                                    <input id="cqty" type="number" class="form-control cqty" value="1" min="1" step="1" />
                                    <span class="errMsg"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="addToCart" type="button" class="btn btn-primary">Add to cart</button>
                        <button id="uptToCart" type="button" class="btn btn-primary">Update cart</button>
                        <button id="delToCart" type="button" class="btn btn-danger" data-dismiss="modal">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <span id="script" runat="server"></span>
    <script>
        $(document).ready(function () {
            $(".btnChkOut").hide();
            if ($("#cartItem").val() != "") {
                $(".btnChkOut").show();
            }
        });
        $(".food").click(function () {
            //disable to update and delete button
            $("#addToCart").show();
            $("#uptToCart").hide();
            $("#delToCart").hide();
            $(".errMsg").html("");
            var id = $(this).children(".foodId").val();
            getFoodDetails(id);
        });

        $(".cartFood").click(function () {
            //disable the add to cart button
            $("#addToCart").hide();
            $("#uptToCart").show();
            $("#delToCart").show();
            $(".errMsg").html("");
            var id = $(this).children(".foodId").val();
            getFoodDetails(id);
            $.ajax({
                type: "POST",
                url: "Products.aspx/getCartDetails",
                data: '{id:"' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response != null && response.d != null) {
                        var data = response.d;
                        data = $.parseJSON(data);

                        //clear the text
                        $("#cqty").val(data.quantity);
                        $("#cdesc").val(data.description);

                    }
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });

        $("#addToCart").click(function () {
            var id = $("#cid").val();
            var qty = parseInt($("#cqty").val());
            var desc = $("#cdesc").val();
            var dbQty = $("#cqty").attr("max");
            var seQty = $("." + $("#cid").val()).html();
            if (seQty == undefined) {
                seQty = 0;
            }
            var availableQty = dbQty - seQty;
            //if the quantity available is less than the customer choosen
            if (qty > availableQty) {
                //display err msg
                $(".errMsg").html('<p class="alert alert-danger">Sorry, you can only add ' + availableQty + ' more quantity.</p>');

                //change the quantity to maximum
                $("#cqty").val(availableQty);

            } else {
                //no error than update the cart
                addToCart(id, qty, desc);
            }
        });

        $("#uptToCart").click(function () {
            var id = $("#cid").val();
            var qty = parseInt($("#cqty").val());
            var desc = $("#cdesc").val();
            var dbQty = $("#cqty").attr("max");
            var availableQty = dbQty;
            //if the quantity available is less than the customer choosen
            if (qty > availableQty) {
                //display err msg
                $(".errMsg").html('<p class="alert alert-danger">Sorry, you can only add ' + availableQty + ' more quantity.</p>');
                //change the quantity to maximum
                $("#cqty").val(availableQty);

            } else {
                //no error than update the cart
                uptToCart(id, qty, desc);
            }
        });

        $("#delToCart").click(function () {
            var id = $("#cid").val();
            var qty = $("#cqty").val();
            var desc = $("#cdesc").val();
            delToCart(id);
        });

        function getFoodDetails(id) {
            $.ajax({
                type: "POST",
                url: "Products.aspx/getFoodDetails",
                data: '{foodId:"' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response != null && response.d != null) {
                        var data = response.d;
                        data = $.parseJSON(data);
                        $("#foodName").html(data.name);
                        $("#cname").html(data.name);
                        $("#cdescription").html(data.description);
                        $("#cprice").html(data.price);
                        $("#cimg").attr("src", "../Images/FoodImg/" + data.image);
                        $("#cid").val(id);
                        $("#cqty").attr("max", data.quantity);

                        //clear the text
                        $("#cqty").val(1);
                        $("#cdesc").val("");

                    }
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function addToCart(id, qty, desc) {
            $.ajax({
                type: "POST",
                url: "Products.aspx/addToCart",
                data: '{id:"' + id + '", qty:"' + qty + '", desc:"' + desc + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: OnFailure
            });
        }

        function uptToCart(id, qty, desc) {
            $.ajax({
                type: "POST",
                url: "Products.aspx/uptToCart",
                data: '{id:"' + id + '", qty:"' + qty + '", desc:"' + desc + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: OnFailure
            });
        }

        function delToCart(id) {
            $.ajax({
                type: "POST",
                url: "Products.aspx/delToCart",
                data: '{id:"' + id + '"}',
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
