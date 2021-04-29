$(document).ready( function(){
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#post_feature_image_preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('#post_feature_image').change(function(){
    readURL(this);
  });


});

$(document).on('click', '.scroll-to-comments', function() {
  var $container = $('html,body');
  var $scrollTo = $('.comment-threads');

  $container.animate({scrollTop: $scrollTo.offset().top - 200, scrollLeft: 0},300);
})

$(document).on('click', '#like-post', function() {
  $.ajax({
    url: '/posts/like',
    type: 'get',
    data: {
      id: $('#postId').val()
    },
    success: function (data) {
      $('#like-post').html('<i class="' + (data.liked ? 'fas' : 'far') + ' fa-heart"></i> ' + data.likes)
    }
  });
})
