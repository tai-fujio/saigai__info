class Site < ApplicationRecord
  belongs_to :map
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :latitude, presence: true, uniqueness:{ scope: [:longitude] }
  validates :longitude, presence: true, uniqueness:{ scope: [:latitude] }
  validates :title, presence: true,length:{maximum:20}, on: :update
  before_destroy :cannot_delete_first_site

  def cannot_delete_first_site
    @site = Site.find(id)
    @map = Map.find(map_id)
    throw(:abort) if @site == @map.sites.first
  end
end
