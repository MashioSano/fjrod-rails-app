# frozen_string_literal: true

class AddNotNullToComment < ActiveRecord::Migration[6.0]
  def up
    change_column :comments, :description, :text, null: false
  end

  def down
    change_column :comments, :description, :text, null: true
  end
end
