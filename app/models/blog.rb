class Blog < ApplicationRecord
  acts_as_taggable

  has_many :comments, dependent: :destroy

  def set_pin_flag
    Blog.update_all(is_pin: false)
    update(is_pin: true)
  end
end
