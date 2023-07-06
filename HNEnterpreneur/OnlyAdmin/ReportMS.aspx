<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="ReportMS.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.ReportMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Styles -->
    <style>
        #chartdiv {
            width: 100%;
            height: 500px;
        }
    </style>

    <!-- Resources -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/amstock.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

    <!-- Chart code -->
    <script>
        var chartData1 = [<%= year1 %>];
        var chartData2 = [<%= year2 %>];
        var chartData3 = [<%= year3 %>];
        var today = new Date();
        y1 = today.getFullYear() - 1 ;
        y2 = today.getFullYear() - 2;
        y3 = today.getFullYear() - 3;

        var chart = AmCharts.makeChart("chartdiv", {
            "type": "stock",
            "theme": "light",
            "titles": [{
                "text": "H&N Enterprise"
            }, {
                "text": "Yearly Sales Report \nDate Created : " + today.toLocaleDateString(),
                "bold": false
            }],
            "dataSets": [{
                "title": "YEAR " + y1,
                "fieldMappings": [{
                    "fromField": "value",
                    "toField": "value"
                }, {
                    "fromField": "volume",
                    "toField": "volume"
                }],
                "dataProvider": chartData1,
                "categoryField": "date"
            }, {
                "title": "YEAR " + y2,
                "fieldMappings": [{
                    "fromField": "value",
                    "toField": "value"
                }, {
                    "fromField": "volume",
                    "toField": "volume"
                }],
                "dataProvider": chartData2,
                "categoryField": "date"
                }, {
                    "title": "YEAR " + y3,
                "fieldMappings": [{
                    "fromField": "value",
                    "toField": "value"
                }, {
                    "fromField": "volume",
                    "toField": "volume"
                }],
                "dataProvider": chartData3,
                "categoryField": "date"
            }
            ],

            "panels": [{
                "showCategoryAxis": false,
                "title": "Value",
                "percentHeight": 70,
                "stockGraphs": [{
                    "id": "g1",
                    "valueField": "value",
                    "comparable": true,
                    "compareField": "value",
                    "balloonText": "[[title]]:<b>[[value]]</b>",
                    "compareGraphBalloonText": "[[title]]:<b>[[value]]</b>"
                }],
                "stockLegend": {
                    "periodValueTextComparing": "[[percents.value.close]]%",
                    "periodValueTextRegular": "[[value.close]]"
                }
            }, {
                "title": "Volume",
                "percentHeight": 30,
                "stockGraphs": [{
                    "valueField": "volume",
                    "type": "column",
                    "showBalloon": false,
                    "fillAlphas": 1
                }],
                "stockLegend": {
                    "periodValueTextRegular": "[[value.close]]"
                }
            }],

            "chartScrollbarSettings": {
                "graph": "g1"
            },

            "chartCursorSettings": {
                "valueBalloonsEnabled": true,
                "fullWidth": true,
                "cursorAlpha": 0.1,
                "valueLineBalloonEnabled": true,
                "valueLineEnabled": true,
                "valueLineAlpha": 0.5
            },

            "periodSelector": {
                "position": "left",
                "periods": [{
                    "period": "MM",
                    "selected": true,
                    "count": 1,
                    "label": "1 month"
                }, {
                    "period": "YYYY",
                    "count": 1,
                    "label": "1 year"
                }, {
                    "period": "YTD",
                    "label": "YTD"
                }, {
                    "period": "MAX",
                    "label": "MAX"
                }]
            },

            "dataSetSelector": {
                "position": "left"
            },

            "export": {
                "enabled": true
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Yearly Sales Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form class="row col-lg-12" runat="server">
        <a class="btn btn-default pull-right" href="SummaryReport.aspx"><i class="fa fa-arrow-circle-o-left" style="font-size: 30px"></i></a>
    </form>
    <div class="row">
        <div class="col-lg-3">
            <img src="../Images/System/logo.png" style="width: 150px; height: 90px;" />
        </div>
        <div class="col-lg-6" style="text-align:center;">
            <h5>Yearly Sales Report AS OF <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h5>
        </div>
        <div class="col-lg-3" style="text-align:right;">
            <sm>DATE CREATE: <br /><i><asp:Label ID="lblDateCreated" runat="server" Text=""></asp:Label></i></sm>
        </div>
    </div>
    <hr />
    <div id="chartdiv"></div>
</asp:Content>
