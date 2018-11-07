class Blog < ApplicationRecord
  acts_as_taggable

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fav_users, through: :favorites, source: :user

  scope :not_pined, -> { where.not(is_pin: true) }

  SCOPES = {
    '全体' => 0,
    '登録済' => 1,
  }

  def fav(user)
    favorites.create(user_id: user.id)
  end

  def un_fav(user)
    favorites.find_by(user_id: user.id).destroy
  end

  def fav?(user)
    fav_users.include?(user)
  end
end
