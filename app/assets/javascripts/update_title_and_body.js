$(document).ready(function(){
  $(".links").on("focus", "link-title", function(){
    console.log("hi")
    var id = $(this).parent().data("id")
    $(this).on("blur", function(){
      var title = $("#link-" + id, "link-title").text()
      sendUpdate(id, {"title": title})
    })   
   })

})
  
var sendUpdate = function(id, data) {
  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + id , 
    data: { "link": title },      
    dataType: "JSON",
    success: function(response) {}
  })
}