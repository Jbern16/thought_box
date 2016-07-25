$(document).ready(function(){
  $(".links").on("click", ".read-box", function(){
    var id = $(this).parent().parent().data("id")
    $.ajax({
      type: "PATCH",
      url: "/api/v1/links/" + id , 
      data: { "link": {"read": "true"} },
      dataType: "JSON",
      success: function(response) {
        $("#link-" + id).addClass(".striked")
      }
    })
  })
})