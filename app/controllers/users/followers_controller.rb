# frozen_string_literal: true

module Users
  class FollowersController < ApplicationController
    PAGE_MAX_USER = 10
    def index
      user = User.find(params[:user_id])
      @followers = user.followers.page(params[:page]).per(PAGE_MAX_USER)
    end
  end
end
