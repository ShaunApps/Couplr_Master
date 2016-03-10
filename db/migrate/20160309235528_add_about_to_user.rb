class AddAboutToUser < ActiveRecord::Migration
  def change
    add_column :users, :about_us, :text
    add_column :users, :ideal_friends, :text

  end
end
