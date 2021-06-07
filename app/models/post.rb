class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 100 }

  belongs_to :user
end
