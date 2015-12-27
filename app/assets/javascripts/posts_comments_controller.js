

PostsController = Paloma.controller('Posts');
CommentsController = Paloma.controller('Comments');

var update_preview = function(){
  $(document).ready(function(){
    var md = new Remarkable();
    $('.md-input').on('keyup', function(e){
        $('.preview').html(md.render($(this).val()));
    });
  });
};

// set the callbacks when action triggered
PostsController.prototype.new = update_preview;
PostsController.prototype.edit = update_preview;
PostsController.prototype.create = update_preview;

CommentsController.prototype.new = update_preview;
CommentsController.prototype.edit = update_preview;
CommentsController.prototype.update = update_preview;
