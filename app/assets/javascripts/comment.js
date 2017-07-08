$(document).ready(function(){
  $('body').on('click', '#comment_submit', function(e){
    e.preventDefault();
    var params = {
      comment: {
        content: $('#new-content-comment').val()
      }
    }
    $.ajax({
      url: $('#new_comment').attr('action'),
      type: 'post',
      dateType: 'json',
      data: params,
      success: function(result){
        $('body').find('#comment_list').append(result.html);
        $('#new-content-comment').val('');
      },
      error: function(error){
        console.log(error);
      }
    });
  });

  $('body').on('click', '#edit_comment', function(e){
    e.preventDefault();
    var id = $(this).closest('.comment-user').attr('id');
    var value = $(this).closest('.comment-user').find('.comment-title').text();
    $('#new-content-comment').val(value).focus();
    $('#comment_submit').attr('id', 'comment_edit');
    $('body').on('click', '#comment_edit', function(e) {
      e.preventDefault();
      var params = {
        comment: {
          content: $('#new-content-comment').val()
        }
      }
      $.ajax({
        url: $('#new_comment').attr('action') + '/' + id,
        type: 'put',
        dateType: 'json',
        data: params,
        success: function(result){
          $('body').find('#' + id).html(result.html);
          $('#new-content-comment').val('');
        },
        error: function(error){
          console.log(error);
        }
      });
      $('#comment_edit').attr('id', 'comment_submit');
    });
  });
});
