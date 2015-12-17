# Post.destroy_all
# p1 = Post.create(:topic => 'How do I javascript?', :content => 'How do I make a hello world in javascript?')
# p2 = Post.create(:topic => 'What\'s Ruby?', :content => 'Is the language as precious as the gem?')
# p3 = Post.create(:topic => 'This site is amazing!', :content => 'I want to have it\'s children')
# p4 = Post.create(topic: "Mark down ", content: "---\r\n# h1 Heading\r\n## h2 Heading\r\n### h3 Heading\r\n#### h4 Heading\r\n##### h5 Heading\r\n###### h6 Heading\r\n\r\n\r\n## Horizontal Rules\r\n\r\n___\r\n\r\n---\r\n\r\n***\r\n\r\n## Emphasis\r\n\r\n**This is bold text**\r\n\r\n__This is bold text__\r\n\r\n*This is italic text*\r\n\r\n_This is underlined text_\r\n\r\n~~Deleted text~~\r\n\r\nSuperscript: ha^ha^ha^ha\r\n\r\n++Inserted text++\r\n\r\n==Marked text==\r\n\r\n\r\n## Blockquotes\r\n\r\n\r\n> Blockquotes can also be nested...\r\n>> ...by using additional greater-than signs right next to each other...\r\n> > > ...or with spaces between arrows.\r\n\r\n\r\n## Lists\r\n\r\nUnordered\r\n\r\n+ Create a list by starting a line with `+`, `-`, or `*`\r\n+ Sub-lists are made by indenting 2 spaces:\r\n  - Marker character change forces new list start:\r\n    * Ac tristique libero volutpat at\r\n    + Facilisis in pretium nisl aliquet\r\n    - Nulla volutpat aliquam velit\r\n+ Very easy!\r\n\r\nOrdered\r\n\r\n1. Lorem ipsum dolor sit amet\r\n2. Consectetur adipiscing elit\r\n3. Integer molestie lorem at massa\r\n\r\n\r\n1. You can use sequential numbers...\r\n1. ...or keep all the numbers as `1.`\r\n\r\nStart numbering with offset:\r\n\r\n57. foo\r\n1. bar\r\n\r\n\r\n## Code\r\n\r\nInline `code`\r\n\r\nBlock code \"fences\"\r\n\r\n```\r\nSample text here...\r\n```\r\n\r\nSyntax highlighting\r\n\r\n``` js\r\nvar foo = function (bar) {\r\n  return bar++;\r\n};\r\n\r\nconsole.log(foo(5));\r\n```\r\n\r\n## Tables\r\n\r\n| Option | Description |\r\n| ------ | ----------- |\r\n| data   | path to data files to supply the data that will be passed into templates. |\r\n| engine | engine to be used for processing templates. Handlebars is the default. |\r\n| ext    | extension to be used for dest files. |\r\n\r\nRight aligned columns\r\n\r\n| Option | Description |\r\n| ------:| -----------:|\r\n| data   | path to data files to supply the data that will be passed into templates. |\r\n| engine | engine to be used for processing templates. Handlebars is the default. |\r\n| ext    | extension to be used for dest files. |\r\n\r\n\r\n## Links\r\n\r\n[Google](http://www.google.com)\r\n\r\n[link with title](http://www.google.com \"Google!\")\r\n\r\nAutoconverted link https://www.google.com\r\n\r\n## Footnotes\r\n\r\nFootnote 1 link[^first].\r\n\r\nFootnote 2 link[^second].\r\n\r\nInline footnote^[Text of inline footnote] definition.\r\n\r\nDuplicated footnote reference[^second].\r\n\r\n## Images\r\n\r\n![Minion](https://octodex.github.com/images/minion.png)\r\n![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg \"The Stormtroopocat\")\r\n\r\n[^first]: Footnote **can have markup**\r\n\r\n    and multiple paragraphs.\r\n\r\n[^second]: Footnote text.")

# Comment.destroy_all
# c1 = Comment.create(:content => 'Ask Joel. He really likes those questions!')
# c2 = Comment.create(:content => 'console.log("Hello world")')
# c3 = Comment.create(:content => 'Better than kittens')

User.destroy_all
PASSWORD = 'chicken'
u1 = User.create(:name => 'vito', :email => 'vito@gmail.com', :image => 'http://assets.rollingstone.com/assets/2013/gallery/steven-van-zandts-favorite-mob-movies-20131202/the-godfather-1972-0179794/126982/_original/1035x1291-godfather-1800-1385393135.jpg', :role => :student, :course => 'wdi12', :password => PASSWORD)
u2 = User.create(:name => 'jean luc picard', :email => 'admin@gmail.com', :image => 'https://s-media-cache-ak0.pinimg.com/236x/7b/4e/b0/7b4eb0fba26501fef90f06b4b1993a13.jpg', :role => :admin, :password => PASSWORD)
u3 = User.create(:name => 'larry', :email => 'larry@gmail.com', :image => 'http://gonetworth.com/wp-content/uploads/2013/02/Larry-David-net-worth.jpg', :role => :student, :course => 'wdi12', :password => PASSWORD)
u4 = User.create(name: "mark", email: "mark@gmail.com", password: PASSWORD, image: "", role: 0, course: "")

# Vote.destroy_all
# v1 = Vote.create(:vote => 1)
# v2 = Vote.new(:vote => 1)
# v3 = Vote.new(:vote => -1)

# v1.update_attributes(:user_id => u1.id, :votable => p1)
# v2.update_attributes(:user_id => u2.id, :votable => p1)
# v3.update_attributes(:user_id => u3.id, :votable => c1)

# p1.comments << c1 << c2
# p3.comments << c3

# p1.user = u1
# p1.save
# p2.user = u2
# p2.save
# p3.user = u3
# p3.save
# p4.user = u4
# p4.save

# c1.user = u2
# c1.save
# c2.user = u3
# c2.save
# c3.user = u1
# c3.save
