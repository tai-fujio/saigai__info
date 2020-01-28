const fitMap = (map, markers) => {
  if(sessionStorage.getItem("dbclick") == "true"){
    var marker_counts = markers.length - 2;
    var center_marker = markers.slice(marker_counts)[0];
  }else{
    var center_marker = markers.slice(0)[0];
  }
  var home_coordinates = [
    [center_marker.lng,center_marker.lat],[center_marker.lng,center_marker.lat]
  ];
  map.fitBounds(home_coordinates, { padding: 0, maxZoom: 15.5, duration: 0 });
};

export {fitMap};
