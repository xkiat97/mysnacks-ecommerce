<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="IngredientBid.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.IngredientBid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../vendor/moment.js"></script>
    <link href="../css/tempusdominus-bootstrap-4.css" rel="stylesheet" />
    <script src="../js/tempusdominus-bootstrap-4.js.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Set up bidding
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h2>Add to bidding</h2>
    <hr />
    <div class="container">
        <form id="form1" runat="server" class="col-md-10">
            <div class="row">
                <div class="col-lg-5">
                    <div class="card">
                        <img class="card-img-top" src="../Images/IngredientImg/noImg.jpg" id="imgIngImg" runat="server" height="200">
                        <div class="card-body">
                            <h4 class="card-title">
                                <asp:Label ID="lblIngName" runat="server" Text=""></asp:Label>
                                ( 
                                <asp:Label ID="lblIngId" runat="server" Text=""></asp:Label>
                                ) 
                            </h4>
                            <p class="card-text">
                                <strong>Balance quantity : </strong>
                                <asp:Label ID="lblBalance" runat="server" Text=""></asp:Label>
                            </p>
                            <p class="card-text">
                                <strong>Market Price (RM) : </strong>
                                <asp:Label ID="lblmPrice" runat="server" Text=""></asp:Label>
                            </p>
                            <p class="card-text">
                                <strong>Description : </strong>
                                <asp:Label ID="lblDesc" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <h4>Bidding Details</h4>
                    <div class="form-group">
                        <div class="form-group row">
                            <label for="txtMaxPrice" class="col-4 col-form-label">Max price (RM)* </label>
                            <div class="col-8">
                                <input class="form-control" type="text" id="txtMaxPrice" placeholder="Enter maximum price" required runat="server">
                                <asp:RegularExpressionValidator ID="revMaxPrice" runat="server" ErrorMessage="Value must be integer or 2 decimal."
                                    ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" ControlToValidate="txtMaxPrice" Display="Dynamic"
                                    CssClass="alert alert-danger col-md-12"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="txtQuantity" class="col-4 col-form-label">Quantity*</label>
                            <div class="col-8">
                                <input class="form-control" id="txtQuantity" type="text" placeholder="Enter quantity" required runat="server" onkeypress="validate(event)">
                                <asp:RegularExpressionValidator ID="revQuantity" runat="server" ErrorMessage="Value must be integer or 2 decimal."
                                    ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" ControlToValidate="txtQuantity" Display="Dynamic"
                                    CssClass="alert alert-danger col-md-12"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="txtDateTime" class="col-4 col-form-label">End Date & Time* </label>
                            <div class="col-8">
                                <div class="input-group date" id="datetimepicker10" data-target-input="nearest">
                                    <input id="txtDateTime" type="text" placeholder="Enter date and time" class="form-control datetimepicker-input" data-target="#datetimepicker10" required runat="server" />
                                    <div class="input-group-append" data-target="#datetimepicker10" data-toggle="datetimepicker">
                                        <div class="input-group-text">&nbsp;&nbsp;&nbsp;<i style="vertical-align: bottom;" class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="selUrgency" class="col-4 col-form-label">Urgency*</label>
                            <div class="col-8">
                                <select class="form-control" id="selUrgency" runat="server">
                                    <option value="Low">Low (Deliver after 30 Days)</option>
                                    <option value="Medium">Medium (Deliver after 14 Days)</option>
                                    <option value="High">High (Deliver after 3 Days)</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="txtDesc" class="col-4 col-form-label">Remark</label>
                            <div class="col-8">
                                <textarea class="form-control" id="txtDesc" cols="20" rows="3" maxlength="1000" placeholder="Enter description" spellcheck runat="server"></textarea>
                            </div>
                        </div>

                        <br />
                        <div class="form-row">
                            <div class="col-md-6"></div>
                            <div class="col-md-3">
                                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary btn-block" OnClientClick="JavaScript:window.history.back(1); return false;" formnovalidate />
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="btnSubmit" runat="server" Text="Comfirm" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                        <br />

                    </div>
                </div>
            </div>
        </form>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#datetimepicker10').datetimepicker({
                viewMode: 'years'
            });
        });
    </script>
</asp:Content>
