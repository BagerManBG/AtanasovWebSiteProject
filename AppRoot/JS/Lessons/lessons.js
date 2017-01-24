$( document ).ready(function() {

  var $menuitems = $("#menuitems"); 
  $menuitems.css("display:none");
  $("#heading").click(function(){
    $("#menuitems").slideToggle('200');

});

  var $menuitems_1 = $("#menuitems_1"); 
  $menuitems_1.css("display:none");
  $("#headin_1").click(function(){
    $("#menuitems_1").slideToggle('200');
  });

});

