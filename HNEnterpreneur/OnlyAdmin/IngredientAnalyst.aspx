<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="IngredientAnalyst.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.IngredientAnalyst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Styles -->
    <style>
        #chartdiv {
            width: 100%;
            height: 300px;
            font-size: 11px;
        }

        #flowOfPriceChart {
            width: 100%;
            height: 300px;
        }

        #monthlyOrderChart {
            width: 100%;
            height: 300px;
        }

        #soldByCompanyChart{
            width: 100%;
            height: 300px;
        }

        #usedByFoodChart{
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
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Ingredient analyst
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:LinqDataSource runat="server" ID="dsCategory" ContextTypeName="HNEnterpreneur.HNEnterpreneurDBDataContext" EntityTypeName="" TableName="Addresses" Where="status=='T'"></asp:LinqDataSource>
    <h2>Ingredient analyst</h2>
    <hr />
    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
    <div class="container">
        <form id="form1" runat="server" class="col-md-12">
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-3">
                        <label for="lblFoodID">Ingredient ID :</label>
                        <asp:Label ID="lblFoodID" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                        <label for="lblFoodSts">Status :</label>
                        <asp:Label ID="lblFoodSts" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <!-- Chart code -->
            <!-- Chart code for serial-->
            <%= headerjschartData %>
            <%= footerjschartData %>
            <script>
                var chart = AmCharts.makeChart("chartdiv", {
                    "theme": "light",
                    "type": "serial",
                    "marginRight": 80,
                    "autoMarginOffset": 20,
                    "marginTop": 20,
                    "dataProvider": chartData,
                    "valueAxes": [{
                        "id": "v1",
                        "axisAlpha": 0.1
                    }],
                    "graphs": [{
                        "useNegativeColorIfDown": true,
                        "balloonText": "[[category]]<br><b>value: [[value]]</b>",
                        "bullet": "round",
                        "bulletBorderAlpha": 1,
                        "bulletBorderColor": "#FFFFFF",
                        "hideBulletsCount": 50,
                        "lineThickness": 2,
                        "lineColor": "#fdd400",
                        "negativeLineColor": "#67b7dc",
                        "valueField": "value"
                    }],
                    "chartScrollbar": {
                        "scrollbarHeight": 5,
                        "backgroundAlpha": 0.1,
                        "backgroundColor": "#868686",
                        "selectedBackgroundColor": "#67b7dc",
                        "selectedBackgroundAlpha": 1
                    },
                    "chartCursor": {
                        "valueLineEnabled": true,
                        "valueLineBalloonEnabled": true
                    },
                    "categoryField": "date",
                    "categoryAxis": {
                        "parseDates": true,
                        "axisAlpha": 0,
                        "minHorizontalGap": 60
                    },
                    "export": {
                        "enabled": true
                    }
                });

                chart.addListener("dataUpdated", zoomChart);
                //zoomChart();

                function zoomChart() {
                    if (chart.zoomToIndexes) {
                        chart.zoomToIndexes(130, chartData.length - 1);
                    }
                }
            </script>
            <br />
            <div class="row">
                <div class="card col-12">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i>&nbsp;Inventory Stock Analyst
                    </div>
                    <div class="card-body">
                        <div id="chartdiv"></div>
                    </div>
                </div>
            </div>
            <br />
            <!-- END of graph -->
            <!-- flow of bidding price -->
            <!-- Chart code -->
            <script>
                var chart = AmCharts.makeChart("flowOfPriceChart", {
                    "type": "serial",
                    "theme": "light",
                    "marginTop": 0,
                    "marginRight": 80,
                    "dataProvider": [<%= flowOfPriceChartData %>],
                    "valueAxes": [{
                        "axisAlpha": 0,
                        "position": "left"
                    }],
                    "graphs": [{
                        "id": "g1",
                        "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
                        "bullet": "round",
                        "bulletSize": 8,
                        "lineColor": "#d1655d",
                        "lineThickness": 2,
                        "negativeLineColor": "#637bb6",
                        "type": "smoothedLine",
                        "valueField": "value"
                    }],
                    "chartScrollbar": {
                        "graph": "g1",
                        "gridAlpha": 0,
                        "color": "#888888",
                        "scrollbarHeight": 55,
                        "backgroundAlpha": 0,
                        "selectedBackgroundAlpha": 0.1,
                        "selectedBackgroundColor": "#888888",
                        "graphFillAlpha": 0,
                        "autoGridCount": true,
                        "selectedGraphFillAlpha": 0,
                        "graphLineAlpha": 0.2,
                        "graphLineColor": "#c2c2c2",
                        "selectedGraphLineColor": "#888888",
                        "selectedGraphLineAlpha": 1

                    },
                    "chartCursor": {
                        "categoryBalloonDateFormat": "YYYY",
                        "cursorAlpha": 0,
                        "valueLineEnabled": true,
                        "valueLineBalloonEnabled": true,
                        "valueLineAlpha": 0.5,
                        "fullWidth": true
                    },
                    "categoryField": "date",
                    "categoryAxis": {
                        "minPeriod": "MM YYYY",
                        "minorGridAlpha": 0.1,
                        "minorGridEnabled": true
                    },
                    "export": {
                        "enabled": true
                    }
                });

                chart.addListener("rendered", zoomChart);
                if (chart.zoomChart) {
                    chart.zoomChart();
                }

                function zoomChart() {
                    chart.zoomToIndexes(Math.round(chart.dataProvider.length * 0.4), Math.round(chart.dataProvider.length * 0.55));
                }
            </script>
            <div class="row">
                <div class="card col-12">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i>&nbsp;Flow Of Bidding Price
                    </div>
                    <div class="card-body">
                        <div id="flowOfPriceChart"></div>
                    </div>
                </div>
            </div>
            <br />
            <!-- END of graph -->
            <!-- monthly stock order -->
            <!-- Chart code -->
            <script>
                var chart = AmCharts.makeChart("monthlyOrderChart", {
                    "type": "serial",
                    "theme": "light",
                    "dataProvider": [<%= monthlyOrderChartData %>],
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
            <div class="row">
                <div class="card col-12">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i>&nbsp;Monthly Stock Order
                    </div>
                    <div class="card-body">
                        <div id="monthlyOrderChart"></div>
                    </div>
                </div>
            </div>
            <br />
            <!-- END of chart -->

            <!-- sold by company-->
            <!-- Chart code -->
            <script>
                //this is for monthly order chart
                var chartPie = AmCharts.makeChart("soldByCompanyChart", {
                    "type": "pie",
                    "theme": "light",
                    "dataProvider": [<%= soldByCompanyChartData %>],
                    "valueField": "value",
                    "titleField": "name",
                    "balloon": {
                        "fixedPosition": true
                    },
                    "export": {
                        "enabled": true
                    }
                });

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
            <div class="row">
                <div class="card col-6">
                    <div class="card-header">
                        <i class="fa fa-pie-chart"></i>&nbsp;Sold By Company
                    </div>
                    <div class="card-body">
                        <div id="soldByCompanyChart"></div>
                    </div>
                </div>
                <div class="card col-6">
                    <div class="card-header">
                        <i class="fa fa-pie-chart"></i>&nbsp;Used By Food
                    </div>
                    <div class="card-body">
                        <div id="usedByFoodChart"></div>
                    </div>
                </div>
            </div>
            <br />
            <!-- END of chart -->
            <div class="form-row">
                <div class="col-md-3 offset-9">
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary btn-block" formnovalidate OnClick="btnBack_Click" />
                </div>
            </div>
            <br />
        </form>
    </div>
</asp:Content>
