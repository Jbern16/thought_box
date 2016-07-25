$(document).ready(function(){
  $("#search").on("keyup", function(){
    var word = $(this).val().toLowerCase()
    var title_and_urls = $(".links").children("ul").children(".link-title", ".link-url").map(function(){
      return $(this)
    })

    var not_matched = title_and_urls.filter(function(index, element){
      return !$(element).text().toLowerCase.includs(word)
    })
    
    var matched = title_and_urls.filter(function(index, element){
      return $(element).text().toLowerCase.includs(word)
    })

    $.each(not_matched, function(index, element){
      $(element).parent.hide()
    })

    $.each(matched, function(index, element){
      $(element).parent.hide()
    })
  })
})