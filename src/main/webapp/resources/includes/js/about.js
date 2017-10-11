(function(){
    "use strict";
	$(document).ready(function(){
	    $('ul.tabs li').on('click',function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
			return false;
		});
		$('.roll').on('click',function(){
			var id = $(this).attr('id');
			var src_img = $('#src-'+id).attr('src');
			
			var st ="";
			st = st+ "<img src='"+src_img+"'/> ";

			$('#img-story .modal-body').empty();	   
			$('#img-story .modal-body').append(st);
		   	$('#myModal').modal({show:true});
		});
		$('.quick-view').on('click',function(event){
			event.preventDefault();
			/* Act on the event */
			$slideid = $(this).data('slideid');
			$html=$("."+$slideid).clone();
			$(".carousel").removeAttr('id');
			$("."+$slideid).removeAttr('id').addClass('last-slide');
	        $('.image-service .modal-body').empty();     
	       
	        $('#myModal .modal-body').html($html);
	        $('#myModal .'+$slideid).data('ride', 'carousel');
	        //$("#close-slide").data('myid',$slideid);
	        $('#myModal .'+$slideid).addClass('carousel');
	 
	        $('#myModal').modal({show:true});
	  	});  
	  	$('#close-slide').on('click',function(event){
			$html =$('#myModal .modal-body').children('div').html();
			$('#myModal .modal-body').empty();
			$(".last-slide").html($html).attr('id','carousel-example-generic');
			$('.carousel').attr('id','carousel-example-generic');
		});

	});
}) (jQuery);