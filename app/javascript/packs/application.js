import "core-js/stable";
import "regenerator-runtime/runtime";
import 'mapbox-gl/dist/mapbox-gl.css';
import {initMap} from '../plugins/init_map';
import { passwordNotify } from "../plugins/pre_map";
passwordNotify();
initMap();
