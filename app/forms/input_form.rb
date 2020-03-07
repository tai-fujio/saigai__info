class InputForm
  include ActiveModel::Model

  attr_accessor :place

  validates :place, presence: true

end
