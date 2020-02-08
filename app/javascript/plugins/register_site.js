const registerSite = () => {

if(document.getElementById("map")){
document.getElementById("map").ondblclick = function(e){

  var modal = document.createElement("div");
  modal.className = "modal"
  var modalContent = document.createElement("div"); 
  modalContent.className = "modal-content";
  var modalInfo = document.createElement("div");
  modalInfo.className = "modal-info";

  modalInfo.appendChild(document.createTextNode('この地点を登録できます'));
  modalInfo.appendChild(document.createElement('br'));
  modalInfo.appendChild(document.createTextNode('アイコンから選んでください'));
  modalContent.appendChild(modalInfo);
  modal.appendChild(modalContent);
  document.body.appendChild(modal);
  setTimeout(function(){
    document.body.removeChild(modal);
  },900);

  var coordinates = document.getElementsByTagName("pre")
  .info.innerHTML
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
  sessionStorage.setItem('dbclick', true);
  }};
};

export {registerSite};
