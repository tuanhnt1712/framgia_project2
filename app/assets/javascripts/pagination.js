$(document).on('turbolinks:load', function () {
  $(window).on('scroll', function(){
    more_posts_url = $('.pagination .next a').attr('href');
    if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 100) {
      $('.pagination').html('<img src="/assets/ajax-loader.gif" />');
      $.getScript(more_posts_url);
    }
  });
});
