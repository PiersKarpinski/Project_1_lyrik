class AddLyrikToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :lyrik, :text
  end
end
