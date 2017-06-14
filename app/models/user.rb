class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  validates :username, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only allows letters" }, length: {minimum: 6, message: "Must be minimum of 6 characters" }


  has_many :links
end
