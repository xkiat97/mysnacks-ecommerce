<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyPStaff/PreparationStaff.Master" AutoEventWireup="true" CodeBehind="OrderPreparationDetails.aspx.cs" Inherits="HNEnterpreneur.OnlyPStaff.OrderPreparationDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Order Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:LinqDataSource ID="dsOrderL" runat="server" ContextTypeName="HNEnterpreneur.HNEnterpreneurDBDataContext" EntityTypeName="" TableName="Order_lists" Where="orderId == @orderId">
        <WhereParameters>
            <asp:QueryStringParameter Name="orderId" QueryStringField="Id" Type="Int32" />
        </WhereParameters>

    </asp:LinqDataSource>
    <h2>Order Details</h2>
    <hr />
    <div class="container">
        <form id="form1" runat="server" class="col-md-12">
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-3">
                        <label for="lblOrderId">Order ID :</label>
                        <asp:Label ID="lblOrderId" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="col-md-3">
                        <label for="lblMember">Custmer Name : </label>
                        <asp:Label ID="lblMember" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="col-md-3">
                        <label for="lbldate">Order Date :</label>
                        <asp:Label ID="lbldate" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="col-md-3">
                        <label for="lblPrice">Total Price : RM</label>
                        <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="wrap">
                <div class="container">
                    <table cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Food ID</th>
                                <th>Food Image</th>
                                <th>Food Name</th>
                                <th>Remarks</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rorderList" runat="server" DataSourceID="dsOrderL">
                                <ItemTemplate>
                                    <tr class="gradeA">
                                        <td><%# Eval("foodId") %></td>
                                        <td>
                                            <img src="../Images/foodImg/<%# Eval("Food.image") %>" width="100" height="100" /></td>
                                        <td><%# Eval("Food.name") %></td>
                                        <td><%# Eval("description") %></td>
                                        <td><%# Eval("quantity") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Food ID</th>
                                <th>Food Image</th>
                                <th>Food Name</th>
                                <th>Remarks</th>
                                <th>Quantity</th>
                            </tr>
                        </tfoot>
                    </table>

                </div>
            </div>
            <div class="form-row" style="margin-bottom:30px;">
                <div class="col-md-6"></div>
                <div class="col-md-3">
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-default btn-block" OnClick="btnBack_Click"/>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnComplete" runat="server" Text="Complete" CssClass="btn btn-primary btn-block" OnClick="btnComplete_Click"/>
                </div>
            </div>
        </form>
    </div>
</asp:Content>