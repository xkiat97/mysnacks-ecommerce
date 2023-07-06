<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="ReportCustomization.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.ReportCustomization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Report customization
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Report customization</h2>
    <hr />
    <div class="row">
        <div class="col-lg-10 offset-1">
            <h5>Select the type of report you want to generate:</h5>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-lg-8 offset-2">
            <a href="DetailReport.aspx" class="btn btn-block btn-outline-success">Detail Report</a>
            <br />
            <a href="SummaryReport.aspx" class="btn btn-block btn-outline-success">Summary Report</a>
            <br />
            <a href="ForecastingReport.aspx" class="btn btn-block btn-outline-success">Forecasting Report</a>
            <br />
        </div>
    </div>
</asp:Content>
