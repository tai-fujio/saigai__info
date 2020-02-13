import { newCenterPoint } from './new_center_point';

const centeringMap = () => {
  var button = document.getElementsByClassName("centering_button");
  button[0].addEventListener("click",newCenterPoint,true);
};

export { centeringMap };
