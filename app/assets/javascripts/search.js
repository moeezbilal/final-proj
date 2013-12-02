// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $("#aaa").hover(function(){
    $(".1st").slideDown("slow");
  });
});


$(document).ready(function(){
  $("#aaa").mouseleave(function(){
    $(".1st").hide();
  });
});



$(document).ready(function(){
  $("#bbb").hover(function(){
    $(".2nd").slideDown("slow");
  });
});


$(document).ready(function(){
  $("#bbb").mouseleave(function(){
    $(".2nd").hide();
  });
});


$(document).ready(function(){
  $("#ccc").hover(function(){
    $(".3rd").slideDown("slow");
  });
});


$(document).ready(function(){
  $("#ccc").mouseleave(function(){
    $(".3rd").hide();
  });
});




$(document).ready(function(){
  $("#ddd").hover(function(){
    $(".4th").slideDown("slow");
  });
});


$(document).ready(function(){
  $("#ddd").mouseleave(function(){
    $(".4th").hide();
  });
});