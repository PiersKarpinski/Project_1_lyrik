class AddPersonaliseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :personalise, :text
  end
end
