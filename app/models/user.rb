class User < ApplicationRecord
  validates :username, :email, :presence => true

  # Many_to_many with categories via transactions
  has_many :transactions
  has_many :categories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def after_database_authentication
    Goal.update_spending
  end

end
