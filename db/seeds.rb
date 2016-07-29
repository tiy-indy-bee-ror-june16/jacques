# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = 10.times.map do
  User.create!(
    username: Faker::Internet.user_name(nil, %w(_-)),
    email: Faker::Internet.safe_email,
    password: "password",
    password_confirmation: "password",
    created_at: Faker::Time.between(8.months.ago, 7.months.ago, :all)
  )
end

tag = 12.times do
  Tag.create!(
    name: Faker::Book.genre
  )
end

50.times do
  note = Note.create!(
    title: Faker::Beer.name,
    body: Faker::Hipster.paragraphs(5),
    user: user.sample,
    created_at: Faker::Time.between(6.months.ago, Date.today, :all),
  )
  2.times do
    note.tags << Tag.all.sample
  end

end
