# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def build_resource(hash = {})
      hash[:uid] = User.create_unique_string
      super
    end
  end
end
