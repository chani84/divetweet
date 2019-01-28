class TweetForm
  include ActiveModel::Model #テーブルは持ちませんがApplicationRecordのsaveメソッドなどを提供します

  attr_accessor :name, :content, :date, :dive_point, :temperature, :water_temperature, :water_opacity, :depth_average, :suit, :licence, :image

  validates :name, :content, presence: true

  def save
    return false if invalid? #バリデーションを追加する場合はここに追加します

    tweet = Tweet.new(:name, :content, :date, :dive_point, :temperature, :water_temperature, :water_opacity, :depth_average, :suit, :licence).merge(user_id: current_user.id)
    tweet.images.new(:image) #この処理をimageの分だけループすれば複数保存も出ます
    tweet.save
  end
end


class TweetsController < ApplicationController
  def new
    # @tweet = Tweet.new
    # @tweet.images.build
    @tweet_form = TweetForm.new #formオブジェクトパターンのためのクラスをviewでformに渡します
  end

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def create
    # @tweet = Tweet.create(tweet_params)
    # # binding.pry
    # if @tweet.save
    #   redirect_to root_path, notice: "REGIST TWEET COMPLETE"
    # else
    #   render :new, alert: "FAILED"
    # end
    @tweet_form = TweetForm.new(tweet_params)
    if @tweet_form.save
      redirect_to root_path
    else
      render :new
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
    # params.require(:tweet).permit(:name, :content, :date, :dive_point, :temperature, :water_temperature, :water_opacity, :depth_average, :suit, :licence, images_attributes: [:image]).merge(user_id: current_user.id)
    params.require(:tweet).permit(:name, :content, :date, :dive_point, :temperature, :water_temperature, :water_opacity, :depth_average, :suit, :licence, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
