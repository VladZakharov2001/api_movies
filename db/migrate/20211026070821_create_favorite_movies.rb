class CreateFavoriteMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_movies do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :id_film
      t.boolean :is_watched
      t.timestamps
    end
  end
end
