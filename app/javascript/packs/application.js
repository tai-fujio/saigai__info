import 'mapbox-gl/dist/mapbox-gl.css';
import {initMap} from '../plugins/init_map';
import '../plugins/register_site';
import { rightBarScroll } from '../plugins/right_bar_scroll';
$("#init_info").hide();
$("#click_info").hide();
initMap();
rightBarScroll();
