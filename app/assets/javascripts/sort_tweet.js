$(document).on("turbolinks:load",function(){
  $(".search-tweet__top__sort").on("change", function(){
    var sort_tweet = $(this).val();
    var current_url = document.URL;

    if( sort_tweet == 0 ){
    }
    if( sort_tweet == 1 ){
      location.href = current_url + "&sort=old_date"
    }
    if( sort_tweet == 2 ){
      location.href = current_url + "&sort=new_date"
    }
  })
})
