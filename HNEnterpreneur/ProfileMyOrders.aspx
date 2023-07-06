<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProfileMyOrders.aspx.cs" Inherits="HNEnterpreneur.ProfileMyOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        @media (min-width: 768px) {

            .brand-pills > li > a {
                border-top-right-radius: 0px;
                border-bottom-right-radius: 0px;
            }

            li.brand-nav.active a:after {
                content: " ";
                display: block;
                width: 0;
                height: 0;
                border-top: 20px solid transparent;
                border-bottom: 20px solid transparent;
                border-left: 9px solid #428bca;
                position: absolute;
                top: 50%;
                margin-top: -20px;
                left: 100%;
                z-index: 2;
            }
        }
    </style>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Home.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Profile</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="container">
        <div class="row">
            <br />
            <hr />
            <div role="tabpanel">
                <div class="col-sm-3">
                    <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                        <li class="brand-nav active"><a href="ProfileMyOrders.aspx"><i class="fa fa-book"></i>&nbsp;My Orders</a></li>
                        <li class="brand-nav"><a href="ProfileMemberPoint.aspx"><i class="fa fa-user-circle-o"></i>&nbsp;Member Point</a></li>
                        <li class="brand-nav"><a href="ProfileDeliveryAddress.aspx"><i class="fa fa-address-card-o"></i>&nbsp;Delivery address</a></li>
                        <li class="brand-nav"><a href="ProfileChangePassword.aspx"><i class="fa fa-lock"></i>&nbsp;Change password</a></li>
                        <li class="brand-nav"><a href="ProfileReports.aspx"><i class="fa fa-bar-chart-o"></i>&nbsp;Reports&Analyst</a></li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    <div class="tab-content">
                        <div class="tab-pane active" style="min-height: 500px;">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#ordSts">Order Status</a></li>
                                <li><a href="#ordHis">Orders History</a></li>
                            </ul>

                            <div class="tab-content">
                                <div id="ordSts" class="tab-pane fade in active">
                                    <table cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Order Date</th>
                                                <th>Receiver Name</th>
                                                <th>Address</th>
                                                <th>Status</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rOrderStatus" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("orderId") %></td>
                                                        <td><%# Eval("orderDate") %></td>
                                                        <td><%# Eval("Address.name") %></td>
                                                        <td><%# Eval("Address.line1") %>,
                                                    <%# Eval("Address.line2") %>,
                                                    <%# Eval("Address.city") %>,
                                                    <%# Eval("Address.postcode") %>, 
                                                    <%# Eval("Address.state") %>, 
                                                    <%# Eval("Address.country") %>
                                                        </td>
                                                        <td><%# Eval("sts") %></td>
                                                        <td>
                                                            <a href="OrderReceipt.aspx?Id=<%# Eval("orderId") %>" class="btnDone btn btn-success">View</a>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Order Date</th>
                                                <th>Receiver Name</th>
                                                <th>Address</th>
                                                <th>Status</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div id="ordHis" class="tab-pane fade">
                                    <table cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Order Date</th>
                                                <th>Receiver Name</th>
                                                <th>Address</th>
                                                <th>Total (RM)</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rOrderHistory" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("orderId") %></td>
                                                        <td><%# Eval("orderDate") %></td>
                                                        <td><%# Eval("Address.name") %></td>
                                                        <td><%# Eval("Address.line1") %>,
                                                    <%# Eval("Address.line2") %>,
                                                    <%# Eval("Address.city") %>,
                                                    <%# Eval("Address.postcode") %>, 
                                                    <%# Eval("Address.state") %>, 
                                                    <%# Eval("Address.country") %>
                                                        </td>
                                                        <td><%# Eval("total") %></td>
                                                        <td>
                                                            <a href="OrderReceipt.aspx?Id=<%# Eval("orderId") %>" class="btnDone btn btn-success">View</a>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Order Date</th>
                                                <th>Receiver Name</th>
                                                <th>Address</th>
                                                <th>Total (RM)</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/1.9.4-jquery.dataTables.min.js"></script>
    <script src="../js/KitchenDatatable.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.datatable').dataTable({
                "sPaginationType": "bs_four_button"
            });
            $('.datatable').each(function () {
                var datatable = $(this);
                // SEARCH - Add the placeholder for Search and Turn this into in-line form control
                var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
                search_input.attr('placeholder', 'Search');
                search_input.addClass('form-control input-sm');
                // LENGTH - Inline-Form control
                var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
                length_sel.addClass('form-control input-sm');
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $(".nav-tabs a").click(function () {
                $(this).tab('show');
            });
            $('.nav-tabs a').on('shown.bs.tab', function (event) {
                var x = $(event.target).text();         // active tab
                var y = $(event.relatedTarget).text();  // previous tab
                $(".act span").text(x);
                $(".prev span").text(y);
            });
        });
    </script>
</asp:Content>
