

PostsController = Paloma.controller('Posts');

  PostsController.prototype.new = function(){
    $(document).ready(function(){
    // alert('JS detected u making a new post!');

    // $('#preview').val('preview shit');
      var md = new Remarkable();
      $('textarea').on('keyup', function(e){
          // console.log($(this).val());
          // $('#preview').text($(this).val());
          $('#preview').html(md.render($(this).val()));
      });
    });

  };