$(document).ready(function(){
	if($("input:radio:checked[name='job[paid]']").val() == "false")
		$(".paymentoptions").hide();
	
    $("#job_paid_true").click(function() {
			$(".paymentoptions").show(350);
	});
    $("#job_paid_false").click(function() {
			$(".paymentoptions").hide(350);
	});
});