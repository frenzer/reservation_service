class CommentsController < ApplicationController
  load_and_authorize_resource except: [:new, :create]
  before_action :set_room
  before_action :authorize_create_comment, only: [:new, :create]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment      = Comment.new(comment_params)
    @comment.room = @room
    @comment.user = current_user

    respond_to do |format|
      if Builders::CommentBuilder.new(@comment).save
        format.html { redirect_to @room, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @room, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @room, notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  def authorize_create_comment
    authorize! :create_comment, @room
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
