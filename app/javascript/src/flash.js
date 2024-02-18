'use strict';

$(document).on('turbolinks:load', function() {
  var flashElement = $(".flash");
  if (flashElement.length > 0) {
    flashElement.fadeOut(1800, function() {
      $(this).remove();
    });
  }
});