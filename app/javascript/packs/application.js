// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require("jquery")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require jquery.slick
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap

$(function() {
    $('.your-class').slick({
        dots: true, //Show dot navigation below slides
        autoplay: true, //auto play
        arrows: false,
        autoplaySpeed: 4000 //Playback speed
    });
  });




