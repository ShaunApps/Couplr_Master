class AddSportsToUser < ActiveRecord::Migration
  def change
    add_column :users, :badmitten, :boolean
    add_column :users, :baseball, :boolean
    add_column :users, :basketball, :boolean
    add_column :users, :camping, :boolean
    add_column :users, :cycling, :boolean
    add_column :users, :fishing, :boolean
    add_column :users, :fitness, :boolean
    add_column :users, :football, :boolean
    add_column :users, :gardening, :boolean
    add_column :users, :golf, :boolean
    add_column :users, :gym, :boolean
    add_column :users, :hiking, :boolean
    add_column :users, :hockey, :boolean
    add_column :users, :hunting, :boolean
    add_column :users, :kayaking, :boolean
    add_column :users, :paddleboarding, :boolean
    add_column :users, :picnics, :boolean
    add_column :users, :running, :boolean
    add_column :users, :ski, :boolean
    add_column :users, :snowboard, :boolean
    add_column :users, :soccer, :boolean
    add_column :users, :swimming, :boolean
    add_column :users, :tennis, :boolean
    add_column :users, :walking, :boolean
  end
end
