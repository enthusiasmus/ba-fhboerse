$(document).ready(function(){	
	$('#filter').change(function() {
		reloadWithFilter();
	});
	$('#state_product').change(function() {
  		reloadWithFilter();
  	});
  	
	$('#product_photo').change(function() {
  		$('.photo_two').show();
  	});
	$('#product_photo_two').change(function() {
  		$('.photo_three').show();
  	});

  	if($("#articles_list ul").text().length < 4)
  		$("#articles_list ul").html("<li>Keine gesuchten Anzeigen vorhanden.</li>");  	
  		
  	getSelectedOptions();
	
	$(function(){
		// Datetimepicker
		$.timepicker.regional['de'] = {
		  timeOnlyTitle: 'Uhrzeit auswählen',
		  timeText: 'Zeit',
		  hourText: 'Stunde',
		  minuteText: 'Minute',
		  secondText: 'Sekunde',
		  currentText: 'Jetzt',
		  closeText: 'Auswählen',
		  dateFormat: 'dd.mm.yy',
		  ampm: false
		};
		$.timepicker.setDefaults($.timepicker.regional['de']);
		$('#item_time').timepicker();
	});
	
	$('.photo_two').hide();
	$('.photo_three').hide();
});

function getSelectedOptions(){
	$("#filter").val($("#filter_value").val());
	$("#state_product").val($("#state_product_value").val());
}

function reloadWithFilter(){
	var path = "";
	var sign = "?";
	
	if($('#filter option:selected').val() != "alle"){
		path += sign + "filter=" + $('#filter option:selected').val();
		sign = "&";
	}
	if($('#state_product option:selected').val() != "alle"){
		path += sign + "state_product=" + $('#state_product option:selected').val();
	}

	window.location.href = window.location.pathname + path;	
}