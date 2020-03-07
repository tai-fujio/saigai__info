import mapboxgl from 'mapbox-gl';
import { placeMarker } from './place_marker';
import { fitMap } from './fit_map';
import { rightBarClose } from './right_bar_close';
import { rightBarOpen } from './right_bar_open';
import { centeringMap } from './centering_map';
import { rightBarScroll } from './right_bar_scroll';
import { createMapNotify } from './create_map_notify'

const initMap = () => {
  const mapDiv = document.getElementById('map');
  if (!mapboxgl.supported()) {
    alert('このブラウザは地図の表示に対応していません');
    }else{
    if (mapDiv) {
      mapboxgl.accessToken = process.env.MAPBOX_API_KEY
      const markers = JSON.parse(mapDiv.dataset.markers);
      if(markers.length <2){
        // #アイコン未登録の場合
        window.map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v11',
        });

        map.flyTo({
          center: [ 139.7, 35.6 ],
          zoom: 10,
        });
        // #地図上のカーソルが緯度・経度を取得
        map.on('mousemove', function (e) {
          document.getElementById('info').innerHTML =
          JSON.stringify(e.lngLat.wrap());
        });
        // #現在地ボタンを地図上に表示
        map.addControl(new mapboxgl.GeolocateControl({
        positionOptions: {
        enableHighAccuracy: false,timeout:6000
        },
        showUserLocation: false
        }));

        createMapNotify();

      }else{
        // #アイコンが登録してある場合
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

        centeringMap();

        if(markers[0].name == "fas fa-search fa-3x faa-flash animated"){
          return
        }else{

        rightBarOpen();

        rightBarClose();

        rightBarScroll();
      };
    };
    sessionStorage.setItem('dbclick', false);
  };
};

export {initMap};
