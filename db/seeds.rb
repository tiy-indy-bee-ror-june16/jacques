# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tag = 12.times do
  Tag.create!(
    name: Faker::Hipster.word
  )
end

50.times do
  note = Note.create!(
    title: Faker::Beer.name,
    body: Faker::Hipster.paragraphs(5).join("\n\n"),
    created_at: Faker::Time.between(6.months.ago, Date.today, :all),
  )
  2.times do
    note.tags << Tag.all.sample
  end

end
