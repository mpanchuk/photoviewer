class CommentsController < ApplicationController

  def index
    @comments = Comment.for_photo params[:photo_id]
    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def create
    @comment = current_user.comments.new permited_params
    if @comment.save
      respond_to do |format|
        format.html
        format.json { render json: @comment }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: @comment.errors.full_messages }
      end
    end
  end

  private

  def permited_params
    params[:comment].permit :body, :photo_id, :user_id
  end

end