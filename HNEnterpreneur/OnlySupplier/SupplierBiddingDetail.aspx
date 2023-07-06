<%@ Page Title="" Language="C#" MasterPageFile="~/OnlySupplier/Supplier.Master" AutoEventWireup="true" CodeBehind="SupplierBiddingDetail.aspx.cs" Inherits="HNEnterpreneur.OnlySupplier.SupplierBiddingDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Bidding details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Bidding details</h2>
    <hr />
    <div class="container">
        <form id="form1" runat="server" class="col-md-10">
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-3">
                        <label for="lblBidId">Bidding ID :</label>
                        <asp:Label ID="lblBidId" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                        <label for="lblBidStatus">Status :</label>
                        <asp:Label ID="lblBidStatus" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5">
                    <div class="card">
                        <img class="card-img-top" src="../Images/IngredientImg/noImg.jpg" id="imgIngImg" runat="server" height="300">
                        <div class="card-body">
                            <h4 class="card-title">
                                <asp:Label ID="lblIngName" runat="server" Text=""></asp:Label>
                                ( 
                                <asp:Label ID="lblIngId" runat="server" Text=""></asp:Label>
                                ) 
                            </h4>
                            <p class="card-text">
                                <asp:Label ID="lblDesc" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <h4>Bidding Details</h4>
                    <hr />
                    <div class="form-group">
                        <div class="form-group row">
                            <strong class="col-5">End Date&Time</strong>
                            <div class="col-7">
                                : <asp:Label ID="lblEndDate" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <strong class="col-5">Delivery Date</strong>
                            <div class="col-7">
                                : <asp:Label ID="lblDeliveryDate" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <strong class="col-5">Description</strong>
                            <div class="col-7">
                                : <asp:Label ID="lblBDesc" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <strong class="col-5">Lowest Price (RM)</strong>
                            <div class="col-7">
                                : <asp:Label ID="lblLowPrice" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <strong class="col-5">Quantity Needed</strong>
                            <div class="col-7">
                                : <asp:Label ID="lblQty" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <br />
                        <h4>Quotation Information</h4>
                        <hr />
                        <!-- bidder price-->
                        <input id="txtQuoId" type="hidden" runat="server" />
                        <div class="form-group row">
                            <label for="txtBidPrice" class="col-5 col-form-label"><strong>Bidding Price (RM)* </strong></label>
                            <div class="col-7">
                                <input class="form-control" type="text" id="txtBidPrice" placeholder="Enter bidding price" required autofocus runat="server">
                            </div>
                            <asp:RegularExpressionValidator ID="revBidPrice" runat="server" ErrorMessage="Value must be integer or 2 decimal."
                                ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" ControlToValidate="txtBidPrice" Display="Dynamic"
                                CssClass="alert alert-danger col-12"></asp:RegularExpressionValidator>
                            <asp:RangeValidator ID="rvBidPrice" runat="server" ErrorMessage="" Display="Dynamic" ControlToValidate="txtBidPrice" CssClass="alert alert-danger col-12"></asp:RangeValidator>
                        </div>

                        <div class="form-group row">
                            <label for="txtDesc" class="col-5 col-form-label"><strong>Remark</strong></label>
                            <div class="col-7">
                                <textarea class="form-control" id="txtDesc" cols="20" rows="3" maxlength="1000" placeholder="Enter description" spellcheck runat="server"></textarea>
                            </div>
                        </div>
                        <!-- -->
                        <div class="form-row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary btn-block" OnClientClick="JavaScript:window.history.back(1); return false;" formnovalidate />
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="btnModify" runat="server" Text="Modify" CssClass="btn btn-primary btn-block" OnClick="btnModify_Click" />
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="btnBan" runat="server" Text="Abandon" CssClass="btn btn-outline-danger btn-block" OnClick="btnBan_Click" CausesValidation="False" />
                            </div>
                        </div>
                        <br />
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>

