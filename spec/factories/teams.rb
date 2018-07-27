FactoryBot.define do
  factory :team do
    sequence :name do |n|
      "team 0#{n}"
    end
  end
end
