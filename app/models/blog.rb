class Blog < ApplicationRecord
  before_save :set_pin_flag
  acts_as_taggable

  has_many :comments, dependent: :destroy

  def set_pin_flag
    return if !is_pin || is_pin.nil?
    InfoMailer.blog_unpined.deliver_now
    Blog.update_all(is_pin: false)
  end
end
