FactoryBot.define do
  factory :imc do
    height { Faker::Number.number(10) }
    weight { Faker::Number.number(10) }
  end
end