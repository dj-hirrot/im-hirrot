document.addEventListener('turbolinks:load', function() {
  console.log('test');
  $('#quit_at_check_box').click(function() {
    console.log('test');
    if ($(this).prop('checked')) {
      $('#quit_at_wrap').fadeOut();
    } else {
      $('#quit_at_wrap').fadeIn();
    }
  });
});
