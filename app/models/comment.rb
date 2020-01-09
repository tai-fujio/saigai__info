class Comment < ApplicationRecord
  belongs_to :site
  has_one :review ,dependent: :destroy
  default_scope { order(created_at: :desc) }
  validates :content, length: {maximum:240}, presence: true
end
