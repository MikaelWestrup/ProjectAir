$(document).ready(function(){
// date picker

$( "#datepicker, #datepicker1" ).datepicker({
	inline: true,
});

// dropdown

$( "#speed, #speed1" ).selectmenu();

// accordion 

$(function () { $('#collapseFour').collapse({
      toggle: false
   })});
   $(function () { $('#collapseOne').collapse('show')});
   $(function () { $('#collapseTwo').collapse('hide')});
   $(function () { $('#collapseThree').collapse('hide')});
   $(function () { $('#collapsefr').collapse('hide')});
   $(function () { $('#collapsefv').collapse('hide')});
   $(function () { $('#collapsesx').collapse('hide')});
   $(function () { $('#collapsesvn').collapse('hide')});
   $(function () { $('#collapseegt').collapse('hide')});
   $(function () { $('#collapsenine').collapse('hide')});
   $(function () { $('#collapse10').collapse('hide')});	
	
// js for toggle
$(".info").click(function(){
	$(".info-box").fadeToggle();			  
});
	
// js for popup
$("#pop").click(function(){
	$(".custom-popup").fadeIn();done			  
});
$("#done").click(function(){
	$(".custom-popup").fadeOut();			  
});	



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
      max: 23.59,
      value: 8.30,
	  step: 0.11,
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.value );
      }
    });
    $( "#amount" ).val( $( "#slider-range-max" ).slider( "value" ) );
	
	$( "#slider-range-max1" ).slider({
      range: "max",
      min: 1,
      max: 23.59,
      value: 8.30,
	  step: 0.11,
      slide: function( event, ui ) {
        $( "#amount1" ).val( ui.value );
      }
    });
    $( "#amount1" ).val( $( "#slider-range-max1" ).slider( "value" ) );
	
	
  });





