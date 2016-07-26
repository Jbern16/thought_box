$(document).ready(function(){
  
  $("#findUnread").on("click", function(){
    $(".links").children("ul", ".striked").hide()
    $(".links").children("ul:not(.striked)").show()
 })

 $("#findRead").on("click", function(){
    $(".links").children("ul").not(".striked").hide()
    $(".links").children(".striked").show()
 })
})
