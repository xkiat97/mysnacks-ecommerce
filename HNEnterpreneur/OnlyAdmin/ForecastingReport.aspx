<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="ForecastingReport.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.ForecastingReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Forecasting Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Forecasting Report</h2>
    <hr />
    <form class="row col-lg-12" runat="server">
        <a class="btn btn-default pull-right" href="ReportCustomization.aspx"><i class="fa fa-arrow-circle-o-left" style="font-size: 30px"></i></a>
    </form>
    <div class="row">
        <div class="col-lg-10 offset-1">
            <h5>Forecasting report title:</h5>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-lg-8 offset-2">
            <a href="ReportIRF.aspx" class="btn btn-block btn-outline-success">Inventory Refill Forecasting</a>
            <br />
        </div>
    </div>
</asp:Content>