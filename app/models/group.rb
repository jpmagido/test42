class Group < ApplicationRecord
  has_many :memberships, dependent: :delete_all#, validate: false
  belongs_to :user
  validates :title, presence: true
  validates :title, length: { minimum: 3 }
end
