$( document ).ready(function() {

  var $menuitems = $("#menuitems"); 
  $menuitems.css("display:none");
  $("#heading").click(function(){
    $("#menuitems").slideToggle('200');

});

  var $menuitems_1 = $("#menuitems_1"); 
  $menuitems_1.css("display:none");
  $("#heading_1").click(function(){
    $("#menuitems_1").slideToggle('200');
  });

   var $menuitems_2 = $("#menuitems_2"); 
  $menuitems_2.css("display:none");
  $("#heading_2").click(function(){
    $("#menuitems_2").slideToggle('200');
  });

    var $menuitems_3 = $("#menuitems_3"); 
  $menuitems_3.css("display:none");
  $("#heading_3").click(function(){
    $("#menuitems_3").slideToggle('200');
  });


});

