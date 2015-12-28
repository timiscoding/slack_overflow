$(document).ready(function(){
  PostsController = Paloma.controller('Posts');
  CommentsController = Paloma.controller('Comments');

  var update_preview = function(){
      var md = new Remarkable();
      $('.md-input').on('keyup', function(e){
          $('.preview').html(md.render($(this).val()));
      });
  };

  var update_vote = function(){
    $('a[data-remote].vote').on('ajax:success', function(event, data, status, xhr){
      console.log(data.status, data.score);
      if (data.status === 'ok'){
        $(this).siblings('a.vote').removeClass('btn-success');
        $(this).toggleClass('btn-success btn-default');
        $(this).siblings('.score').text(data.score);
      }
    });
  };

  // set the callbacks when action triggered
  PostsController.prototype.new = update_preview;
  PostsController.prototype.edit = update_preview;
  PostsController.prototype.create = update_preview;
  PostsController.prototype.show = update_vote;

  CommentsController.prototype.new = update_preview;
  CommentsController.prototype.edit = update_preview;
  CommentsController.prototype.update = update_preview;

});
