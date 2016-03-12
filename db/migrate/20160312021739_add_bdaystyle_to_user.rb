class AddBdaystyleToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthday_one, :date
    add_column :users, :birthday_two, :date
  end
end
