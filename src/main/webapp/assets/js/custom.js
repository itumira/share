$(document).ready(function() {
   /*============ Chat sidebar ========*/
  

  /*============= About page ==============*/
  $(".about-tab-menu .list-group-item").click(function(e) {
      e.preventDefault();
      $(this).siblings('a.active').removeClass("active");
      $(this).addClass("active");
      var index = $(this).index();
      $("div.about-tab>div.about-tab-content").removeClass("active");
      $("div.about-tab>div.about-tab-content").eq(index).addClass("active");
  });

  $(".superbox-img").click(function(){
    var img = $(this).attr("src");
    $("#modalImage .modal-body").html("<img src='"+img+"' class='img-responsive'>");
    $("#modalImage").modal('show');
  })

  /*==============  show panel ===============*/
  
})