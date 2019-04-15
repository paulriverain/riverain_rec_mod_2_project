class User < ApplicationRecord
  has_many :reservations
  has_many :trips, through: :reservations

  validates :user_name, presence: true #username must be same


end
