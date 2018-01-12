class User < ApplicationRecord
  has_many :wikis

  after_initialize { self.role ||= :standard }


  enum role: [:standard, :premium, :admin]
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
end
