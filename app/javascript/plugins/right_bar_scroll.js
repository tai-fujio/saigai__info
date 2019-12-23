// const rightBarScroll = () => {
//   $("#right_bar").scroll(function(){
//     var divPosition = $("#right_bar_head").offset().top;
//     if(divPosition < 40){
//       $("#right_bar_head").css("position", "fixed");
//     }else{
//       $("#right_bar_head").css("position", "static");
//     }
//   });
// };

const rightBarScroll = () => {
  $("#right_bar").scroll(function(){
    $("#right_bar_head").stop().animate({"top" : $("#right_bar").scrollTop()}, 100);
  });
};

export { rightBarScroll };
