$(document).ready(function(){
	if($("input:radio:checked[name='job[paid]']").val() == "false")
		$(".paymentoptions").hide();
	
    $("#job_paid_true").click(function() {
		$(".paymentoptions").show(350);
	});
    $("#job_paid_false").click(function() {
		$(".paymentoptions").hide(350);
	});
	
	$('#filter').change(function() {
		reloadWithFilter();
	});
	$('#service').change(function() {
  		reloadWithFilter();
  	});

  	if($("#articles_list ul").text().length < 4)
  		$("#articles_list ul").html("<li>Keine gesuchten Anzeigen vorhanden.</li>");  	
  		
  	getSelectedOptions();
});

function getSelectedOptions(){
	$("#filter").val($("#filter_value").val());
	$("#service").val($("#service_value").val());
}

function reloadWithFilter(){
	var path = "";
	var sign = "?";
	
	if($('#filter option:selected').val() != "alle"){
		path += sign + "filter=" + $('#filter option:selected').val();
		sign = "&";
	}
	if($('#service option:selected').val() != "alle"){
		path += sign + "service=" + $('#service option:selected').val();
	}
	
	window.location.href = window.location.pathname + path;	
}