class AddExtraToUser < ActiveRecord::Migration
  def change
    add_column :users, :smoking, :boolean
    add_column :users, :children, :boolean
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country_location, :string
    add_column :users, :zip_code, :string
    add_column :users, :lat, :float
    add_column :users, :lng, :float
    add_column :users, :profile_pic, :string
  end
end
