# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
  FactoryGirl.create(:user_with_notes)
end


40.times do
  FactoryGirl.create(:tag)
end

Note.all.each do |note|
  5.times do
    note.tags << Tag.find(rand(40)+1)
  end
end
