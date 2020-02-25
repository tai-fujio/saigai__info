const placeMarker = (map, markers) => {

  if (markers && Array.isArray(markers) ) {
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
  };
};

export { placeMarker };
