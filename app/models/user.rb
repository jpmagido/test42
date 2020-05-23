class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :delete_all#, validate: false
  has_many :memberships, dependent: :delete_all#, validate: false
  has_many :groups, dependent: :delete_all#, validate: false
end
