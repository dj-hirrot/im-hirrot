document.addEventListener('turbolinks:load', function() {
  $('#quit_at_check_box').click(function() {
    if ($(this).prop('checked')) {
      $('#quit_at_wrap').fadeOut();
    } else {
      $('#quit_at_wrap').fadeIn();
    }
  });
});
