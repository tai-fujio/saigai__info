const registerSite = () => {
  var user_agent = navigator.userAgent;
if(document.getElementById("map")){
  //端末がタブレットかスマホの場合
  if(user_agent.indexOf('iPhone') > 0 || user_agent.indexOf('iPod') > 0 || user_agent.indexOf('Android') > 0 || user_agent.indexOf('iPad') > 0 ){
    var tapCount = 0;
    document.getElementById("map").addEventListener("touchstart", function(e){
    // ピンチが行われていない場合
    if(e.touches.length < 2){
    // ダブルタップが行われたかどうかの判定
    if( !tapCount ) {
      ++tapCount ;
      setTimeout(function(){
        tapCount = 0;
      },300);
    }else{
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
      var lng = parseFloat(coordinates.substr(lng_index+5,16));
      var lat = parseFloat(coordinates.substr(lat_index+5,17))
      for(var i = 0; i < $('[id=site_latitude]').length; i++){
        $('[id=site_latitude]')[i].value = lat;
      };
      for(var i = 0; i < $('[id=site_longitude]').length; i++){
        $('[id=site_longitude]')[i].value = lng;
      };
      sessionStorage.setItem('dbclick', true);
      }};
    });
    }else{
    //端末がタブレットかスマホ以外の場合
    document.getElementById("map").ondblclick = function(){
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
    var lng = parseFloat(coordinates.substr(lng_index+5,16));
    var lat = parseFloat(coordinates.substr(lat_index+5,17))
    for(var i = 0; i < $('[id=site_latitude]').length; i++){
      $('[id=site_latitude]')[i].value = lat;
    };
    for(var i = 0; i < $('[id=site_longitude]').length; i++){
      $('[id=site_longitude]')[i].value = lng;
    };
    sessionStorage.setItem('dbclick', true);
    }};
  };
};

  export {registerSite};
