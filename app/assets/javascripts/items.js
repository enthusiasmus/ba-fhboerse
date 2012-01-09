$(document).ready(function(){	
	$('#filter').change(function() {
		reloadWithFilter();
	});
	
	$('input[name="item[offer_or_quest]"]').click(function() {
		if($('input:radio:checked[name="item[offer_or_quest]"]').val() == "true")
			$('#post_details').text("Details zum Finden");
		else
			$('#post_details').text("Details zum Verlust");
	});

  	if($("#articles_list ul").text().length < 4)
  		$("#articles_list ul").html("<li>Keine gesuchten Anzeigen vorhanden.</li>");  	
  		
	$('#item_photo').change(function() {
  		$('.photo_two').show();
  	});
	$('#item_photo_two').change(function() {
  		$('.photo_three').show();
  	});
  		
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
}

function reloadWithFilter(){
	var path = "";
	if($('#filter option:selected').val() != "alle")
		path = "?filter=" + $('#filter option:selected').val();

	window.location.href = window.location.pathname + path;	
}