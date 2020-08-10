# frozen_string_literal: true

module Users
  class FollowingsController < ApplicationController
    def index
      user = User.find(params[:user_id])
      @followings = user.followings
    end
  end
end
