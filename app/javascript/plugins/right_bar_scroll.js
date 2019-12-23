const rightBarScroll = () => {
  $("#right_bar").scroll(function(){
    $("#right_bar_head").stop().animate({"top" : $("#right_bar").scrollTop()}, 100);
  });
};

export { rightBarScroll };
