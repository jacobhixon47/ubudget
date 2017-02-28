class User < ApplicationRecord
  validates :username, :email, :funds, :presence => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :transactions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
