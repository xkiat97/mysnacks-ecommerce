<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="DetailReport.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.DetailReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Detail Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Detail Report</h2>
    <hr />
    <form class="row col-lg-12" runat="server">
        <a class="btn btn-default pull-right" href="ReportCustomization.aspx"><i class="fa fa-arrow-circle-o-left" style="font-size: 30px"></i></a>
    </form>
    <div class="row">
        <div class="col-lg-10 offset-1">
            <h5>Detail report title:</h5>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-lg-8 offset-2">
            <a href="ReportSB.aspx" class="btn btn-block btn-outline-success">Snacks balance report</a>
            <br />
        </div>
    </div>
</asp:Content>