class RenameColumnSaveFilms < ActiveRecord::Migration[6.1]
  def change
    rename_column :favorite_user_films, :save_film_id, :favorite_film_id
  end
end
