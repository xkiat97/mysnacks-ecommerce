<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyStoreAdmin/Store.Master" AutoEventWireup="true" CodeBehind="SAindex.aspx.cs" Inherits="HNEnterpreneur.OnlyStoreAdmin.SAindex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet" />

    <!-- amchart.com recources -->
    <!-- ingredient stock level recources -->
    <!-- Styles -->
    <style>
        /* this is for serial chart*/
        #chartdiv {
            width: 100%;
            height: 290px;
            font-size: 11px;
        }

        /*this is for pie chart*/
        #chartdivPie {
            width: 100%;
            height: 330px;
            font-size: 11px;
        }

        .amcharts-pie-slice {
            transform: scale(1);
            transform-origin: 50% 50%;
            transition-duration: 0.3s;
            transition: all .3s ease-out;
            -webkit-transition: all .3s ease-out;
            -moz-transition: all .3s ease-out;
            -o-transition: all .3s ease-out;
            cursor: pointer;
            box-shadow: 0 0 30px 0 #000;
        }

            .amcharts-pie-slice:hover {
                transform: scale(1.1);
                filter: url(#shadow);
            }
    </style>

    <!-- Resources -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/pie.js"></script>

    <!-- END -->

    <!--fullcalendar.io resource -->
    <%--<script src="../vendor/calendar/fullcalendar.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.2/fullcalendar.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.2/fullcalendar.print.css" media="print" />
    <script src="../vendor/calendar/jquery.js"></script>
    <script src="../vendor/calendar/moment.min.js"></script>--%>
    <!-- END -->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Home
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- Start of ingredient stock level data source -->
    <!-- Chart code for serial-->
    <%= headerjschartData %>
    <asp:Repeater ID="rchartData" runat="server">
        <ItemTemplate>
            {
                    "ingredient": "<%# Eval("name")%>",
                    "percent": <%# Eval("shortage")%>,
                    "color": "#FF0F00"
                },
        </ItemTemplate>
    </asp:Repeater>
    <%= footerjschartData %>
    <script>
        var chart = AmCharts.makeChart("chartdiv", {
            "theme": "light",
            "type": "serial",
            "dataProvider": chartData,
            "categoryField": "ingredient",
            "depth3D": 20,
            "angle": 30,

            "categoryAxis": {
                "labelRotation": 90,
                "gridPosition": "start"
            },

            "valueAxes": [{
                "title": "Percent (%)"
            }],

            "graphs": [{
                "valueField": "percent",
                "colorField": "color",
                "type": "column",
                "lineAlpha": 0.1,
                "fillAlphas": 1
            }],

            "chartCursor": {
                "cursorAlpha": 0,
                "zoomable": false,
                "categoryBalloonEnabled": false
            },

            "export": {
                "enabled": true
            }
        });
    </script>
    <!-- End of data source -->

    <!-- chart code for pie -->
    <%= headerjsdataChartPie %>
    <asp:Repeater ID="rdataChartPie" runat="server">
        <ItemTemplate>
            {
                "title": "<%# Eval("title")%>",
                "value": <%# Eval("value")%>
            },
        </ItemTemplate>
    </asp:Repeater>
    <%= footerjsdataChartPie %>
    <script>
        var chart = AmCharts.makeChart("chartdivPie", {
            "type": "pie",
            "startDuration": 0,
            "theme": "light",
            "addClassNames": true,
            "legend": {
                "position": "right",
                "marginRight": 100,
                "autoMargins": false
            },
            "innerRadius": "30%",
            "defs": {
                "filter": [{
                    "id": "shadow",
                    "width": "200%",
                    "height": "200%",
                    "feOffset": {
                        "result": "offOut",
                        "in": "SourceAlpha",
                        "dx": 0,
                        "dy": 0
                    },
                    "feGaussianBlur": {
                        "result": "blurOut",
                        "in": "offOut",
                        "stdDeviation": 5
                    },
                    "feBlend": {
                        "in": "SourceGraphic",
                        "in2": "blurOut",
                        "mode": "normal"
                    }
                }]
            },
            "dataProvider": dataChartPie,
            "valueField": "value",
            "titleField": "title",
            "export": {
                "enabled": true
            }
        });

        chart.addListener("init", handleInit);

        chart.addListener("rollOverSlice", function (e) {
            handleRollOver(e);
        });

        function handleInit() {
            chart.legend.addListener("rollOverItem", handleRollOver);
        }

        function handleRollOver(e) {
            var wedge = e.dataItem.wedge.node;
            wedge.parentNode.appendChild(wedge);
        }
    </script>
    <!-- End od data source -->

    <!-- Start of scheduling data source -->
    <%= headerjseventData %>
    <asp:Repeater ID="reventData" runat="server">
        <ItemTemplate>
            {
                "title": "<%# Eval("title")%> ( <%# Eval("quantity")%> <%# Eval("balanceType")%> )",
                "start": "<%# Eval("start")%>",
                "url": "<%# Eval("url")%>"
            },
        </ItemTemplate>
    </asp:Repeater>
    <%= footerjseventData %>
    <%--<script>
        $(document).ready(function () {
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listWeek'
                },
                defaultDate: Date.now(),
                navLinks: true, // can click day/week names to navigate views
                editable: false,
                eventLimit: true, // allow "more" link when too many events
                events: eventData
            });

        });
    </script>--%>
    <!-- End of data source -->
    <div class="container">
        <!-- Icon Cards-->
        <div class="row">
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-primary o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fa fa-fw fa-user"></i>
                        </div>
                        <div class="mr-5">
                            <asp:Label ID="lblNSupplier" runat="server" Text=""></asp:Label>
                            Suppliers
                        </div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="StoreAccList.aspx?usrTyp=Supplier">
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
                        <div class="mr-5">
                            <asp:Label ID="lblNOrder" runat="server" Text="Label"></asp:Label>
                            Orders
                        </div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="OrderNew.aspx">
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
                            <asp:Label ID="lblNBPending" runat="server" Text=""></asp:Label>
                            Bidding Pending
                        </div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="BiddingList.aspx">
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
                        <div class="mr-5">
                            <asp:Label ID="lblNBExpired" runat="server" Text=""></asp:Label>
                            Expired Bidding
                        </div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="BiddingFailed.aspx">
                        <span class="float-left">View Details</span>
                        <span class="float-right">
                            <i class="fa fa-angle-right"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <!--END-->
        <!--Ingredient stock level-->
        <div class="row">
            <div class="card col-sm-7">
                <div class="card-header">
                    <i class="fa fa-area-chart"></i>&nbsp;Top 5 High Demand Ingredient Stock Level
                </div>
                <div class="card-body">
                    <div id="chartdiv"></div>
                </div>
            </div>
            <div class="card col-sm-5">
                <div class="card-header">
                    <i class="fa fa-table"></i>&nbsp;Top 5 High Demand Ingredient Stock Table
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Ingredient</th>
                                    <th>Shortage</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:DataList ID="dlIng" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("name") %></td>
                                            <td><%# Eval("shortageV") %> <%# Eval("balanceType") %></td>
                                            <td>
                                                <a href="IngredientBid.aspx?Id=<%# Eval("ingID") %>" class="btn btn-sm btn-primary btn-block">Add To Bid</a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:DataList>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--END-->
        <!--Supplier Delivery Delay pie chart-->
        <br />
        <div class="row">
            <div class="card col-12">
                <div class="card-header">
                    <i class="fa fa-pie-chart"></i>&nbsp;Supplier Delivery Total Day Of Delay
                </div>
                <div class="card-body">
                    <div id="chartdivPie"></div>
                </div>
            </div>
        </div>
        <!--END-->
        <%--<!--Calendar scheduling-->
        <br />
        <div class="row">
            <div class="card col-12">
                <div class="card-header">
                    <i class="fa fa-calendar"></i>&nbsp;Supplier Delivery Scheduling
                </div>
                <div class="card-body">
                    <div id='calendar'></div>
                </div>
            </div>
        </div>
        <!-- END -->--%>
    </div>
</asp:Content>
