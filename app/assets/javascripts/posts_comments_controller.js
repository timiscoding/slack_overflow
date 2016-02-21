var app = app || {};

// detect when tab is pressed and insert 2 space indentation in markdown input textarea
app.addTabIndent = function(e) {
  console.log('tab ', e.which);
  var keyCode = e.keyCode || e.which;

  if (keyCode == 9) {
    e.preventDefault();
    var start = $(this).get(0).selectionStart;
    var end = $(this).get(0).selectionEnd;

    // set textarea value to: text before caret + tab + text after caret
    $(this).val($(this).val().substring(0, start)
                + "  "
                + $(this).val().substring(end));

    // put caret at right position again
    $(this).get(0).selectionStart =
    $(this).get(0).selectionEnd = start + 2; // new cursor pos is 2 spaces ahead
  }
};

// show what the markdown input will look like in preview area
app.renderPreview = function(e){
  var mdHtml = app.md.render($(this).val());
  $('.content-html').html(mdHtml);

  // add line numbers
  $('.preview pre code').each( function(i, block){
    hljs.highlightBlock(block, false, false, true); // last arg enables line numbers
  });
  if ( $('#post_content_html').length ){
    $('#post_content_html').val( $('.content-html').html() );
  } else if ( $('#comment_content_html').length ){
    $('#comment_content_html').val( $('.content-html').html() );
  }
};

// markdown renderer set up
app.md = window.markdownit({
  linkify: true, // detect links and auto convert them
  highlight: function (str, lang) {
    try {
      return hljs.highlightAuto(str).value;
    } catch (__) {}

    return ''; // use external default escaping
  }
});

$(document).ready(function(){
  PostsController = Paloma.controller('Posts');
  CommentsController = Paloma.controller('Comments');

  $('a#markdown-help').popover();

  var update_preview = function(){
      $('.md-input').on('keyup', app.renderPreview);
      $('.md-input').on('keydown', app.addTabIndent);
  };

  var update_vote = function(){
    $('a[data-remote].vote').on('ajax:success', function(event, data, status, xhr){
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
