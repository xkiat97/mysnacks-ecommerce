<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCateDetail.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.AdminCateDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Category Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Category Details</h2>
    <hr />
    <div class="container">
        <form id="form1" runat="server" class="col-md-10">
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-2">
                        <label for="lblCateID">Category ID :</label>
                        <asp:Label ID="lblCateID" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <label for="hlUserDetail">Register By : </label>
                        <asp:HyperLink ID="hlUserDetail" runat="server"></asp:HyperLink>
                    </div>
                    <div class="col-md-4">
                        <label for="lblModTim">Last Edit : </label>
                        <asp:Label ID="lblModTim" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <label for="lblSts">Status :</label>
                        <asp:Label ID="lblSts" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <label>Food name*</label>
                        <input class="form-control" id="txtCateName" type="text" placeholder="Enter food name" required runat="server">
                        <asp:Label ID="errname" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="row">
                        <label>Description</label>
                        <textarea class="form-control" id="txtDesc" cols="20" rows="3" maxlength="1000" placeholder="Enter description" spellcheck runat="server"></textarea>
                    </div>
                </div>
            </div>
            <br />
            <div class="form-row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <asp:button ID="btnBack" runat="server" text="Back" cssclass="btn btn-primary btn-block" formnovalidate OnClick="btnBack_Click" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnModify" runat="server" Text="Modify" CssClass="btn btn-primary btn-block" OnClick="btnModify_Click" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnBan" runat="server" Text="Ban Food" CssClass="btn btn-outline-danger btn-block" OnClick="btnBan_Click" />
                </div>
            </div>
        </form>
    </div>
</asp:Content>