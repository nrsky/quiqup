$(function(){
    var map = L.map('map').setView([51.505, -0.09], 13);

    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    for(var i = 0;  i < parsedData.length; i++){
        parsedData[i]= JSON.parse(parsedData[i]);
        var coords = parsedData[i]["coordinates_LL"];
        coords = coords.split(",");
        L.marker([parseFloat(coords[1]), parseFloat(coords[0])]).addTo(map);
    }
})

