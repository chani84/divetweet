class ToppagesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tweet = Tweet.all.order("created_at DESC").limit(8)
    @user = User.all.order("created_at DESC").limit(8)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @image_top = @tweet.images.first(1)
    @image_bottom = @tweet.images
    @comments = @tweet.comments.includes(:user)
  end

  private
  def move_to_index
    redirect_to index: :action unless user_signed_in?
  end

end
