import { closeBar } from './close_bar';

const sidebarClose = () => {
  const closeButton = document.getElementById("close-nav");
  closeButton.addEventListener("click", closeBar ,false);
};

export { sidebarClose };
