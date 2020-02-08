const passwordNotify = () => {

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
