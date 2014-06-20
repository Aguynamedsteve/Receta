class Recipe < ActiveRecord::Base
  validates :title, length: { minimum: 3 }, presence: true
end
