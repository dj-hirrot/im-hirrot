class Comment < ApplicationRecord
  belongs_to :blog

  validates :author, presence: true
  validates :content, presence: true
end
