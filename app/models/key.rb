class Key < ApplicationRecord
  belongs_to :review
  validates :value, uniqueness: true, presence: true
end
