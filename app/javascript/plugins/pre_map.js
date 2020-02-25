const passwordNotify = () => {
// マップ作成時パスワード入力の際の注意喚起
$(".password_field").on({
  'mouseenter':function(){
    var text = $(this).attr('data-set');
    $(this).append('<div class="tooltips">'+text+'</div>');
  },
  'mouseleave':function(){
    $(this).find(".tooltips").remove();
  }
});
}
export { passwordNotify };
