function promptLogin() {
  swal({
    title: "ログインしてください！",
    text: "お気に入りはログインすることで利用できます。お気に入りすることで、気になる記事を保存することができるようになります。",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  });
}

document.addEventListener('turbolinks:load', function() {
  $('#toggle-news').click(function() {
    $(this).toggleClass('fa-toggle-off');
    $(this).toggleClass('fa-toggle-on');
    $('#news-wrapper').slideToggle();
  });
});
