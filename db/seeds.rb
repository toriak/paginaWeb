# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
joeUser = User.new(
  :email                 => "bandjoe@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)

joeUser.save!

janeUser = User.new(
  :email                 => "jane@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
janeUser.save!

#Band.create!(name: 'bandjoe', creation_date: Time.now, mail: 'bandjoe@example.com',creator:joeUser)
Band.create!(name: 'bandajoe', creation_date: Date.parse("2014-10-31"), mail: 'bandjoe@example.com',creator:joeUser)
Band.create!(name: 'bandditajoe', creation_date: Date.parse("2010-10-31"), mail: 'jane@example.com',creator:janeUser)