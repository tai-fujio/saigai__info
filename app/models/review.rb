class Review < ApplicationRecord
  belongs_to :comment
  has_many :keys, dependent: :destroy
end
