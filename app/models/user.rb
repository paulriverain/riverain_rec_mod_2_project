require 'bcrypt'

class User < ApplicationRecord
  has_many :reservations
  has_many :trips, through: :reservations



  has_secure_password #for now keep here but may want in ApplicationRecord for companies

  validates :user_name, presence: true, uniqueness: true
  # validates :password, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  # validates :password, presence: true

  # validate :not_empty
  #
  # def not_empty
  #   if self.user_name
  #     if self.user_name == ""
  #       errors.add(:user_name, " must be filled out.")
  #     end
  #   end
  # end


end
