class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :movie_id
      t.integer :user_id

      t.timestamps

    end
  end
end
