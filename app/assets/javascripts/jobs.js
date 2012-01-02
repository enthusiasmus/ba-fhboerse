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
  	
  	if(location.pathname + location.search != "/jobs"){
  		var choosenFilter = localStorage.getItem('filter');
  		var choosenService = localStorage.getItem('service');
  	}

  	if($("#articles_list ul").text().length < 4)
  		$("#articles_list ul").html("<li>Keine gesuchten Anzeigen vorhanden.</li>");
  	
  	$("#filter").val(choosenFilter);
	$("#service").val(choosenService);
});

function reloadWithFilter(){
	var path = "";
	var sign = "?";
	
	if($('#filter option:selected').val() != "alle"){
		path += sign + "filter=" + $('#filter option:selected').val();
		sign = "&";
	}
	if($('#service option:selected').val() != "alle"){
		path += sign + "service=" + $('#service option:selected').val();
		sign = "&";
	}
		
	localStorage.setItem('filter', $('#filter option:selected').val());
	localStorage.setItem('service', $('#service option:selected').val());
	
	window.location.href = window.location.pathname + path;	
}