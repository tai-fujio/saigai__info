class Key < ApplicationRecord
  belongs_to :review
  validates :value, uniqueness:{ scope: :review_id }, presence: true
end
