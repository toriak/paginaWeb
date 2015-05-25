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
joeUser.add_role :admin
joeUser.save!

janeUser = User.new(
  :email                 => "jane@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
janeUser.save!

Band.create!(name: 'band of joe', creation_date: Date.parse("2010-05-02") , mail: 'bandjoe@example.com',creator:joeUser)
Band.create!(name: 'band of jane', creation_date: Date.parse("2012-10-31"), mail: 'jane@example.com',creator:janeUser)
Band.create!(name: 'the jane', creation_date: Date.parse("2014-07-03"), mail: 'jane@example.com',creator:janeUser)
Band.create!(name: 'jane and joe', creation_date: Date.parse("2015-06-20") , mail: 'bandjoe@example.com',creator:joeUser)
