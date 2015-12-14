# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.destroy_all
p1 = Post.create(:topic => 'How do I javascript?', :content => 'How do I make a hello world in javascript?')
p2 = Post.create(:topic => 'What\'s Ruby?', :content => 'Is the language as precious as the gem?')
p3 = Post.create(:topic => 'This site is amazing!', :content => 'I want to have it\'s children')

Comment.destroy_all
c1 = Comment.create(:content => 'Ask Joel. He really likes those questions!')
c2 = Comment.create(:content => 'console.log("Hello world")')
c3 = Comment.create(:content => 'Better than kittens')

User.destroy_all
u1 = User.create(:name => 'vito', :email => 'vito@gmail.com', :image => 'http://assets.rollingstone.com/assets/2013/gallery/steven-van-zandts-favorite-mob-movies-20131202/the-godfather-1972-0179794/126982/_original/1035x1291-godfather-1800-1385393135.jpg', :role => 0, :course => 'wdi12')
u2 = User.create(:name => 'jean luc picard', :email => 'admin@gmail.com', :image => 'https://s-media-cache-ak0.pinimg.com/236x/7b/4e/b0/7b4eb0fba26501fef90f06b4b1993a13.jpg', :role => 2)
u3 = User.create(:name => 'larry', :email => 'larry@gmail.com', :image => 'http://gonetworth.com/wp-content/uploads/2013/02/Larry-David-net-worth.jpg', :role => 0, :course => 'wdi12')

p1.comments << c1 << c2
p3.comments << c3

p1.user = u1
p1.save
p2.user = u2
p2.save
p3.user = u3
p3.save

c1.user = u2
c1.save
c2.user = u3
c2.save
c3.user = u1
c3.save