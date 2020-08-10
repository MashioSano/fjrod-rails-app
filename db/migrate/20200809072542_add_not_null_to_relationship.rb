# frozen_string_literal: true

class AddNotNullToRelationship < ActiveRecord::Migration[6.0]
  def up
    change_column :relationships, :following_id, :integer, null: false
    change_column :relationships, :follower_id, :integer, null: false
  end

  def down
    change_column :relationships, :following_id, :integer, null: true
    change_column :relationships, :follower_id, :integer, null: true
  end
end
