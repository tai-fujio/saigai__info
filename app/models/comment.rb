class Comment < ApplicationRecord
  belongs_to :site
  has_one :review ,dependent: :destroy
end
