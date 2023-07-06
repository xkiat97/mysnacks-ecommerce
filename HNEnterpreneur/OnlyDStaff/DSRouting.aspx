<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyDStaff/DeliveryStaff.Master" AutoEventWireup="true" CodeBehind="DSRouting.aspx.cs" Inherits="HNEnterpreneur.OnlyDStaff.DSRouting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Delivery Routing
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div id="map" style="height: 500px;" class="col-lg-10 offset-1">
        </div>
    </div>
    <div class="row">
        <div id="directions-panel" class="col-lg-10 offset-1">
            <h3>Routing scheduling</h3>
            <hr />
        </div>
    </div>
    <script>
        function initMap() {
            var directionsService = new google.maps.DirectionsService;
            var directionsDisplay = new google.maps.DirectionsRenderer;
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 6,
                center: { lat: 41.85, lng: -87.65 }
            });
            directionsDisplay.setMap(map);
            calculateAndDisplayRoute(directionsService, directionsDisplay);
            //document.getElementById('submit').addEventListener('click', function () {
            //    calculateAndDisplayRoute(directionsService, directionsDisplay);
            //});
        }

        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
            waypts = [<%=mapAddresses%>];

            directionsService.route({
                origin: "Tanjung Bungah, Pulau Pinang",
                destination: "Tanjung Bungah, Pulau Pinang",
                waypoints: waypts,
                optimizeWaypoints: true,
                travelMode: 'DRIVING'
            }, function (response, status) {
                if (status === 'OK') {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                    var summaryPanel = document.getElementById('directions-panel');
                    summaryPanel.innerHTML = '';
                    // For each route, display summary information.
                    for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                            '</b><br>';
                        summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
                        summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                        summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
                    }
                } else {
                    window.alert('Directions request failed due to ' + status);
                }
            });
        }
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbi_YnG0TT_9rn_74DIzmuSdW1CDb0q2Y&callback=initMap">
    </script>
</asp:Content>
