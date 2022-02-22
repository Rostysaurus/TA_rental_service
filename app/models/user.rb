class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :tas, through: :bookings
<<<<<<< HEAD

=======
>>>>>>> 119961eae59e859bf0e3c80e998a0a4a9ee25fc1
end
