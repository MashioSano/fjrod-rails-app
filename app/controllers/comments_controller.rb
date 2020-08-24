# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @comments = @commentable.comments
  end

  def show; end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save
      flash[:notice] = t 'flash.create'
      redirect_to [@commentable, @comment]
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:notice] = t 'flash.update'
      redirect_to [@commentable, @comment]
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = t 'flash.destroy'
    redirect_to [@commentable, :comments]
  end

  private

  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description)
  end

  def correct_user
    redirect_to [@commentable, @comment] unless current_user == @comment.user
  end
end
