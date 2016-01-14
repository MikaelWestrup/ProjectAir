$(document).ready(function(){
// date picker

  $( "#start_date, #end_date" ).datepicker({
  	dateFormat: 'dd-mm-yy',
    inline: true,
  });

// dropdown

$( "#speed, #speed1" ).selectmenu();

// accordion 

// $(function () { $('#collapseFour').collapse({
//       toggle: false
//    })});
//    $(function () { $('#collapseOne').collapse('show')});
//    $(function () { $('#collapseTwo').collapse('hide')});
//    $(function () { $('#collapseThree').collapse('hide')});
//    $(function () { $('#collapsefr').collapse('hide')});
//    $(function () { $('#collapsefv').collapse('hide')});
//    $(function () { $('#collapsesx').collapse('hide')});
//    $(function () { $('#collapsesvn').collapse('hide')});
//    $(function () { $('#collapseegt').collapse('hide')});
//    $(function () { $('#collapsenine').collapse('hide')});
//    $(function () { $('#collapse10').collapse('hide')});	
	
// js for toggle
// $(".info").click(function(){
// 	$(".info-box").fadeToggle();			  
// });
	
// js for popup

// $("#pop").click(function(){
// 	$("#date_time_popup").fadeIn();done			  
// });
// $("#done").click(function(){
// 	$("#date_time_popup").fadeOut();			  
// });

// $("#onside_field").click(function(){
//   $("#location").fadeIn();done        
// });
// $("#location-done").click(function(){
//   $("#location").fadeOut();       
// });



$(function(){
	$(".dropdown-menu > li > a.trigger").on("click",function(e){
		var current=$(this).next();
		var grandparent=$(this).parent().parent();
		if($(this).hasClass('left-caret')||$(this).hasClass('right-caret'))
			//$(this).toggleClass('right-caret left-caret');
		// grandparent.find('.left-caret').not(this).toggleClass('right-caret left-caret');
		grandparent.find(".sub-menu:visible").not(current).hide();
		current.toggle();
		e.stopPropagation();
	});
	$(".dropdown-menu > li > a:not(.trigger)").on("click",function(){
		var root=$(this).closest('.dropdown');
		// root.find('.left-caret').toggleClass('right-caret left-caret');
		root.find('.sub-menu:visible').hide();
	});
});
});

  
$(function() {
  $( "#slider-range-max" ).slider({
    range: "max",
    min: 1,
    max: 1439,
    value: 600,
    slide: function( event, ui ) {
      var hours1 = Math.floor(ui.value / 60);
      var minutes1 = ui.value - (hours1 * 60);

      if (hours1.length == 1) hours1 = '0' + hours1;
      if (minutes1.length == 1) minutes1 = '0' + minutes1;
      if (minutes1 == 0) minutes1 = '00';
      $( "#start_time" ).text(hours1 + ':' + minutes1);
    }
  });
  // $( "#amount" ).val( $( "#slider-range-max" ).slider( "value" ) );
  $( "#slider-range-max1" ).slider({
    range: "max",
    min: 1,
    max: 1439,
    value: 600,
    slide: function( event, ui ) {
      var hours1 = Math.floor(ui.value / 60);
      var minutes1 = ui.value - (hours1 * 60);

      if (hours1.length == 1) hours1 = '0' + hours1;
      if (minutes1.length == 1) minutes1 = '0' + minutes1;
      if (minutes1 == 0) minutes1 = '00';
      $( "#end_time" ).text(hours1 + ':' + minutes1);
    }
  });
});





