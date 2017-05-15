class Kitten < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :age, presence: true
  validates :cuteness, presence: true
  validates :softness, presence: true
end
