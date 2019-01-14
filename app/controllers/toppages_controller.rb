class ToppagesController < ApplicationController

  def index
    @tweets = Tweet.all
  end

end
