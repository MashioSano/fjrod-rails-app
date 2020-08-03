# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def build_resource(hash = {})
      hash[:uid] = User.create_unique_string
      super
    end

    protected

    def update_resource(resource, params)
      if params[:password].present? && params[:password_confirmation].present?
        resource.update(params)
      else
        resource.update_without_password(params)
      end
    end
  end
end
