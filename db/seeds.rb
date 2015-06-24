# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Instrument.create!(name: 'Guitarra')
Instrument.create!(name: 'Bajo')
Instrument.create!(name: 'Bateria')
Instrument.create!(name: 'Voz')
Instrument.create!(name: 'Piano')

MusicalStyle.create!(name: 'Rock')
MusicalStyle.create!(name: 'Pop')
MusicalStyle.create!(name: 'Metal')
MusicalStyle.create!(name: 'Electro')

joeUser = User.new(
  :email                 => "bandjoe@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
joeUser.add_role :admin
joeUser.save!
joeProfile = joeUser.profile

joeProfile.instrument_ids=[1,3,4]
joeProfile.musical_style_ids=[2,4]

janeUser = User.new(
  :email                 => "jane@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
janeUser.save!
janeUser.profile.instrument_ids=[2,5,4]

Band.create!(
	name: 'band of joe',
	creation_date: Date.parse("2010-05-02"),
	mail: 'bandjoe@example.com',
	creator:joeUser,
	musical_style_ids: [1,3]
)

Band.create!(
	name: 'band of jane',
	creation_date: Date.parse("2012-10-31"),
	mail: 'jane@example.com',
	creator:janeUser,
	musical_style_ids: [2,4]
)

Band.create!(
	name: 'the jane',
	creation_date: Date.parse("2014-07-03"),
	mail: 'jane@example.com',
	creator:janeUser,
	musical_style_ids: [1,2]
)
Band.create!(
	name: 'jane and joe',
	creation_date: Date.parse("2015-06-20"),
	mail: 'bandjoe@example.com',
	creator:joeUser,
	musical_style_ids: [1,2,3,4]
)
