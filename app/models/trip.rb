class Trip < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :guide_comp

end
