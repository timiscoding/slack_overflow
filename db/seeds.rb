Comment.create!([
  {post_id: 10, user_id: 13, content: "Ask Joel. He really likes those questions!"},
  {post_id: 10, user_id: 14, content: "console.log(\"Hello world\")"},
  {post_id: 12, user_id: 12, content: "Better than lots of kittens"},
  {post_id: 11, user_id: 12, content: "puts 'i has ruby'"},
  {post_id: 11, user_id: 12, content: "It works"},
  {post_id: nil, user_id: nil, content: "ugh physio"}
])
Post.create!([
  {user_id: 12, topic: "How do I javascript?", content: "How do I make a hello world in javascript?"},
  {user_id: 13, topic: "What's Ruby?", content: "Is the language as precious as the gem?"},
  {user_id: 14, topic: "This site is amazing!", content: "I want to have it's children"},
  {user_id: 15, topic: "Mark down ", content: "---\r\n# h1 Heading\r\n## h2 Heading\r\n### h3 Heading\r\n#### h4 Heading\r\n##### h5 Heading\r\n###### h6 Heading\r\n\r\n\r\n## Horizontal Rules\r\n\r\n___\r\n\r\n---\r\n\r\n***\r\n\r\n## Emphasis\r\n\r\n**This is bold text**\r\n\r\n__This is bold text__\r\n\r\n*This is italic text*\r\n\r\n_This is underlined text_\r\n\r\n~~Deleted text~~\r\n\r\nSuperscript: ha^ha^ha^ha\r\n\r\n++Inserted text++\r\n\r\n==Marked text==\r\n\r\n\r\n## Blockquotes\r\n\r\n\r\n> Blockquotes can also be nested...\r\n>> ...by using additional greater-than signs right next to each other...\r\n> > > ...or with spaces between arrows.\r\n\r\n\r\n## Lists\r\n\r\nUnordered\r\n\r\n+ Create a list by starting a line with `+`, `-`, or `*`\r\n+ Sub-lists are made by indenting 2 spaces:\r\n  - Marker character change forces new list start:\r\n    * Ac tristique libero volutpat at\r\n    + Facilisis in pretium nisl aliquet\r\n    - Nulla volutpat aliquam velit\r\n+ Very easy!\r\n\r\nOrdered\r\n\r\n1. Lorem ipsum dolor sit amet\r\n2. Consectetur adipiscing elit\r\n3. Integer molestie lorem at massa\r\n\r\n\r\n1. You can use sequential numbers...\r\n1. ...or keep all the numbers as `1.`\r\n\r\nStart numbering with offset:\r\n\r\n57. foo\r\n1. bar\r\n\r\n\r\n## Code\r\n\r\nInline `code`\r\n\r\nBlock code \"fences\"\r\n\r\n```\r\nSample text here...\r\n```\r\n\r\nSyntax highlighting\r\n\r\n``` js\r\nvar foo = function (bar) {\r\n  return bar++;\r\n};\r\n\r\nconsole.log(foo(5));\r\n```\r\n\r\n## Tables\r\n\r\n| Option | Description |\r\n| ------ | ----------- |\r\n| data   | path to data files to supply the data that will be passed into templates. |\r\n| engine | engine to be used for processing templates. Handlebars is the default. |\r\n| ext    | extension to be used for dest files. |\r\n\r\nRight aligned columns\r\n\r\n| Option | Description |\r\n| ------:| -----------:|\r\n| data   | path to data files to supply the data that will be passed into templates. |\r\n| engine | engine to be used for processing templates. Handlebars is the default. |\r\n| ext    | extension to be used for dest files. |\r\n\r\n\r\n## Links\r\n\r\n[Google](http://www.google.com)\r\n\r\n[link with title](http://www.google.com \"Google!\")\r\n\r\nAutoconverted link https://www.google.com\r\n\r\n## Footnotes\r\n\r\nFootnote 1 link[^first].\r\n\r\nFootnote 2 link[^second].\r\n\r\nInline footnote^[Text of inline footnote] definition.\r\n\r\nDuplicated footnote reference[^second].\r\n\r\n## Images\r\n\r\n![Minion](https://octodex.github.com/images/minion.png)\r\n![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg \"The Stormtroopocat\")\r\n\r\n[^first]: Footnote **can have markup**\r\n\r\n    and multiple paragraphs.\r\n\r\n[^second]: Footnote text."}
])
User.create!([
  {name: "vito", email: "vito@gmail.com", password_digest: "$2a$10$Iszc3hEShGC5OBBOZ2olduZE64t/gPyH9TnVbnTlP1Nq0w9VJgn3m", image: "http://assets.rollingstone.com/assets/2013/gallery/steven-van-zandts-favorite-mob-movies-20131202/the-godfather-1972-0179794/126982/_original/1035x1291-godfather-1800-1385393135.jpg", role: 0, course: "wdi12"},
  {name: "jean luc picard", email: "admin@gmail.com", password_digest: "$2a$10$OPaOLhkMFAIatp1Pnlyq4eRni73eUUdvEbTrrUrz0Fuf0z4nvTIX2", image: "https://s-media-cache-ak0.pinimg.com/236x/7b/4e/b0/7b4eb0fba26501fef90f06b4b1993a13.jpg", role: 2, course: nil},
  {name: "larry", email: "larry@gmail.com", password_digest: "$2a$10$rNcUpkNRA9e4OUutQRa2puPUSR2W9y0YtgKuGzEQ41MLMedQHetCO", image: "http://gonetworth.com/wp-content/uploads/2013/02/Larry-David-net-worth.jpg", role: 0, course: "wdi12"},
  {name: "mark", email: "mark@gmail.com", password_digest: "$2a$10$j1AhX8i3rESZLBStpGD6u.cNeIFnq.k1SToE7YTEAUBoPQIhQf3ki", image: "", role: 0, course: ""}
])
Vote.create!([
  {vote: 1, votable_id: 10, votable_type: "Post", user_id: 12},
  {vote: 1, votable_id: 10, votable_type: "Post", user_id: 13},
  {vote: -1, votable_id: 10, votable_type: "Comment", user_id: 12}
])
