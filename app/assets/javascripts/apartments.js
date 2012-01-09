$(document).ready(function(){	
	$('#filter').change(function() {
		reloadWithFilter();
	});
	$('#type_of_leasebuyrent').change(function() {
  		reloadWithFilter();
  	});
  	
	$('input[name="apartment[leasebuyrent]"]').change(function() {
		checkLeaseBuyRentStatus();
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
  	checkLeaseBuyRentStatus();
	
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

function checkLeaseBuyRentStatus(){
	if($('input:radio:checked[name="apartment[leasebuyrent]"]').val() == "vermietet")
		$('.immobilie_lease').show();
	else
		$('.immobilie_lease').hide();
}

function getSelectedOptions(){
	$("#filter").val($("#filter_value").val());
	$("#type_of_leasebuyrent").val($("#type_of_leasebuyrent_value").val());
}

function reloadWithFilter(){
	var path = "";
	var sign = "?";
	
	if($('#filter option:selected').val() != "alle"){
		path += sign + "filter=" + $('#filter option:selected').val();
		sign = "&";
	}
	if($('#type_of_leasebuyrent option:selected').val() != "alle"){
		path += sign + "type_of_leasebuyrent=" + $('#type_of_leasebuyrent option:selected').val();
	}

	window.location.href = window.location.pathname + path;	
}