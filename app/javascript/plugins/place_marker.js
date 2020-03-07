const placeMarker = (map, markers) => {

  if (markers && Array.isArray(markers) ) {
    if(markers[0].name != "fas fa-search fa-3x faa-flash animated"){
    var all_markers = markers
    markers.forEach((marker) => {
    // 最初に登録されたマーカーを点滅させる
    if (marker == all_markers[0]){
      marker.name = marker.name + " faa-flash" + " animated"
    }
    // 各マーカーにリンクを貼る
    var element = document.createElement('a');
    element.setAttribute(`href`,`${marker.map_id}/sites/${marker.id}`);
    element.setAttribute(`data-remote`,`true`);
    element.className = marker.name;
    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
    });
  }else{
    markers.forEach((marker) => {
      var element = document.createElement('a');
      element.className = marker.name;
      var popup = new mapboxgl.Popup({ offset: 25 }).setHTML(
        `${marker.display_name}`
        );
      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
      });
    };
  };
};

export { placeMarker };
