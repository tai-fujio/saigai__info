import mapboxgl from 'mapbox-gl';
import { placeMarker } from './place_marker';
import { fitMap } from './fit_map';
import { sidebarClose } from './sidebar_close';
import { rightbarOpen } from './rightbar_open';

const initMap = () => {
  const mapDiv = document.getElementById('map');
  if (mapDiv) {
    mapboxgl.accessToken = process.env.MAPBOX_API_KEY
    const markers = JSON.parse(mapDiv.dataset.markers);
    if(markers.length <2){
      // #サイト未登録の場合
      window.map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
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
      enableHighAccuracy: false,timeout:6000
      },
      showUserLocation: false
      }));

      const user_info = () => {
        $("#init_info").fadeIn(300);
        $(".ok_btn").click(function(){
          $("#init_info").fadeOut(300);
        });
      };

      $("#map").one('mousemove', function () {
        setTimeout(function(){
          user_info();
        },700);
      });

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

      rightbarOpen();

      sidebarClose();
    };
  };
};

export {initMap};
