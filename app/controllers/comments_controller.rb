class CommentsController < ApplicationController

  def index
    @comments = Comment.new.includes(:user, :tweet)
    # @comments = @comment.includes(:user,:tweet)
    respond_to do |format|
      format.html
      format.json{ @new_comment = @comment.where("id > ?", params[:id])}
    end
  end

  def create
    # @tweet = Tweet.find(params[:tweet_id]) #①
    # @comment = @tweet.comments.build(comment_params) #②
    # @comment.user_id = current_user.id #③
    # if @comment.save
    #   respond_to do |format|
    #     format.html { redirect_to tweet_path(params[:tweet_id])  }
    #     format.json
    # end
    # binding.pry
    @comment = Comment.create(comment_params)
    # binding.pry

      respond_to do |format|
        format.html { redirect_to tweet_path(params[:tweet_id])  }
        format.json
      end

# Comment.create(comment_params)

# def comment_params

# params~~~~~.merge(user_id: current_user.id)

    # @comment = Comment.new(comment_params)
    # binding.pry
    #   if @comment.save
    #     respond_to do |format|
    #       format.html { redirect_to tweet_path(params[:tweet_id])  }
    #       format.json
    #     end
    #   else
    #     flash.now[:alert] = 'NEED COMMENT'
    #     render :index
    #   end
  end

  private

  def comment_params
    params.permit(:content, :tweet_id).merge(user_id: current_user.id)
    # params.require(:comment).permit(:comment_content, :post_id, :user_id)
  end

end
