class Blog < ApplicationRecord
  before_save :set_pin_flag
  acts_as_taggable

  def set_pin_flag
    return if !is_pin || is_pin.nil?
    Blog.update_all(is_pin: false)
  end
end
