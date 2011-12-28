$(document).ready(function(){
	if($("input:radio:checked[name='job[paid]']").val() == "false")
		$(".paymentoptions").hide();
	
    $(this).find("input:radio[name='job[paid]']").click(function() {
			$(".paymentoptions").toggle(350);
	});
});
