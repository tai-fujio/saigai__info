import mapboxgl from 'mapbox-gl';
import { placeMarker } from './place_marker';
import { fitMap } from './fit_map';
import { openRightBar } from './open_sidebar'
import { closeBar } from './close_sidebar';

const initMap = () => {
  const mapDiv = document.getElementById('map');
  // #サイト未登録の場合
  if (mapDiv) {
    mapboxgl.accessToken = ENV["MAPBOX_API_KEY"];
    const markers = JSON.parse(mapDiv.dataset.markers);
    if(markers.length <2){
      window.map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/light-v9',
      });

      map.flyTo({
        center: [ 139.7, 35.6 ],
        zoom: 10,
      });

      map.on('mousemove', function (e) {
        document.getElementById('info').innerHTML =
        JSON.stringify(e.lngLat.wrap());
      });

      map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      trackUserLocation: true
      }));

    }else{
      // #サイトが登録してある場合
      window.map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
      });

      fitMap(map,markers);
      placeMarker(map, markers);
      map.on('mousemove', function (e) {
        document.getElementById('info').innerHTML =
        JSON.stringify(e.lngLat.wrap());
      });

      map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      trackUserLocation: true
      }));

    const sidebar_open = () => {
      const markers = document.getElementsByClassName("mapboxgl-marker");
      for( var i = 0 ,l = markers.length; i < l ; i++ ) {
        var marker = markers[i] ;
        marker.addEventListener("click", openRightBar ,false)
        };
      };
    sidebar_open();

    const sidebar_close = () => {
      const closeButton = document.getElementById("close-nav");
      closeButton.addEventListener("click", closeBar ,false)
    };
    sidebar_close();

    };
  };
};

export {initMap};
