<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProfileDeliveryAddress.aspx.cs" Inherits="HNEnterpreneur.ProfileDeliveryAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        @media (min-width: 768px) {

            .brand-pills > li > a {
                border-top-right-radius: 0px;
                border-bottom-right-radius: 0px;
            }

            li.brand-nav.active a:after {
                content: " ";
                display: block;
                width: 0;
                height: 0;
                border-top: 20px solid transparent;
                border-bottom: 20px solid transparent;
                border-left: 9px solid #428bca;
                position: absolute;
                top: 50%;
                margin-top: -20px;
                left: 100%;
                z-index: 2;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Home.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Profile</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="container">
        <div class="row">
            <br />
            <hr />
            <div role="tabpanel">
                <div class="col-sm-3">
                    <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                        <li class="brand-nav"><a href="ProfileMyOrders.aspx"><i class="fa fa-book"></i>&nbsp;My Orders</a></li>
                        <li class="brand-nav"><a href="ProfileMemberPoint.aspx"><i class="fa fa-user-circle-o"></i>&nbsp;Member Point</a></li>
                        <li class="brand-nav active"><a href="ProfileDeliveryAddress.aspx"><i class="fa fa-address-card-o"></i>&nbsp;Delivery address</a></li>
                        <li class="brand-nav"><a href="ProfileChangePassword.aspx"><i class="fa fa-lock"></i>&nbsp;Change password</a></li>
                        <li class="brand-nav"><a href="ProfileReports.aspx"><i class="fa fa-bar-chart-o"></i>&nbsp;Reports&Analyst</a></li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    <div class="tab-content">
                        <div class="tab-pane active" style="min-height: 500px;">
                            <form class="form-horizontal" role="form" runat="server">
                                <fieldset>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="txtName">Name</label>
                                        <div class="col-sm-9">
                                            <input id="txtName" class="form-control" runat="server" type="text" placeholder="Enter the Name" maxlength="50" required autofocus>
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
                                        <label class="col-sm-4 control-label" for="autocomplete">Google address searching</label>
                                        <div class="col-sm-8">
                                            <input id="autocomplete" placeholder="Enter your address" onfocus="geolocate()" type="text" class="form-control">
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="txtLine1">Line 1</label>
                                        <div class="col-sm-10">
                                            <input id="txtLine1" runat="server" type="text" placeholder="Address Line 1" class="form-control ownL1 street_number" maxlength="100" required>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="txtLine2">Line 2</label>
                                        <div class="col-sm-10">
                                            <input id="txtLine2" runat="server" type="text" placeholder="Address Line 2" class="form-control ownL2 route" maxlength="100" required>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="txtCity">City</label>
                                        <div class="col-sm-10">
                                            <input id="txtCity" class="ownCity form-control locality" runat="server" type="text" placeholder="City" maxlength="50" required>
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
                                            <input id="txtState" class="ownState form-control administrative_area_level_1" runat="server" type="text" placeholder="State" maxlength="50" required>
                                        </div>

                                        <label class="col-sm-2 control-label" for="txtPostcode">Postcode</label>
                                        <div class="col-sm-4">
                                            <input id="txtPostcode" runat="server" type="text" placeholder="Post Code" class="form-control ownPostcode postal_code" maxlength="10" required>
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
                                        <label class="col-sm-2 control-label" for="textinput">Country</label>
                                        <div class="col-sm-10">
                                            <input id="txtCountry" class="ownCountry form-control country" runat="server" type="text" placeholder="Country" maxlength="50" required>
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
                                                <input class="btn btn-default btnReset" type="button" value="Reset" />
                                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- Reset button --%>
    <script>
        $(".btnReset").click(function () {
            $(".form-control").val("");
        });
    </script>
    <%-- Get location script --%>
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
    <%-- Google address searching --%>
    <script>
        // This example displays an address form, using the autocomplete feature
        // of the Google Places API to help users fill in the information.

        // This example requires the Places library. Include the libraries=places
        // parameter when you first load the API. For example:
        // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

        var placeSearch, autocomplete;
        var componentForm = {
            street_number: 'long_name',
            route: 'long_name',
            locality: 'long_name',
            administrative_area_level_1: 'short_name',
            country: 'long_name',
            postal_code: 'short_name'
        };

        function initAutocomplete() {
            // Create the autocomplete object, restricting the search to geographical
            // location types.
            autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
                { types: ['geocode'] });

            // When the user selects an address from the dropdown, populate the address
            // fields in the form.
            autocomplete.addListener('place_changed', fillInAddress);
        }

        function fillInAddress() {
            // Get the place details from the autocomplete object.
            var place = autocomplete.getPlace();

            for (var component in componentForm) {
                $('.' + component).val("");
            }

            // Get each component of the address from the place details
            // and fill the corresponding field on the form.
            console.log(place.address_components);
            for (var i = 0; i < place.address_components.length; i++) {
                var addressType = place.address_components[i].types[0];
                if (componentForm[addressType]) {
                    var val = place.address_components[i][componentForm[addressType]];
                    $('.' + addressType).val(val);
                }
            }
        }

        // Bias the autocomplete object to the user's geographical location,
        // as supplied by the browser's 'navigator.geolocation' object.
        function geolocate() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    var geolocation = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                    var circle = new google.maps.Circle({
                        center: geolocation,
                        radius: position.coords.accuracy
                    });
                    autocomplete.setBounds(circle.getBounds());
                });
            }
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbi_YnG0TT_9rn_74DIzmuSdW1CDb0q2Y&libraries=places&callback=initAutocomplete"
        async defer></script>
</asp:Content>

