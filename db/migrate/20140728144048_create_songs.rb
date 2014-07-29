class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :user_id
      t.float :rating

      t.timestamps
    end
  end
end
