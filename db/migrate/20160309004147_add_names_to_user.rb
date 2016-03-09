class AddNamesToUser < ActiveRecord::Migration
  def change
    add_column :users, :partner_one_name, :string
    add_column :users, :partner_two_name, :string
  end
end
