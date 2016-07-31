FactoryGirl.define do

  factory :user  do
    email { Faker::Internet.email }
    password "password"

    transient do
      note_count   5
    end

    factory :user_with_notes do
      after(:create) do |job, evaluator|
        evaluator.note_count.times do
          job.notes << create(:note)
        end
      end
    end
  end
end
