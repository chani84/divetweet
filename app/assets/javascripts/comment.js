$(document).on('turbolinks:load',function(){

  function buildHTML(comment){
    var html =
    `<div class = "show-tweet__comment__box__user-comment">
      <div class = "show-tweet__comment__box__nickname">
        <a href=/users/${comment.user_id}>${comment.user_name}</a>
      </div>
      <div class = "show-tweet__comment__box__content">
        ${comment.content}
      </div>
    </div>`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("action")
    // console.log(this);
    // console.log(url);
    // console.log(formData);
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data);
      var html = buildHTML(data);
      $('.show-tweet__comment__box').append(html)
      $('.show-tweet__comment__input__box').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
});
