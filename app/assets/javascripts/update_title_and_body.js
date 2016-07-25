$(document).ready(function(){

  $(".links").on("focus", ".link-title", function(){
    var id = $(this).parent().data("id")
    $(this).on("blur", function(){
      var title = $("#link-" + id).children(".link-title").text()
      var url = $("#link-" + id).children(".link-url").children("a").text()
      sendUpdate(id, {"title": title}, url)
    })   
   })

  $(".links").on("focus", ".link-url", function(){
    var id = $(this).parent().data("id")
    $(this).on("blur", function(){
      var url =  $("#link-" + id).children(".link-url").children("a").text()
      sendUpdate(id, {"url": url}, url)
    })   
   })
})
  
var sendUpdate = function(id, data, url) {
  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + id , 
    data: { "link": data },      
    dataType: "JSON",
    success: function(response) {
      $("#link-" + id).children(".link-url").children("a").attr("href", url)
    }
  }) 
}