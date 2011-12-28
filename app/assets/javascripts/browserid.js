function loginViaEmail() {
	navigator.id.getVerifiedEmail(function(assertion) {
		if (assertion) {
			$('input[name=assertion]').val(assertion);
			$('#browser_id').submit();
		} else {
			window.location = "#{failure_path}"
		}
	});  
}

$(function() {
	$('#browser_id button').click(function() {
		loginViaEmail();
		return false;
	});
	
	$('.closeIcon').remove();	//Bugfix! $(function(){ ... is called twice
    $('#notice').append("<div class='closeIcon' title='Dialog schließen'></div>");
    $('.closeIcon').click(function(){
		$('#notice').fadeOut('slow');
    });
});