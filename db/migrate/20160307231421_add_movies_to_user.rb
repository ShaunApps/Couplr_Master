class AddMoviesToUser < ActiveRecord::Migration
  def change
    add_column :users, :action, :boolean
    add_column :users, :adventure, :boolean
    add_column :users, :animation, :boolean
    add_column :users, :comedy, :boolean
    add_column :users, :documentary, :boolean
    add_column :users, :drama, :boolean
    add_column :users, :family, :boolean
    add_column :users, :horror, :boolean
    add_column :users, :musical, :boolean
    add_column :users, :mystery, :boolean
    add_column :users, :romance, :boolean
    add_column :users, :scifi, :boolean
    add_column :users, :western, :boolean
  end
end
