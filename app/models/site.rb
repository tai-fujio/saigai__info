class Site < ApplicationRecord
  belongs_to :map
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :latitude, presence: true, uniqueness:{ scope: :longitude }
  validates :longitude, presence: true
  validates :title, presence: true,length:{maximum:20}, on: :update
end
