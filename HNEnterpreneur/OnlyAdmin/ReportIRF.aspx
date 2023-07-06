<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="ReportIRF.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.ReportIRF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Inventory Refill Forecasting
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form class="row col-lg-12" runat="server">
        <a class="btn btn-default pull-right" href="DetailReport.aspx"><i class="fa fa-arrow-circle-o-left" style="font-size: 30px"></i></a>
        <a class="btn btn-default pull-right" href="#" onclick="window.print()"><i class="fa fa-print" style="font-size: 30px"></i></a>
    </form>
    <div class="row">
        <div class="col-lg-12">
            <table id="table" class="table">
                <tr>
                    <td>
                        <img src="../Images/System/logo.png" style="width: 150px; height: 90px;" />
                    </td>
                    <td colspan="4" style="text-align: center;">
                        <h5>Inventory Refill Forecasting Report AS OF
                            <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h5>
                    </td>
                    <td style="text-align: right;">
                        <sm>DATE CREATE: <br /><i><asp:Label ID="lblDateCreated" runat="server" Text=""></asp:Label></i></sm>
                    </td>
                </tr>
                <tr>
                    <th>Ingredient ID</th>
                    <th>Ingredient Name</th>
                    <th>Balance</th>
                    <th>Forecasted Reorder Point</th>
                    <th>Forecasted Refill Date</th>
                    <th>Forecasted Days left</th>
                </tr>
                <asp:Repeater ID="rforecast" runat="server">
                    <ItemTemplate>
                        <tr style="">
                            <td><%# Eval("ingId") %></td>
                            <td><%# Eval("name") %></td>
                            <td><%# Eval("balance") %> <%# Eval("balanceType") %></td>
                            <td><%# Eval("reorderPoint") %> <%# Eval("balanceType") %></td>
                            <td><%# Eval("reorderDate") %></td>
                            <td><%# Eval("reorderDays") %></td>
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
