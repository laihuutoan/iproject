$(document).ready( function(){
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $("#post_feature_image_preview").attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#post_feature_image").change(function(){
    readURL(this);
  });
});
