$(window).on('scroll', function() {
  scrollHeight = $(document).height();
  scrollPosition = $(window).height() + $(window).scrollTop();
  if ( (scrollHeight - scrollPosition) / scrollHeight <=0.05) {
      $('.jscroll').jscroll({
        contentSelector: '.jscroll',
        autoTrigger: true,
        nextSelector: 'a.next',
        loadingHtml: '読み込み中'
      });
  }
});