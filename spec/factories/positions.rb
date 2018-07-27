
FactoryBot.define do
  factory :position do
    name {Faker::Job.position}
    short_name {Faker::Name.initials(3)}
    description {Faker::Lorem.sentence}
  end

  factory :invalid_position, parent: :position do
    name { nil }
  end
end
