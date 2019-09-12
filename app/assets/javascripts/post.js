$(document).on('turbolinks:load',function() {
  $fileField = $('#file')

  $('#file').on('change', $fileField, function(e){
    file = e.target.files[0]
    render = new FileReader(),
    $preview = $('.postbody-image');
    $preview2 = $('.label')

    render.onload = (function(file){
      return function(e){
        $preview2.css('display','none');
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          height: "100%",
          class: "post-img"
        }));
      };
    })(file);
    render.readAsDataURL(file)
  })
});
