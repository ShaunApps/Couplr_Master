class AddPetsToUser < ActiveRecord::Migration
  def change
    add_column :users, :dogs, :boolean
    add_column :users, :cats, :boolean
    add_column :users, :birds, :boolean
    add_column :users, :reptiles, :boolean
    add_column :users, :fish, :boolean
  end
end
