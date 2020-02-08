const openBar = () => {
  if (window.matchMedia('(max-width: 767px)').matches) {
    document.getElementById("right_bar").style.width = "75%";
}else{
  document.getElementById("right_bar").style.width = "35%";
};
};

export { openBar };
