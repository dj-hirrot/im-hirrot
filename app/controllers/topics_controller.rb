class TopicsController < ApplicationController
  before_action :is_admin?
  before_action :set_topic, only: [:destroy]

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to blogs_path, notice: '新着情報を追加しました'
    else
      redirect_to blogs_path, alert: '新着情報の追加に失敗しました'
    end
  end

  def destroy
    @topic.destroy
    redirect_to blogs_url, notice: '新着情報を削除しました'
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title)
    end
end
