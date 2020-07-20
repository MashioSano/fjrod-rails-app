# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :title, presence: true
  validates :memo, presence: true
  paginates_per 5
end
