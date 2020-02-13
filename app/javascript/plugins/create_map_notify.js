const createMapNotify = () => {

  if(document.getElementById("map")){
    var modal = document.createElement("div");
    modal.className = "modal"
    var modalContent = document.createElement("div"); 
    modalContent.className = "modal-content";
    var modalInfo = document.createElement("div");
    modalInfo.className = "modal-info";
    var ok_btn = document.createElement("BUTTON");
    ok_btn.className = "modal-info-btn"
    ok_btn.appendChild(document.createTextNode('OK'));
    modalInfo.appendChild(document.createTextNode('はじめに中心地点を登録してください'));
    modalInfo.appendChild(document.createElement('br'));
    modalInfo.appendChild(document.createTextNode('登録は地図上をダブルクリックしてからアイコンをクリックします'));
    modalInfo.appendChild(document.createElement('br'));
    modalInfo.appendChild(document.createTextNode('右上の現在地アイコンを押すと現在地に移動します'));
    modalInfo.appendChild(ok_btn);
    modalContent.appendChild(modalInfo);
    modal.appendChild(modalContent);
    document.body.appendChild(modal);
    const close_modal = () =>{
    $(".modal-info-btn").click(function(){
      document.body.removeChild(modal);
    });
    };
    close_modal();
  }
};

  export {createMapNotify};
