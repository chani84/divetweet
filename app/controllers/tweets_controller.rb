class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
    @tweet.images.build
  end

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save!
      redirect_to root_path, notice: "REGIST TWEET COMPLETE"
    else
      render :index, alert: "FAILED"
    end
  end

  def edit
    @tweet = Tweet.find_by(id: params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.user.id != current_user.id
      flash[:notice] = "Permission is granted"
    elsif @tweet.update(tweet_params)
      flash[:notice] = "Edit Complete"
    else
      flash[:notice] = "Edit Failed"
    end
    redirect_to root_path
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.user.id != current_user.id
      flash[:notice] = "Permission is granted"
    elsif @tweet.destroy
      flash[:notice] = "Delete Complete"
    else
      flash[:notice] = "Delete Failed"
    end
    redirect_to root_path
  end

  def search
    # @tweet = Tweet.find(params[:id])
    @tweet = Tweet.where("name LIKE(?) OR content LIKE(?) OR dive_point LIKE(?)", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%").limit(8)
    @q = Tweet.ransack(params[:id])
    @tweet_search = @q.result.page(params[:page])

    case params[:sort]
    when 'old_date' then
      @tweets = @tweet_search.order(date: "ASC")
    when 'new_date' then
      @tweets = @tweet_search.order(date: "DESC")
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:name, :content, :date, :dive_point, :temperature, :water_temperature, :water_opacity, :depth_average, :suit, :licence)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # def move_to_index
  #   redirect_to action: "index" unless user_signed_in?
  # end
end
