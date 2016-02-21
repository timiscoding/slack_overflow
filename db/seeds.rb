Post.destroy_all
p1 = Post.create(:topic => 'How do I javascript?', :content_md => 'How do I make a hello world in javascript?', :content_html => 'How do I make a hello world in javascript?', :score => 1)
p2 = Post.create(:topic => 'What\'s Ruby?', :content_md => 'Is the language as precious as the gem?', :content_html => 'Is the language as precious as the gem?', :score => 1)
p3 = Post.create(:topic => 'This site is amazing!', :content_md => 'I want to have it\'s children', :content_html => 'I want to have it\'s children', :score => 1)
p4 = Post.create(:topic => "Mark down ", :content_md => "Text on\r\n\r\nmultiple lines\r\n\r\n[link](http://example.com \"Title\")\r\nwww.google.com\r\n\r\n*Emphasize* _Emphasize_ \r\n**Strong** __Strong__ \r\n~~boo boo~~\tEmphasize \r\nStrong \r\nboo boo\r\n\r\n![Bill](http://fillmurray.com/100/100)\r\n\r\n* Item \r\n* Item \r\n- Item \r\n- Item \r\n\r\n1. Item \r\n2. Item \r\n   * sub item\r\n\r\n`inlline code`\r\n\r\n```css\r\n#button { \r\nborder: none; \r\n} \r\n```\r\n\r\n# Header 1 \r\n## Header 2\r\n\r\nFirst name | Last name \r\n--- | --- \r\nBill | Murray",
:content_html => "<p>Text on</p>\r\n<p>multiple lines</p>\r\n<p><a href=\"http://example.com\" title=\"Title\">link</a>\r\n<a href=\"http://www.google.com\">www.google.com</a></p>\r\n<p><em>Emphasize</em> <em>Emphasize</em>\r\n<strong>Strong</strong> <strong>Strong</strong>\r\n<s>boo boo</s>\tEmphasize\r\nStrong\r\nboo boo</p>\r\n<p><img src=\"http://fillmurray.com/100/100\" alt=\"Bill\"></p>\r\n<ul>\r\n<li>Item</li>\r\n<li>Item</li>\r\n</ul>\r\n<ul>\r\n<li>Item</li>\r\n<li>Item</li>\r\n</ul>\r\n<ol>\r\n<li>Item</li>\r\n<li>Item\r\n<ul>\r\n<li>sub item</li>\r\n</ul>\r\n</li>\r\n</ol>\r\n<p><code>inlline code</code></p>\r\n<pre><code class=\"language-css\"><span class=\"line\"><span class=\"id\"><span class=\"id\">#button</span></span> <span class=\"rules\"><span class=\"rules\">{ \r\n</span></span></span><span class=\"line\"><span class=\"rules\"><span class=\"rule\"><span class=\"attribute\"><span class=\"rules\"><span class=\"rule\"><span class=\"attribute\">border</span></span></span></span><span class=\"rules\"><span class=\"rule\">:</span></span><span class=\"value\"><span class=\"rules\"><span class=\"rule\"><span class=\"value\"> none</span></span></span></span></span><span class=\"rules\">; \r\n</span></span></span><span class=\"line\"><span class=\"rules\"><span class=\"rule\"><span class=\"rules\"><span class=\"rule\">}</span></span></span></span></span> \r\n</code></pre>\r\n<h1>Header 1</h1>\r\n<h2>Header 2</h2>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>First name</th>\r\n<th>Last name</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>Bill</td>\r\n<td>Murray</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n",
:score => 1)

Comment.destroy_all
c1 = Comment.create(:content_md => 'Ask Joel. He really likes those questions!', :content_html => 'Ask Joel. He really likes those questions!')
c2 = Comment.create(:content_md => 'console.log("Hello world")', :content_html => 'console.log("Hello world")')
c3 = Comment.create(:content_md => 'Better than kittens', :content_html => 'Better than kittens')

User.destroy_all
PASSWORD = 'chicken'
u1 = User.create(:name => 'vito', :email => 'vito@gmail.com', :image => 'http://assets.rollingstone.com/assets/2013/gallery/steven-van-zandts-favorite-mob-movies-20131202/the-godfather-1972-0179794/126982/_original/1035x1291-godfather-1800-1385393135.jpg', :role => :student, :course => 'wdi12', :password => PASSWORD)
u2 = User.create(:name => 'jean luc picard', :email => 'admin@gmail.com', :image => 'https://s-media-cache-ak0.pinimg.com/236x/7b/4e/b0/7b4eb0fba26501fef90f06b4b1993a13.jpg', :role => :admin, :password => PASSWORD)
u3 = User.create(:name => 'larry', :email => 'larry@gmail.com', :image => 'http://gonetworth.com/wp-content/uploads/2013/02/Larry-David-net-worth.jpg', :role => :student, :course => 'wdi12', :password => PASSWORD)
u4 = User.create(name: "mark", email: "mark@gmail.com", :image => 'https://upload.wikimedia.org/wikipedia/commons/3/31/Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg', password: PASSWORD, role: 0, course: "")

Vote.destroy_all
v1 = Vote.new(:value => 1)
v2 = Vote.new(:value => 1)
v3 = Vote.new(:value => 1)
v4 = Vote.new(:value => 1)

v1.update_attributes(:user_id => u1.id, :votable => p1)
v2.update_attributes(:user_id => u2.id, :votable => p2)
v3.update_attributes(:user_id => u3.id, :votable => p3)
v4.update_attributes(:user_id => u4.id, :votable => p4)

p1.comments << c1 << c2
p3.comments << c3

p1.user = u1
p1.save
p2.user = u2
p2.save
p3.user = u3
p3.save
p4.user = u4
p4.save

c1.user = u2
c1.save
c2.user = u3
c2.save
c3.user = u1
c3.save
