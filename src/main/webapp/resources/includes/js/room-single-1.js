(function () {
    "use strict";
$(document).ready(function(){
	$('ul.tabs li').on('click',function(){
	
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});
	$('a[data-slide="prev"]').on('click',function(){
		$('#carousel-example-generic').carousel('prev');
	});

	$('a[data-slide="next"]').on('click',function(){
		$('#carousel-example-generic').carousel('next');
	});
});
}());

