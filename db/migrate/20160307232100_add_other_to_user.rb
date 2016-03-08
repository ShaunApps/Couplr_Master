class AddOtherToUser < ActiveRecord::Migration
  def change
    add_column :users, :artist, :boolean
    add_column :users, :artsandcrafts, :boolean
    add_column :users, :billiards, :boolean
    add_column :users, :boardgames, :boolean
    add_column :users, :boats, :boolean
    add_column :users, :books, :boolean
    add_column :users, :cars, :boolean
    add_column :users, :cooking, :boolean
    add_column :users, :fashion, :boolean
    add_column :users, :kidsplaydates, :boolean
    add_column :users, :learningandclasses, :boolean
    add_column :users, :musician, :boolean
    add_column :users, :parenting, :boolean
    add_column :users, :photography, :boolean
    add_column :users, :politics, :boolean
    add_column :users, :traveling, :boolean
    add_column :users, :videogames, :boolean
  end
end
