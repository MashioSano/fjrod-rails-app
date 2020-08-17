# frozen_string_literal: true

class AddNotNullToReport < ActiveRecord::Migration[6.0]
  def up
    change_column :reports, :title, :string, null: false
    change_column :reports, :body, :text, null: false
  end

  def down
    change_column :reports, :title, :string, null: true
    change_column :reports, :body, :text, null: true
  end
end
