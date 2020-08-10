# frozen_string_literal: true

module Users
  class FollowersController < ApplicationController
    def index
      user = User.find(params[:user_id])
      @followers = user.followers
    end
  end
end
