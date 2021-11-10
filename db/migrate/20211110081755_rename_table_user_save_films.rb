class RenameTableUserSaveFilms < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_save_films, :favorite_user_films
  end
end
