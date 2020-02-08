import "core-js/stable";
import "regenerator-runtime/runtime";
import 'mapbox-gl/dist/mapbox-gl.css';
import {registerSite} from '../plugins/register_site'
import {initMap} from '../plugins/init_map';
import { passwordNotify } from "../plugins/pre_map";
passwordNotify();
registerSite();
initMap();
