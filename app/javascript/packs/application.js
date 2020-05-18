require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")
require("packs/photo_preview")

import "bootstrap";
import { previewImageOnFileSelect } from '../packs/photo_preview';