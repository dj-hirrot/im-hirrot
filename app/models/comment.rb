class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  validates :author, presence: true
  validates :content, presence: true
end
