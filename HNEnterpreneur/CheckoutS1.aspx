<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CheckoutS1.aspx.cs" Inherits="HNEnterpreneur.CheckoutS1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Checkout Step 1
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="css/Checkout.css" rel="stylesheet" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Home.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li><a href="Products.aspx">Products</a></li>
                <li class="active">Order Process</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="container">
        <div class="row smpl-step" style="border-bottom: 0; min-width: 500px;">
            <div class="col-xs-4 smpl-step-step complete">
                <div class="text-center smpl-step-num">Delivery Address</div>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
                <a class="smpl-step-icon"><i class="fa fa-user" style="font-size: 60px; padding-left: 12px; padding-top: 3px; color: black;"></i></a>
            </div>

            <div class="col-xs-4 smpl-step-step">
                <div class="text-center smpl-step-num">Payment</div>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
                <a class="smpl-step-icon"><i class="fa fa-dollar" style="font-size: 60px; padding-left: 18px; padding-top: 5px; color: black;"></i></a>
            </div>
            <div class="col-xs-4 smpl-step-step">
                <div class="text-center smpl-step-num">Completed</div>
                <div class="progress">
                    <div class="progress-bar"></div>
                </div>
                <a class="smpl-step-icon"><i class="fa fa-repeat" style="font-size: 60px; padding-left: 7px; padding-top: 7px; color: black;"></i></a>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <form class="form-horizontal" role="form" runat="server">
                    <fieldset>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="txtName">Receiver's name</label>
                            <div class="col-sm-9">
                                <input id="txtName" class="form-control" runat="server" type="text" placeholder="Enter the receiver's name" maxlength="50" required autofocus>
                            </div>
                            <div class="form-row">
                                <asp:RegularExpressionValidator ID="regName" runat="server"
                                    ErrorMessage="[Name] must be alphabel and space" Display="Dynamic" CssClass="alert alert-danger col-sm-9 col-sm-offset-3"
                                    ValidationExpression="^[a-zA-Z]+(([ ][a-zA-Z ])?[a-zA-Z]*)*$" ControlToValidate="txtName">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="txtPhone">Contact Number</label>
                            <div class="col-sm-9">
                                <div class="col-sm-4">
                                    <select id="txtphone1" class="form-control" runat="server">
                                        <option value="+6010">+6 010 - </option>
                                        <option value="+6011">+6 011 - </option>
                                        <option value="+6012">+6 012 - </option>
                                        <option value="+6013">+6 013 - </option>
                                        <option value="+6014">+6 014 - </option>
                                        <option value="+6015">+6 015 - </option>
                                        <option value="+6016">+6 016 - </option>
                                        <option value="+6017">+6 017 - </option>
                                        <option value="+6018">+6 018 - </option>
                                        <option value="+6019">+6 019 - </option>
                                    </select>
                                </div>
                                <div class="col-sm-8">
                                    <input type="text" id="txtphone2" class="form-control" placeholder="Enter phone number" maxlength="8" runat="server">
                                </div>
                            </div>
                            <div class="form-row">
                                <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="[Phone] must be integer."
                                    ValidationExpression="\d+" ControlToValidate="txtphone2" Display="Dynamic" CssClass="alert alert-danger col-sm-9 col-sm-offset-3">
                                </asp:RegularExpressionValidator>
                                <asp:Label ID="lblPhoneErr" runat="server" Text="[Phone] must consist of 7 or 8 digits" CssClass="alert alert-danger col-sm-9 col-sm-offset-3" Visible="False"></asp:Label>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="txtLine1">Line 1</label>
                            <div class="col-sm-10">
                                <input id="txtLine1" runat="server" type="text" placeholder="Address Line 1" class="form-control ownL1" maxlength="100" required>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="txtLine2">Line 2</label>
                            <div class="col-sm-10">
                                <input id="txtLine2" runat="server" type="text" placeholder="Address Line 2" class="form-control ownL2" maxlength="100" required>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="txtCity">City</label>
                            <div class="col-sm-10">
                                <input id="txtCity" class="ownCity form-control" runat="server" type="text" placeholder="City" maxlength="50" required>
                            </div>
                            <div class="form-row">
                                <asp:RegularExpressionValidator ID="revCity" runat="server"
                                    ErrorMessage="[City] must be alphabel and space" Display="Dynamic" CssClass="alert alert-danger col-sm-10 col-sm-offset-2"
                                    ValidationExpression="^[a-zA-Z]+(([ ][a-zA-Z ])?[a-zA-Z]*)*$" ControlToValidate="txtCity">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="txtState">State</label>
                            <div class="col-sm-4">
                                <input id="txtState" class="ownState form-control" runat="server" type="text" placeholder="State" maxlength="50" required>
                            </div>

                            <label class="col-sm-2 control-label" for="txtPostcode">Postcode</label>
                            <div class="col-sm-4">
                                <input id="txtPostcode" runat="server" type="text" placeholder="Post Code" class="form-control ownPostcode" maxlength="10" required>
                            </div>
                            <div class="form-row">
                                <asp:RegularExpressionValidator ID="revState" runat="server"
                                    ErrorMessage="[State] must be alphabel and space" Display="Dynamic" CssClass="alert alert-danger col-sm-4 col-sm-offset-2"
                                    ValidationExpression="^[a-zA-Z]+(([ ][a-zA-Z ])?[a-zA-Z]*)*$" ControlToValidate="txtState">
                                </asp:RegularExpressionValidator>

                                <asp:RegularExpressionValidator ID="revPostcode" runat="server" ErrorMessage="[Postcode] must be integer."
                                    ValidationExpression="\d+" ControlToValidate="txtPostcode" Display="Dynamic" CssClass="alert alert-danger col-sm-4 col-sm-offset-2">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="txtCountry">Country</label>
                            <div class="col-sm-10">
                                <input id="txtCountry" class="ownCountry form-control" runat="server" type="text" placeholder="Country" maxlength="50" required>
                            </div>
                            <div class="form-row">
                                <asp:RegularExpressionValidator ID="revCountry" runat="server"
                                    ErrorMessage="[Country] must be alphabel and space" Display="Dynamic" CssClass="alert alert-danger col-sm-10 col-sm-offset-2"
                                    ValidationExpression="^[a-zA-Z]+(([ ][a-zA-Z ])?[a-zA-Z]*)*$" ControlToValidate="txtCountry">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="pull-left">
                                    <button type="button" class="btn btn-info btnLocation"><i class="fa fa-crosshairs"></i>&nbsp;My Location</button>
                                </div>
                                <div class="pull-right">
                                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-default" CausesValidation="False" OnClick="btnBack_Click" UseSubmitBehavior="False" />
                                    <asp:Button ID="btnNext" runat="server" Text="Payment" CssClass="btn btn-primary" OnClick="btnNext_Click" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript" charset="utf-8">
        $(".btnLocation").click(function () {
            getDefAdd();
        });

        function getDefAdd() {
            var currgeocoder;

            //Set geo location lat and long

            navigator.geolocation.getCurrentPosition(function (position, html5Error) {

                geo_loc = processGeolocationResult(position);
                currLatLong = geo_loc.split(",");
                initializeCurrent(currLatLong[0], currLatLong[1]);

            });

            //Get geo location result

            function processGeolocationResult(position) {
                html5Lat = position.coords.latitude; //Get latitude
                html5Lon = position.coords.longitude; //Get longitude
                html5TimeStamp = position.timestamp; //Get timestamp
                html5Accuracy = position.coords.accuracy; //Get accuracy in meters
                return (html5Lat).toFixed(8) + ", " + (html5Lon).toFixed(8);
            }

            //Check value is present or not & call google api function

            function initializeCurrent(latcurr, longcurr) {
                currgeocoder = new google.maps.Geocoder();
                console.log(latcurr + "-- ######## --" + longcurr);

                if (latcurr != '' && longcurr != '') {
                    var myLatlng = new google.maps.LatLng(latcurr, longcurr);
                    return getCurrentAddress(myLatlng);
                }
            }

            //Get current address

            function getCurrentAddress(location) {
                currgeocoder.geocode({
                    'location': location

                }, function (results, status) {

                    if (status == google.maps.GeocoderStatus.OK) {
                        $(".ownL1").val(results[0].address_components[0].long_name + ", " + results[0].address_components[1].long_name);
                        $(".ownL2").val(results[0].address_components[2].long_name);
                        $(".ownCity").val(results[0].address_components[3].long_name);
                        $(".ownPostcode").val(results[0].address_components[6].long_name);
                        $(".ownState").val(results[0].address_components[4].long_name);
                        $(".ownCountry").val(results[0].address_components[5].long_name);
                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                    }
                });
            }
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbi_YnG0TT_9rn_74DIzmuSdW1CDb0q2Y&libraries=places&callback=initAutocomplete"
        async defer></script>
</asp:Content>
