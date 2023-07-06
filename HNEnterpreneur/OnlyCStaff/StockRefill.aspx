<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyCStaff/CookingStaff.Master" AutoEventWireup="true" CodeBehind="StockRefill.aspx.cs" Inherits="HNEnterpreneur.OnlyCStaff.StockRefill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .img-upload {
            width: 80%;
            height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Stock Refill
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <h2>Stock Refill</h2>
        <hr />
        <form id="form1" runat="server" class="col-md-10">
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-6">
                        <label for="lblFoodID1">Food ID :</label>
                        <asp:Label ID="lblFoodID1" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-6">
                        <label for="lblFoodName1">Food Name :</label>
                        <asp:Label ID="lblFoodName1" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <img class="img-upload" src="../Images/System/uploadImg.jpg" runat="server" />
                </div>
                <div class="col-lg-6">
                    <hr />
                    <div class="row">
                        <div class="col-lg-4">Balance :</div>
                        <div class="col-lg-8">
                            <asp:Label ID="lblBalance" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-lg-4">Max Quantity :</div>
                        <div class="col-lg-8">
                            <asp:Label ID="lblMax" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-lg-4">Shortage :</div>
                        <div class="col-lg-8">
                            <asp:Label ID="lblShortage" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-lg-4">Available :</div>
                        <div class="col-lg-8">
                            <asp:Label ID="lblAvailable" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <hr />
                    <label for="lblFoodName1">Quantity Added:</label>
                    <div class="input-group">
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-danger btn-number" data-type="minus" data-field="quant">
                                <span class="glyphicon glyphicon-minus">-</span>
                            </button>
                        </span>
                        <input id="txtQtyAdd" runat="server" type="text" class="form-control input-number quant" value="0" min="0" max='' readonly>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-success btn-number" data-type="plus" data-field="quant">
                                <span class="glyphicon glyphicon-plus">+</span>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-3 offset-6">
                    <asp:button ID="btnBack" runat="server" text="Back" cssclass="btn btn-default btn-block" OnClientClick="JavaScript:window.history.back(1); return false;" formnovalidate />
                </div>
                <div class="col-lg-3">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block align-bottom" OnClick="btnsubmit_Click" />
                </div>
            </div>
            <br />
            <div class="row">
                <label><h4>Other Ingredient lists:</h4></label>&emsp;
                <div class="col-lg-12">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Unit</th>
                                    <th>Balance</th>
                                    <th>Quantity Used</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Unit</th>
                                    <th>Balance</th>
                                    <th>Quantity Used</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <asp:DataList ID="dlFood" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" DataSourceID="ingLinkds">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("ingId") %></td>
                                            <td><%# Eval("Ingredient.name") %></td>
                                            <td><%# Eval("Ingredient.balanceType") %></td>
                                            <td><%# Eval("Ingredient.balance") %></td>
                                            <td><%# Eval("qtyNeeded") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:LinqDataSource runat="server" EntityTypeName="" ID="ingLinkds" ContextTypeName="HNEnterpreneur.HNEnterpreneurDBDataContext" TableName="Ing_lists" Where="foodID == @foodID">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="lblFoodID1" PropertyName="Text" Name="foodID" Type="Int32"></asp:ControlParameter>
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script>
        $(document).ready(function () {
            $(".quant").attr("max",<%= maxQty %>);
        });
        $('.btn-number').click(function (e) {
            e.preventDefault();

            $('.btn-number').removeAttr('disabled');
            fieldName = $(this).attr('data-field');
            type = $(this).attr('data-type');
            var input = $("." + fieldName);
            var currentVal = parseInt(input.val());
            if (!isNaN(currentVal)) {
                if (type == 'minus') {

                    if (currentVal > input.attr('min')) {
                        input.val(currentVal - 1).change();
                    }
                    if (parseInt(input.val()) == input.attr('min')) {
                        $(this).attr('disabled', true);
                    }

                } else if (type == 'plus') {

                    if (currentVal < input.attr('max')) {
                        input.val(currentVal + 1).change();
                    }
                    if (parseInt(input.val()) == input.attr('max')) {
                        $(this).attr('disabled', true);
                    }

                }
            } else {
                input.val(0);
            }
        });
        $('.input-number').focusin(function () {
            $(this).data('oldValue', $(this).val());
        });
        $('.input-number').change(function () {

            minValue = parseInt($(this).attr('min'));
            maxValue = parseInt($(this).attr('max'));
            valueCurrent = parseInt($(this).val());

            name = $(this).attr('name');
            if (valueCurrent >= minValue) {
                $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
            } else {
                alert('Sorry, the minimum value was reached');
                $(this).val($(this).data('oldValue'));
            }
            if (valueCurrent <= maxValue) {
                $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
            } else {
                alert('Sorry, the maximum value was reached');
                $(this).val($(this).data('oldValue'));
            }


        });
        $(".input-number").keydown(function (e) {
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
                // Allow: Ctrl+A
                (e.keyCode == 65 && e.ctrlKey === true) ||
                // Allow: home, end, left, right
                (e.keyCode >= 35 && e.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });
    </script>
</asp:Content>
