class AddMusicToUser < ActiveRecord::Migration
  def change
    add_column :users, :blues, :boolean
    add_column :users, :country, :boolean
    add_column :users, :disco, :boolean
    add_column :users, :electronic, :boolean
    add_column :users, :hiphop, :boolean
    add_column :users, :jazz, :boolean
    add_column :users, :latin, :boolean
    add_column :users, :pop, :boolean
    add_column :users, :rnb, :boolean
    add_column :users, :rap, :boolean
    add_column :users, :rock, :boolean
    add_column :users, :topforty, :boolean
  end
end
