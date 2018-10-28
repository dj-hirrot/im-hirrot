class Blog < ApplicationRecord
  before_save :set_pin_flag
  acts_as_taggable

  def set_pin_flag
    return if is_pin == false
    Blog.update_all(is_pin: false)
  end
end
