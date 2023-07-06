<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="IngredientDetail.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.IngredientDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn-file {
            position: relative;
            overflow: hidden;
        }

        .btn-file input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }

        .img-upload {
            width: 100%;
            height: 400px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $(document).on('change', '.btn-file :file', function () {
                var input = $(this),
                    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                input.trigger('fileselect', [label]);
            });

            $('.btn-file :file').on('fileselect', function (event, label) {

                var input = $(this).parents('.input-group').find(':text'),
                    log = label;

                if (input.length) {
                    input.val(log);
                } else {
                    if (log) alert(log);
                }

            });
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('.img-upload').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }

            $(".imgInp").change(function () {
                readURL(this);
            });
        });

        function validate(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
            var regex = /[0-9]/;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault) theEvent.preventDefault();
            }
        }

        function numericOnly(elementRef) {
            var keyCodeEntered = (event.which) ? event.which : (window.event.keyCode) ? window.event.keyCode : -1;

            // Un-comment to discover a key that I have forgotten to take into account...
            //alert(keyCodeEntered);

            if ((keyCodeEntered >= 48) && (keyCodeEntered <= 57)) {
                return true;
            }
            // '+' sign...
            else if (keyCodeEntered == 43) {
                // Allow only 1 plus sign ('+')...
                if ((elementRef.value) && (elementRef.value.indexOf('+') >= 0))
                    return false;
                else
                    return true;
            }
            // '-' sign...
            else if (keyCodeEntered == 45) {
                // Allow only 1 minus sign ('-')...
                if ((elementRef.value) && (elementRef.value.indexOf('-') >= 0))
                    return false;
                else
                    return true;
            }
            // '.' decimal point...
            else if (keyCodeEntered == 46) {
                // Allow only 1 decimal point ('.')...
                if ((elementRef.value) && (elementRef.value.indexOf('.') >= 0))
                    return false;
                else
                    return true;
            }

            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Ingredient details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:LinqDataSource runat="server" ID="dsCategory" ContextTypeName="HawkerFood.linqHawkerFoodDataContext" EntityTypeName="" TableName="Categories" Where="status=='T'"></asp:LinqDataSource>
    <h2>Ingredient details</h2>
    <hr />
    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
    <div class="container">
        <form id="form1" runat="server" class="col-md-10">
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
            <div class="row">
                <div class="col-lg-6">
                    <img id='imgupload' class="img-upload" src="../Images/System/uploadImg.jpg" runat="server" />
                </div>
                <div class="col-lg-6">
                    <div class="row">
                        <label>Choose your ingredient image</label>
                        <div class="input-group">
                            <span class="input-group-btn">
                                <span class="btn btn-info btn-file">Browse…
                                <asp:FileUpload ID="imgInp" CssClass="imgInp" runat="server" />
                                    <%--<input type="file" id="imgInp" class="imgInp" runat="server">--%>
                                </span>
                            </span>
                            <input type="text" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <label>Ingredient name*</label>
                        <input class="form-control" id="txtFoodName" type="text" maxlength="50" placeholder="Enter ingredient name" required runat="server">
                        <asp:Label ID="errname" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="row">
                        <label>Quantity*</label>
                        <input class="form-control" id="txtQuantity" type="text" maxlength="9" placeholder="Enter quantity" required runat="server">
                        <asp:RegularExpressionValidator ID="revQuantity" runat="server" ErrorMessage="Value must be integer or 2 decimal."
                            ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" ControlToValidate="txtQuantity" Display="Dynamic"
                            CssClass="alert alert-danger col-md-12"></asp:RegularExpressionValidator>
                    </div>
                    <div class="row">
                        <label>Quantity Unit*</label>
                        <select class="form-control" id="selbtTyp" runat="server">
                            <option>Pcs</option>
                            <option>Pkt</option>
                            <option>Gram(G)</option>
                        </select>
                    </div>
                    <div class="row">
                        <label>Market Price (RM)*</label>
                        <input class="form-control" id="txtMPrice" type="text" maxlength="9" placeholder="Enter price" required runat="server">
                        <asp:RegularExpressionValidator ID="revMPrice" runat="server" ErrorMessage="Value must be integer or 2 decimal."
                            ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" ControlToValidate="txtMPrice" Display="Dynamic"
                            CssClass="alert alert-danger col-md-12"></asp:RegularExpressionValidator>
                    </div>
                    <div class="row">
                        <label>Description</label>
                        <textarea class="form-control" id="txtDesc" cols="20" rows="3" maxlength="1000" placeholder="Enter description" spellcheck runat="server"></textarea>
                    </div>
                </div>
            </div>
            <br />
            <div class="form-row">
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary btn-block" formnovalidate OnClick="btnBack_Click" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnModify" runat="server" Text="Modify" CssClass="btn btn-primary btn-block" OnClick="btnModify_Click" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnLinkFood" runat="server" Text="Food linking" CssClass="btn btn-outline-info btn-block" OnClick="btnLinkFood_Click" />
                </div>
                <%--<div class="col-md-2">
                    <asp:Button ID="btnAst" runat="server" Text="Analyst" CssClass="btn btn-outline-info btn-block" OnClick="btnAst_Click" />
                </div>--%>
                <div class="col-md-2">
                    <asp:Button ID="btnBan" runat="server" Text="" CssClass="btn btn-outline-danger btn-block" OnClick="btnBan_Click" />
                </div>
            </div>
        </form>
    </div>
</asp:Content>
