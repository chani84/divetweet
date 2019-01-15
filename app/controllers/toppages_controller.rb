class ToppagesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.all
  end

  private
  def move_to_index
    redirect_to index: :action unless user_signed_in?
  end

end
