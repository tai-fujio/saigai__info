import { openBar } from './open_bar';

const rightBarOpen = () => {
  const markers = document.getElementsByClassName("mapboxgl-marker");
  for( var i = 0 ,l = markers.length; i < l ; i++ ) {
    var marker = markers[i] ;
    marker.addEventListener("click", openBar ,false)
    };
  };

export { rightBarOpen };
