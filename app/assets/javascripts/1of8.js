

$(document).ready(function(){
  $("#employeeCheckBox").click(function(){
    $("#studentStuff").hide();
    $("#employeeStuff").show();
  });
});


$(document).ready(function(){
  $("#studentCheckBox").click(function(){
  	$("#studentStuff").show();
    $("#employeeStuff").hide();
    
  });
});

