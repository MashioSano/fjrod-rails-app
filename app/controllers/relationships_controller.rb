# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.follow(user) unless user == current_user
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to user_path(params[:user_id])
  end
end
