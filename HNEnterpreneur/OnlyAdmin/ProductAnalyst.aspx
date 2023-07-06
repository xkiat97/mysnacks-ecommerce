<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductAnalyst.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.ProductAnalyst" %>

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
        #AGorderdemand, #PCIng, #PCIngPrice, #PCHotSalesArea, #profits {
            width: 100%;
            height: 250px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Food analyst
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <script>
                var chart = AmCharts.makeChart("AGorderdemand", {
                    "type": "serial",
                    "theme": "light",
                    "marginTop": 0,
                    "marginRight": 80,
                    "dataProvider": [<%= AGorderdemandDATA %>],
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
            <div class="card-header">
                <i class="fa fa-area-chart"></i>&nbsp;Snacks order demand
            </div>
            <div class="card-body">
                <div id="AGorderdemand"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <!-- Chart code -->
            <script>
                //snack ingredient components
                var chartPie = AmCharts.makeChart("PCIng", {
                    "type": "pie",
                    "theme": "light",
                    "dataProvider": [<%= PCIngDATA %>],
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
                <i class="fa fa-pie-chart"></i>&nbsp;Snack ingredients
            </div>
            <div class="card-body">
                <div id="PCIng"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <!-- Chart code -->
            <script>
                //snack ingredient value
                var chartPie = AmCharts.makeChart("PCIngPrice", {
                    "type": "pie",
                    "theme": "light",
                    "dataProvider": [<%= PCIngPriceDATA %>],
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
                <i class="fa fa-pie-chart"></i>&nbsp;Snack ingredients price
            </div>
            <div class="card-body">
                <div id="PCIngPrice"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <!-- Chart code -->
            <script>
                //snack hot selling area
                var chartPie = AmCharts.makeChart("PCHotSalesArea", {
                    "type": "pie",
                    "theme": "light",
                    "dataProvider": [<%= PCHotSalesAreaDATA %>],
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
                <i class="fa fa-pie-chart"></i>&nbsp;Hot selling areas
            </div>
            <div class="card-body">
                <div id="PCHotSalesArea"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card-header">
                <i class="fa fa-table"></i>&nbsp;Snack current profits
            </div>
            <div class="card-body">
                <div id="profits">
                    <div class="row">
                        <h4 class="col-sm-6 offset-1"><strong>Selling Price </strong></h4>
                        <h5 class="col-sm-5">: RM 
                            <asp:Label ID="lblSPrice" runat="server" Text=""></asp:Label>
                        </h5>
                    </div>
                    <div class="row">
                        <h4 class="col-sm-6 offset-1"><strong>Produced costs </strong></h4>
                        <h5 class="col-sm-5">: RM 
                            <asp:Label ID="lblPCost" runat="server" Text=""></asp:Label>
                        </h5>
                    </div>
                    <hr />
                    <div class="row alert alert-success">
                        <h4 class="col-sm-6 offset-1"><strong>Profits earned </strong></h4>
                        <h5 class="col-sm-5">: RM 
                            <asp:Label ID="lblPEarn" runat="server" Text=""></asp:Label>
                        </h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
