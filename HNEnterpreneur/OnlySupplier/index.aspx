<%@ Page Title="" Language="C#" MasterPageFile="~/OnlySupplier/Supplier.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HNEnterpreneur.OnlySupplier.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- Icon Cards-->
    <div class="row">
        <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-user"></i>
                    </div>
                    <div class="mr-5">
                        <asp:Label ID="lblUserRegisted" runat="server" Text=""></asp:Label>
                        New users registed
                    </div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="AdminAccList.aspx?usrTyp=Member">
                    <span class="float-left">View Details</span>
                    <span class="float-right">
                        <i class="fa fa-angle-right"></i>
                    </span>
                </a>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-list"></i>
                    </div>
                    <div class="mr-5">RM 
                        <asp:Label ID="lblTodaySales" runat="server" Text=""></asp:Label>
                        Today's sales
                    </div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="AdminOrderList.aspx">
                    <span class="float-left">View Details</span>
                    <span class="float-right">
                        <i class="fa fa-angle-right"></i>
                    </span>
                </a>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-exclamation-circle"></i>
                    </div>
                    <div class="mr-5">
                        <asp:Label ID="lblIncompletedOrders" runat="server" Text=""></asp:Label>
                        Incompleted orders
                    </div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="AdminOrderList.aspx">
                    <span class="float-left">View Details</span>
                    <span class="float-right">
                        <i class="fa fa-angle-right"></i>
                    </span>
                </a>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-hourglass-end"></i>
                    </div>
                    <div class="mr-5">RM 
                        <asp:Label ID="lblMonthlyExpensers" runat="server" Text=""></asp:Label>
                        Monthly Expensers
                    </div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="">
                    <span class="float-left">View Details</span>
                    <span class="float-right">
                        <i class="fa fa-angle-right"></i>
                    </span>
                </a>
            </div>
        </div>
    </div>
    <!--END-->
</asp:Content>
