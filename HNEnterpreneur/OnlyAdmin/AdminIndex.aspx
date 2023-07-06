<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.AdminIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Resources -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/pie.js"></script>
    <script src="https://www.amcharts.com/lib/3/gauge.js"></script>

    <style>
        #BCtop5B, #BCtop5W{
            width: 100%;
            height: 350px;
        }
        #PCPStaff, #PCDStaff {
            width: 100%;
            height: 250px;
        }
        #PCTimeCompleted, #GUserLogin {
            width: 100%;
            height: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Home
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
    <h4>Selling analyst</h4>
    <hr />
    <div class="row">
        <div class="col-lg-6">
            <!-- Top 5 Best selling snacks -->
            <!-- Chart code -->
            <script>
                var today = new Date();
                var chart = AmCharts.makeChart("BCtop5B", {
                    "type": "serial",
                    "theme": "light",
                    "titles": [{
                        "text": "H&N Enterprise"
                    }, {
                        "text": "Top 5 Best Selling Snacks Report from 2015 to 2017 \nDate Created : " + today.toLocaleDateString(),
                        "bold": false
                    }],
                    "dataProvider": [<%= BCtop5BDATA %>],
                    "gridAboveGraphs": true,
                    "startDuration": 1,
                    "graphs": [{
                        "balloonText": "[[category]]: <b>[[value]]</b>",
                        "fillAlphas": 0.8,
                        "lineAlpha": 0.2,
                        "type": "column",
                        "valueField": "value"
                    }],
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "name",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "gridAlpha": 0,
                        "tickPosition": "start",
                        "tickLength": 20
                    },
                    "export": {
                        "enabled": true
                    }

                });
            </script>
            <div class="card-header">
                <i class="fa fa-bar-chart"></i>&nbsp;Top 5 Best selling snacks
            </div>
            <div class="card-body">
                <div id="BCtop5B"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <!-- Top 5 Worst selling snacks -->
            <!-- Chart code -->
            <script>
                var chart = AmCharts.makeChart("BCtop5W", {
                    "type": "serial",
                    "theme": "light",
                    "titles": [{
                        "text": "H&N Enterprise"
                    }, {
                        "text": "Top 5 Worst Selling Snacks Report from 2015 to 2017 \nDate Created : " + today.toLocaleDateString(),
                        "bold": false
                    }],
                    "dataProvider": [<%= BCtop5WDATA %>],
                    "gridAboveGraphs": true,
                    "startDuration": 1,
                    "graphs": [{
                        "balloonText": "[[category]]: <b>[[value]]</b>",
                        "fillAlphas": 0.8,
                        "lineAlpha": 0.2,
                        "type": "column",
                        "valueField": "value"
                    }],
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "name",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "gridAlpha": 0,
                        "tickPosition": "start",
                        "tickLength": 20
                    },
                    "export": {
                        "enabled": true
                    }

                });
            </script>
            <div class="card-header">
                <i class="fa fa-bar-chart"></i>&nbsp;Top 5 Worst selling snacks
            </div>
            <div class="card-body">
                <div id="BCtop5W"></div>
            </div>
        </div>
    </div>

    <h4>Business performances</h4>
    <hr />
    <div class="row">
        <div class="col-lg-6">
            <!-- Chart code -->
            <script>
                //preparation staff
                var chartPie = AmCharts.makeChart("PCPStaff", {
                    "type": "pie",
                    "theme": "light",
                    "dataProvider": [<%= PCPStaffDATA %>],
                    "valueField": "value",
                    "titleField": "name",
                    "balloon": {
                        "fixedPosition": true
                    },
                    "export": {
                        "enabled": true
                    }
                });
            </script>
            <div class="card-header">
                <i class="fa fa-pie-chart"></i>&nbsp;Prepration Staff
            </div>
            <div class="card-body">
                <div id="PCPStaff"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <script>
                //delivery staff
                var chartPie = AmCharts.makeChart("PCDStaff", {
                    "type": "pie",
                    "theme": "light",
                    "dataProvider": [<%= PCDStaffDATA %>],
                    "valueField": "value",
                    "titleField": "name",
                    "balloon": {
                        "fixedPosition": true
                    },
                    "export": {
                        "enabled": true
                    }
                });
            </script>
            <div class="card-header">
                <i class="fa fa-pie-chart"></i>&nbsp;Delivery Staff
            </div>
            <div class="card-body">
                <div id="PCDStaff"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <script>
                //delivery staff
                var chartPie = AmCharts.makeChart("PCTimeCompleted", {
                    "type": "pie",
                    "theme": "light",
                    "dataProvider": [<%= PCTimeCompletedDATA %>],
                    "valueField": "value",
                    "titleField": "name",
                    "balloon": {
                        "fixedPosition": true
                    },
                    "export": {
                        "enabled": true
                    }
                });
            </script>
            <div class="card-header">
                <i class="fa fa-pie-chart"></i>&nbsp;Average Time to complete the order
            </div>
            <div class="card-body">
                <div id="PCTimeCompleted"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <!-- Chart code -->
            <script>
                $(document).ready(function () {
                    randomValue();
                })
                var chart = AmCharts.makeChart("GUserLogin", {
                    "theme": "light",
                    "type": "gauge",
                    "axes": [{
                        "topTextFontSize": 20,
                        "topTextYOffset": 70,
                        "axisColor": "#31d6ea",
                        "axisThickness": 1,
                        "endValue": 100,
                        "gridInside": true,
                        "inside": true,
                        "radius": "50%",
                        "valueInterval": 10,
                        "tickColor": "#67b7dc",
                        "startAngle": -90,
                        "endAngle": 90,
                        "unit": "%",
                        "bandOutlineAlpha": 0,
                        "bands": [{
                            "color": "#0080ff",
                            "endValue": 100,
                            "innerRadius": "105%",
                            "radius": "170%",
                            "gradientRatio": [0.5, 0, -0.5],
                            "startValue": 0
                        }, {
                            "color": "#3cd3a3",
                            "endValue": 0,
                            "innerRadius": "105%",
                            "radius": "170%",
                            "gradientRatio": [0.5, 0, -0.5],
                            "startValue": 0
                        }]
                    }],
                    "arrows": [{
                        "alpha": 1,
                        "innerRadius": "35%",
                        "nailRadius": 0,
                        "radius": "170%"
                    }]
                });

                // set random value
                function randomValue() {
                    var value = <%= GUserLogin1 %>;
                    var total = <%= GUserLogin2 %>;
                    chart.arrows[0].setValue((value * 100 / total).toFixed(0));
                    chart.axes[0].setTopText(value + " Users");
                    // adjust darker band to new value
                    chart.axes[0].bands[1].setEndValue((value * 100 / total).toFixed(0));
                }
            </script>

            <div class="card-header">
                <i class="fa fa-pie-chart"></i>&nbsp;Number Of member user login today
            </div>
            <div class="card-body">
                <div id="GUserLogin"></div>
            </div>
        </div>
    </div>
</asp:Content>
