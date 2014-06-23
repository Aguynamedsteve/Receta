# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do |f|
    f.title { Faker::word.title }  
    f.body { Faker::paragraph.title }  
  end
end
