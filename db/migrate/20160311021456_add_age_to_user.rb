class AddAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :age_one, :integer
    add_column :users, :age_two, :integer
  end
end
