<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProfileReports.aspx.cs" Inherits="HNEnterpreneur.ProfileReports" %>

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

        #usedByFoodChart, #BCmonthlyOrder {
            width: 100%;
            height: 300px;
        }
    </style>
    <!-- Resources -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/pie.js"></script>
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
                        <li class="brand-nav"><a href="ProfileMyOrders.aspx"><i class="fa fa-book"></i>&nbsp;My Orders</a></li>
                        <li class="brand-nav"><a href="ProfileMemberPoint.aspx"><i class="fa fa-user-circle-o"></i>&nbsp;Member Point</a></li>
                        <li class="brand-nav"><a href="ProfileDeliveryAddress.aspx"><i class="fa fa-address-card-o"></i>&nbsp;Delivery address</a></li>
                        <li class="brand-nav"><a href="ProfileChangePassword.aspx"><i class="fa fa-lock"></i>&nbsp;Change password</a></li>
                        <li class="brand-nav active"><a href="ProfileReports.aspx"><i class="fa fa-bar-chart-o"></i>&nbsp;Reports&Analyst</a></li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    <div class="tab-content">
                        <div class="tab-pane active" style="min-height: 500px;">
                            <div class="row">
                                <div class="card col-sm-12">
                                    <div class="card-header">
                                        <i class="fa fa-pie-chart"></i>&nbsp;My favour snacks
                                    </div>
                                    <div class="card-body">
                                        <div id="usedByFoodChart"></div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <!-- END of chart -->
                            <!-- monthly order -->
                            <div class="row">
                                <div class="card col-12">
                                    <div class="card-header">
                                        <i class="fa fa-area-chart"></i>&nbsp;Monthly Order Summary
                                    </div>
                                    <div class="card-body">
                                        <div id="BCmonthlyOrder"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Chart code -->
    <script>
        //this is for sold by company chart
        var chartPie1 = AmCharts.makeChart("usedByFoodChart", {
            "type": "pie",
            "theme": "light",
            "dataProvider": [<%= usedByFoodChartData %>],
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

    <!-- Chart code -->
    <script>
        var chart = AmCharts.makeChart("BCmonthlyOrder", {
            "type": "serial",
            "theme": "light",
            "dataProvider": [<%= BCmonthlyOrderDATA %>],
            "gridAboveGraphs": true,
            "startDuration": 1,
            "graphs": [{
                "balloonText": "[[category]]: <b>[[value]]</b>",
                "fillAlphas": 0.8,
                "lineAlpha": 0.2,
                "type": "column",
                "valueField": "Total"
            }],
            "chartCursor": {
                "categoryBalloonEnabled": false,
                "cursorAlpha": 0,
                "zoomable": false
            },
            "categoryField": "month",
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
</asp:Content>
