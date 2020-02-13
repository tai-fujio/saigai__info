const newCenterPoint = () => {
  const mapDiv = document.getElementById('map');
  if (mapDiv) {
  var markers = JSON.parse(mapDiv.dataset.markers);
  var center_marker = markers.slice(0)[0];
  var home_coordinates = [
    [center_marker.lng,center_marker.lat],[center_marker.lng,center_marker.lat]
  ];
  map.fitBounds(home_coordinates, { padding: 0, maxZoom: 15.8, duration: 0 });
  };
  sessionStorage.setItem('dbclick', false);
};

export {newCenterPoint};
