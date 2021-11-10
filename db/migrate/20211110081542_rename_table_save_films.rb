class RenameTableSaveFilms < ActiveRecord::Migration[6.1]
  def change
      rename_table :save_films, :favorite_films
  end
end
