function initMap() {
    var uluru = { lat: 42.132941, lng: 24.719232 };
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: uluru,
        scrollwheel: false
    });
    var marker = new google.maps.Marker({
        position: uluru,
        map: map
    });
    map.disableScrollWheelZoom;
}
