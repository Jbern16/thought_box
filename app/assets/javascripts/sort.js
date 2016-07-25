$(document).ready(function(){
  $("#sort").on("click", function(){
    var links = $(".links").children("ul").map(function(){
      return $(this)
    })
    var sorted = links.sort(function(node1, node2){
      var title1 = $(node1).children(".link-title").text()
      var title2 = $(node2).children(".link-title").text()
      if (title1 > title2){
        return -1
      }
      else if (title1 < title2){
        return 1
      }
      else{
        return 0
      }
    })
    $(".links").children("ul").remove()
    $.each(sorted, function(index, e){
      $(".links").prepend(e[0])
    })
  })
})