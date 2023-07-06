<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="ReportSB.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.ReportSB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Stock Balance Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <form class="row col-lg-12" runat="server">
        <a class="btn btn-default pull-right" href="DetailReport.aspx"><i class="fa fa-arrow-circle-o-left" style="font-size:30px"></i></a>
        <a class="btn btn-default pull-right" href="#" onclick="window.print()"><i class="fa fa-print" style="font-size:30px"></i></a>
    </form>
    <div class="row">
        <div class="col-lg-12">
            <table id="table" class="table">
                <tr>
                    <td>
                        <img src="../Images/System/logo.png" style="width: 150px; height: 90px;" />
                    </td>
                    <td colspan="4" style="text-align: center;">
                        <h5>Stock Balance Report AS OF <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h5>
                    </td>
                    <td style="text-align: right;">
                        <sm>DATE CREATE: <br /><i><asp:Label ID="lblDateCreated" runat="server" Text=""></asp:Label></i></sm>
                    </td>
                </tr>
                <tr>
                    <th>Category</th>
                    <th>Snacks ID</th>
                    <th>Snacks Name</th>
                    <th>Price (RM)</th>
                    <th>Quantity (System)</th>
                    <th>Stock Counted</th>
                </tr>
                <asp:Repeater ID="rStockBalance" runat="server">
                    <ItemTemplate>
                        <tr style="<%# Eval("alert") %>">
                            <td><%# Eval("Category.name") %></td>
                            <td><%# Eval("foodId") %></td>
                            <td><%# Eval("name") %></td>
                            <td><%# Eval("price") %></td>
                            <td><%# Eval("quantity") %></td>
                            <td></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <hr />
            <h5 style="text-align: center;">End Of Report</h5>
            <hr />
            <br />
        </div>
    </div>
</asp:Content>
