# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.firsta

Actor.create(name: 'Brad Pitt', thumbnail_url: 'http://img.wennermedia.com/article-leads-vertical-300/1250530894_brad_pitt_290x402.jpg')
Actor.create(name: 'George Clooney', thumbnail_url: 'https://upload.wikimedia.org/wikipedia/commons/a/a2/George_Clooney_2012_National_Board_of_Review_Awards_(cropped).jpg')
Actor.create(name: 'Julia Roberts', thumbnail_url: 'https://upload.wikimedia.org/wikipedia/commons/a/a6/Julia_Roberts_2011_Shankbone_3.JPG')
Actor.create(name: 'Simon Pegg', thumbnail_url: 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Simon_Pegg_01.jpg')
Actor.create(name: 'Nick Frost', thumbnail_url: 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Nick_Frost_SXSW_2011.jpg')
Actor.create(name: 'Bruce Willis', thumbnail_url: 'https://upload.wikimedia.org/wikipedia/commons/0/03/Bruce_Willis_by_Gage_Skidmore.jpg')
Actor.create(name: 'Alan Rickman', thumbnail_url: 'https://upload.wikimedia.org/wikipedia/commons/9/98/AlanRickmanDec2009.jpg')

Movie.create(title: 'Oceans Eleven', thumbnail_url: 'http://www.movie-poster-artwork-finder.com/posters/ocean039s-eleven-2001-poster-artwork-george-clooney-brad-pitt-matt-damon.jpg')
Movie.create(title: 'Shawn of the Dead', thumbnail_url: 'https://upload.wikimedia.org/wikipedia/en/e/ec/Shaun-of-the-dead.jpg')
Movie.create(title: 'Die Hard', thumbnail_url: 'https://upload.wikimedia.org/wikipedia/en/7/7e/Die_hard.jpg')
Movie.create(title: 'Troy', thumbnail_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/b/b8/Troy2004Poster.jpg/220px-Troy2004Poster.jpg')


m = Movie.where(title: 'Oceans Eleven').first
m.actors = Actor.where(name: ['Brad Pitt', 'George Clooney', 'Julia Roberts'])
m.save

m = Movie.where(title: 'Shawn of the Dead').first
m.actors = Actor.where(name: ['Simon Pegg', 'Nick Frost'])
m.save

m = Movie.where(title: 'Die Hard').first
m.actors = Actor.where(name: ['Bruce Willis', 'Alan Rickman'])
m.save

m = Movie.where(title: 'Troy').first
m.actors = Actor.where(name: ['Brad Pitt'])
m.save
