class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
