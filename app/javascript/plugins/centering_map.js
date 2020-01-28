import { centerPoint } from './center_point';

const centeringMap = () => {
  var button = document.getElementsByClassName("centering_button");
  button[0].addEventListener("click",centerPoint,false);
};

export { centeringMap };
