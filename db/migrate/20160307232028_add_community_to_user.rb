class AddCommunityToUser < ActiveRecord::Migration
  def change
    add_column :users, :communityservices, :boolean
    add_column :users, :earlybirds, :boolean
    add_column :users, :environments, :boolean
    add_column :users, :geeksandnerds, :boolean
    add_column :users, :localpolitics, :boolean
    add_column :users, :nightowls, :boolean
    add_column :users, :paleo, :boolean
    add_column :users, :philanthropy, :boolean
    add_column :users, :vegan, :boolean
    add_column :users, :vegetarian, :boolean
    add_column :users, :volunteer, :boolean
  end
end
