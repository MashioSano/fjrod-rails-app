# frozen_string_literal: true

class AddOmniauthColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :provider, :string, null: false, default: ''
  end
end
