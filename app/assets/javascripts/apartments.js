$(document).ready(function(){	
	$('#filter').change(function() {
		reloadWithFilter();
	});
	$('#type_of_apartment').change(function() {
  		reloadWithFilter();
  	});

  	if($("#articles_list ul").text().length < 4)
  		$("#articles_list ul").html("<li>Keine gesuchten Anzeigen vorhanden.</li>");  	
  		
	$('#apartment_photo').change(function() {
  		$('.photo_two').show();
  	});
	$('#apartment_photo_two').change(function() {
  		$('.photo_three').show();
  	});
  		
  	getSelectedOptions();
	
	$(function(){
		// Datepicker
		$('#apartment_begin_availability').datepicker({
			inline: true,
			dateFormat: 'dd.mm.yy'
		});
		$('#apartment_end_availability').datepicker({
			inline: true,
			dateFormat: 'dd.mm.yy'
		});
	});
	
	$('.photo_two').hide();
	$('.photo_three').hide();
});

function getSelectedOptions(){
	$("#filter").val($("#filter_value").val());
	$("#type_of_apartment").val($("#type_of_apartment_value").val());
}

function reloadWithFilter(){
	var path = "";
	var sign = "?";
	
	if($('#filter option:selected').val() != "alle"){
		path += sign + "filter=" + $('#filter option:selected').val();
		sign = "&";
	}
	if($('#type_of_apartment option:selected').val() != "alle"){
		path += sign + "type_of_apartment=" + $('#type_of_apartment option:selected').val();
	}

	window.location.href = window.location.pathname + path;	
}