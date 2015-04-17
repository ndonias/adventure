# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_ids = User.pluck(:id)

["Anyone down for a bike ride in central park?",
"I'm a huge fan of rock climbing, let's go this weekend?",
"Spring is here and so is marathon season, any other runners out there?",
"Preparing for my first ironman, anyone have any tips?",
"Anyone crazy enough to do ninja warrior with me!"].each_with_index do |msg, i|
  StatusMessage.create!(user_id: user_ids[i], body: msg)
end