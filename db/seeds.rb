# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do
  User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
  puts "lets go"
end

Tag.create(name: "Sports")
Tag.create(name: "Outdoors")
Tag.create(name: "Romance")
Tag.create(name: "Politics")
Tag.create(name: "Local")
Tag.create(name: "Religion")
Tag.create(name: "Food")
Tag.create(name: "Art")
Tag.create(name: "Social")
Tag.create(name: "The Home")
Tag.create(name: "Money")


100.times do
  note = Note.new(title: Faker::Book.title, body: Faker::Hipster.paragraphs((1..8).to_a.sample).join("\n"), user_id: (1..10).to_a.sample, created_at:Faker::Time.between(DateTime.now - 500, DateTime.now))
  (1..4).to_a.sample.times do
    note.tags << Tag.offset(rand(Tag.count)).first
    puts "hi"
  end
  note.save
end
