$(document).ready(function(){
	if($("input:radio:checked[name='drive[type]']").val() == "true")
		$(".return").hide();
	
    $("#drive_type_true").click(function() {
		$(".return").hide(350);
	});
    $("#drive_type_false").click(function() {
		$(".return").show(350);
	});
	
	$('#filter').change(function() {
		reloadWithFilter();
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
		$('#drive_departure_date').timepicker();
		$('#drive_destination_date').timepicker();
	});
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