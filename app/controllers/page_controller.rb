class PageController < ApplicationController
  before_action :user_confirmed?
  def top
    @languages = Skill.where(skill_type: 'language').order(level: :desc)
    @ades = Skill.where(skill_type: 'ade').order(level: :desc)
    @tools = Skill.where(skill_type: 'tool').order(level: :desc)
    @frame_works = Skill.where(skill_type: 'fw').order(level: :desc)
  end
end
