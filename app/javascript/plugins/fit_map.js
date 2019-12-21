const fitMap = (map, markers) => {
  var center_marker = markers.slice(0)[0];
  var home_coordinates = [
    [center_marker.lng,center_marker.lat],[center_marker.lng,center_marker.lat]
  ];
  map.fitBounds(home_coordinates, { padding: 70, maxZoom: 17, duration: 0 });
};

export {fitMap};
