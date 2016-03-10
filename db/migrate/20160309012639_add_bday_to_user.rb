class AddBdayToUser < ActiveRecord::Migration
  def change
    add_column :users, :ponebmonth, :integer
    add_column :users, :ptwobmonth, :integer
    add_column :users, :ponebday, :integer
    add_column :users, :ptwobday, :integer
    add_column :users, :ponebyear, :integer
    add_column :users, :ptwobyear, :integer
    add_column :users, :relationship_status, :string
    add_column :users, :we_are_a, :string
    add_column :users, :we_are_looking_for, :string
    add_column :users, :street_number, :string
    add_column :users, :have_kids, :boolean
  end
end
