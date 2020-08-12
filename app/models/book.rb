# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true
  validates :memo, presence: true
  paginates_per 5
end
