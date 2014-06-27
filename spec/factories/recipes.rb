# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do |f|
    f.title "New York strip"
    f.body "Meat, Heat, Eat."  
  end
end
