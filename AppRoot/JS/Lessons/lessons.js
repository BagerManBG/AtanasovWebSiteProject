$(function(){
  var $menuitems = $("#menuitems"); 
  $menuitems.css("display:none");
  $("#heading").click(function(){
    $("#menuitems").slideToggle('200');
  });
});


