(function(){
    "use strict";
    jQuery(document).ready(function($) {
        $('ul.nav li.dropdown').hover(function(){
        	$(this).addClass('open');
        	$('.dropdown-menu', this).fadeIn();
        }, function(){
        	$(this).removeClass('open');
        	$('.dropdown-menu', this).fadeOut('fast');
        });
        $('#clock').countdown('2016/11/11', function(event) {
       var $this = $(this).html(event.strftime(
          '<ul class="list-unstyled nav-pills"><li class="cusday"><p><span>%d</span></p> days </li>'
        + '<li class="cusday"><p><span class="ss">%H</span></p> hours </li> '
    	+ '<li class="cusday"><p><span class="ss">%M</span></p> minutes </li>'
    	+ '<li class="cusday no-right"><p><span class="ss">%S</span></p> seconds</li></ul>'));
        });
    });
}) (jQuery);
