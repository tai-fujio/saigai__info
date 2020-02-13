import { closeBar } from './close_bar';

const rightBarClose = () => {
  const closeButton = document.getElementById("close-nav");
  closeButton.addEventListener("click", closeBar ,false);
};

export { rightBarClose };
