class AddDiningToUser < ActiveRecord::Migration
  def change
    add_column :users, :african, :boolean
    add_column :users, :american, :boolean
    add_column :users, :asian, :boolean
    add_column :users, :coffee, :boolean
    add_column :users, :european, :boolean
    add_column :users, :mexican, :boolean
    add_column :users, :southamerican, :boolean
    add_column :users, :willeatanything, :boolean
    add_column :users, :wine, :boolean
  end
end
