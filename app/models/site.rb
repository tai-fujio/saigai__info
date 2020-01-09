class Site < ApplicationRecord
  belongs_to :map
  has_many :comments, dependent: :destroy
  default_scope { order(created_at: :asc) }
  validates :name, presence: true
  validates :latitude, presence: true, uniqueness:{ scope: [:longitude] }
  validates :longitude, presence: true, uniqueness:{ scope: [:latitude] }
  validates :title, presence: true,length:{maximum:200}, on: :update
end
