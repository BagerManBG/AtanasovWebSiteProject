$(document).ready(function(){
  $(window).scroll(function() {
    if ($(document).scrollTop() > 160) {
      $("ul").addClass("scroll");
      $("nav").addClass("nav-scroll");
    } 
      else {
        $("ul").removeClass("scroll");
        $("nav").removeClass("nav-scroll");
    }
  });
});