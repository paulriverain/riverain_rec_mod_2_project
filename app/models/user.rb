class User < ApplicationRecord
  has_many :reservations
  has_many :trips, through: :reservations

  validates :user_name, presence: true #username must be same
  # validates :password, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }


  validate :not_empty

  def not_empty
    if self.user_name
      if self.user_name == ""
        errors.add(:user_name, " must be filled out.")
      end
    end
  end


end
