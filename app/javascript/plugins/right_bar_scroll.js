const rightBarScroll = () => {
    $("#right_bar").scroll(function(){
      $("#right_bar_header").stop().animate({"top" : $("#right_bar").scrollTop()}, 100);
    });
  };

export { rightBarScroll };
