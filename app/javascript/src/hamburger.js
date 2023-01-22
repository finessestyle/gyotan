'use strict';

$(document).on('turbolinks:load',function() {
  $('.nav_toggle').on('click', function () {
    $('.nav_toggle, .nav').toggleClass('show');
  });
});