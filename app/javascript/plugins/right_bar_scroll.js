const rightBarScroll = () => {
  //タブレットより大きい場面サイズの場合スクロール時ヘッド固定
  if (!window.matchMedia('(max-width: 767px)').matches) {
    if (!window.matchMedia('(max-hight: 767px)').matches) {
    $("#right_bar").scroll(function(){
      $("#right_bar_head").stop().animate({"top" : $("#right_bar").scrollTop()}, 100);
    });
  }
}};

export { rightBarScroll };
