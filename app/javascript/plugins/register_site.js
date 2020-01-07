import { userInfo } from './user_info';

document.getElementById("map").ondblclick = function(e){

    userInfo();

  var coordinates = document.getElementsByTagName("pre").info.innerHTML
  var lng_index = coordinates.indexOf("lng");
  var lat_index = coordinates.indexOf("lat");
  var lng = parseFloat(coordinates.substr(lng_index+5,14));
  var lat = parseFloat(coordinates.substr(lat_index+5,15))
  for(var i = 0; i < $('[id=site_latitude]').length; i++){
    $('[id=site_latitude]')[i].value = lat;
  };
  for(var i = 0; i < $('[id=site_longitude]').length; i++){
    $('[id=site_longitude]')[i].value = lng;
  };
}
