const fitMap = (map, markers) => {
  var center_marker = markers.slice(0)[0];
  var home_coordinates = [
    [center_marker.lng,center_marker.lat],[center_marker.lng,center_marker.lat]
  ];
  map.fitBounds(home_coordinates, { padding: 0, maxZoom: 15.8, duration: 0 });
};

export {fitMap};
