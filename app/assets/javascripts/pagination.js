$(function() {
  $(".pagination a").live("click", function() {
  	//get the new site
    $.setFragment({ "page" : $.queryString(this.href).page })
    $(".pagination").html("Seite wird geladen...");
    return false;
  });
  
  $.fragmentChange(true);
  //when the url is changed this function gets called
  $(document).bind("fragmentChange.page", function() {
  	//refresh page number when moving back- or forward
    $.getScript($.queryString(document.location.href, { "page" : $.fragment().page }));
  });
  
  //at refreshing the site the article part gets reloaded
  if($.fragment().page) {
    $(document).trigger("fragmentChange.page");
  }
});