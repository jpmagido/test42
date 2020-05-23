class Group < ApplicationRecord
  has_many :memberships
  validates :title, presence: true
  validates :title, length: { minimum: 3 }
end
