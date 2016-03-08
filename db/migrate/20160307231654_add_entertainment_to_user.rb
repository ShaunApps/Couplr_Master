class AddEntertainmentToUser < ActiveRecord::Migration
  def change
    add_column :users, :amusementparks, :boolean
    add_column :users, :artgalleries, :boolean
    add_column :users, :bars, :boolean
    add_column :users, :comedyevents, :boolean
    add_column :users, :concerts, :boolean
    add_column :users, :conventions, :boolean
    add_column :users, :dancing, :boolean
    add_column :users, :exhibits, :boolean
    add_column :users, :festivals, :boolean
    add_column :users, :livemusic, :boolean
    add_column :users, :lounges, :boolean
    add_column :users, :movies, :boolean
    add_column :users, :museums, :boolean
    add_column :users, :nightclubs, :boolean
    add_column :users, :performingarts, :boolean
    add_column :users, :theatre, :boolean
  end
end
