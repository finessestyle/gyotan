import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "trix"
import "@rails/actiontext"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "../src/flash"
import "../src/hamburger"
import "../src/test"
import "../src/page"
import "../src/swiper"
