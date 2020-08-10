# frozen_string_literal: true

module Users
  class FollowingsController < ApplicationController
    PAGE_MAX_USER = 10
    def index
      user = User.find(params[:user_id])
      @followings = user.followings.page(params[:page]).per(PAGE_MAX_USER)
    end
  end
end
