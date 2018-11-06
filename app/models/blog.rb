class Blog < ApplicationRecord
  acts_as_taggable

  has_many :comments, dependent: :destroy

  scope :not_pined, -> { where.not(is_pin: true) }

  SCOPES = {
    '全体' => 0,
    '登録済' => 1,
  }
end
