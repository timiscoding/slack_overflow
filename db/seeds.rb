# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.destroy_all
Post.create(:topic => 'How do I javascript?', :content => 'How do I make a hello world in javascript?')
Post.create(:topic => 'What\'s Ruby?', :content => 'Is the language as precious as the gem?')
Post.create(:topic => 'This site is amazing!', :content => 'I want to have it\'s children')