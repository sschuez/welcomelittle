require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")
// require("packs/photo_preview")

import "bootstrap";
// import { previewImageOnFileSelect } from '../packs/photo_preview';

// previewImageOnFileSelect();


// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../packs/init_mapbox';

initMapbox();

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})