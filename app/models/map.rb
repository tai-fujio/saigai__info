class Map < ApplicationRecord
  has_secure_password
  has_many :sites ,dependent: :destroy
  default_scope { order(name: :asc) }
  validates :name, uniqueness: true, presence: true
  validates :password, presence: true,length:{minimum:6,maximum:20}
  validates :creater, length:{maximum:40}
end
