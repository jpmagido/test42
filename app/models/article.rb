class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { minimum: 3 }
  validates :content, length: { minimum: 10 }
end
