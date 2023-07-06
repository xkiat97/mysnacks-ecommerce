<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAddCategory.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.AdminAddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Category Register
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Add a new category</h2>
    <hr />
    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
    <div class="container">
        <form id="form1" runat="server" class="col-md-10">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <label>Category name*</label>
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
                <div class="col-md-6"></div>
                <div class="col-md-3">
                <asp:button ID="Button1" runat="server" text="Back" cssclass="btn btn-primary btn-block"  OnClientClick="JavaScript:window.history.back(1); return false;" formnovalidate />
                </div>

                <div class="col-md-3">
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary btn-block" OnClick="btnRegister_Click" />
                </ div>
            </div>
            
            <br />
        </form>
    </div>
</asp:Content>