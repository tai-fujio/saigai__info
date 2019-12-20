class Site < ApplicationRecord
  belongs_to :map
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :latitude, presence: true, uniqueness:{ scope: :longitude }
  validates :longitude, presence: true
  validates :title, length:{minimum:6,maximum:20}
end
