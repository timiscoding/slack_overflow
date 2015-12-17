

PostsController = Paloma.controller('Posts');
CommentsController = Paloma.controller('Comments');

  PostsController.prototype.new = function(){
    update_preview();
  };

  PostsController.prototype.edit = function(){
    update_preview();
  };

  CommentsController.prototype.new = function(){
    update_preview();
  }

  CommentsController.prototype.edit = function(){
    update_preview();
  }

  function update_preview(){
    $(document).ready(function(){
      var md = new Remarkable();
      $('textarea').on('keyup', function(e){
          $('#preview').html(md.render($(this).val()));
      });
    });
  }