# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]

  has_one_attached :image

  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id, dependent: :destroy, inverse_of: :following
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy, inverse_of: :follower
  has_many :followers, through: :passive_relationships, source: :following

  has_many :reports, dependent: :destroy

  has_many :books, dependent: :destroy

  validates :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def follow(user)
    return if id == user.id

    follow = active_relationships.build(follower_id: user.id)
    follow.save
  end

  def unfollow(user)
    follow = active_relationships.find_by(follower_id: user.id)
    follow.destroy
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
