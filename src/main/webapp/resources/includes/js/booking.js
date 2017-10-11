(function(){
    "use strict";
var first_load=true;
var second_load =true;
var $date1, $date2,$date;
var $current_date;
$(document).ready(function() {
    $("#datetimepicker1").datepicker({ dateFormat: 'mm/dd/yyyy' });
    $("#datetimepicker2").datepicker({ dateFormat: 'mm/dd/yyyy' });
    $("#datepicker12").on("dp.change", function(e) {
          if(!first_load ){
             $date = $(this).data('date');
        $('#datetimepicker1').datepicker('update', $date);
        $('#datetimepicker1').val($date);
        $date2 = $("#datepicker13").data('date');
        mathnight($date, $date2);
        }
       first_load=false;
       
    });
    $("#datepicker13").on("dp.change", function(e) {
        if(!second_load ){
            
        $date = $(this).data('date');
        $('#datetimepicker2').datepicker('update', $date);
        $('#datetimepicker2').val($date);
        $date1 = $("#datepicker12").data('date');
         mathnight($date1, $date);
           
        }
        second_load =false; 
    });

    function mathnight(dateold, datenew) {
        $date1 = new Date(dateold);
        $date2 = new Date(datenew);
        $("#datepicker13 table.table-condensed td").removeClass('myactive');
        $("#datepicker12 table.table-condensed td").removeClass('myactive');
        
        var diffDays = $date2.getTime() - $date1.getTime();
        if (isNaN(diffDays) && (diffDays < 0)) {
            return false;
        }
        if( $date1.getTime() < new Date().getTime() ||$date2.getTime() < new Date().getTime()  ){
            return false;
        }
        var msecPerMinute = 1000 * 60;
        var msecPerHour = msecPerMinute * 60;
        var msecPerDay = msecPerHour * 24;
        var days = Math.floor(diffDays / msecPerDay);
        $("#ul-room-1 option[value='" + days + "']").attr('selected', 'selected');
        
        $("#datepicker12 table.table-condensed td").each(function(index, el) {
            $current_date = new Date($(this).data('day'));
            if (($date1.getTime() <= $current_date.getTime()) && ($current_date.getTime() <= $date2.getTime())) {
                $(this).addClass('myactive');
            }
        });
        
        $("#datepicker13 table.table-condensed td").each(function(index, el) {
            $current_date = new Date($(this).data('day'));
            if (($date1.getTime() <= $current_date.getTime()) && ($current_date.getTime() <= $date2.getTime())) {
                $(this).addClass('myactive');
            }
        });
    }
    var $html = '';
    var $i;
    for ($i = 1; $i < 63; $i++) {
        $html = $html + '<option value="' + $i + '"> ' + $i + ' </option>';
    }
    $("#ul-room-1").html($html);

    $('#datetimepicker1').datepicker()
        .on('changeDate', function(e) {
            var $val = $(this).val();
            $date2 = $('#datetimepicker2').val();
            $('#datepicker12').data("date", $val);
            mathnight($val, $date2);
            var picker = $('#datepicker12').data('DateTimePicker');
            picker.date($val);
        });
    $('#datetimepicker2').datepicker()
        .on('changeDate', function(e) {
           var  $val = $(this).val();
            $date2 = $('#datetimepicker1').val();
            mathnight($date2, $val);
            var picker = $('#datepicker13').data('DateTimePicker');
            picker.date($val);
        });

    $('.next').on('click', function () {
        console.log('next');  
    })

    $('.prev').on('click', function () {
    })
    
    
    setTimeout(function(){
        $("#datepicker12 table.table-condensed td").each(function(index, el) {
            $current_date = new Date($(this).data('day'));
            $date = new Date();
            if ($current_date.getTime() < $date.getTime()) {                
                $(this).addClass('myold');
            }
        });
    },1000);
});
})(jQuery);