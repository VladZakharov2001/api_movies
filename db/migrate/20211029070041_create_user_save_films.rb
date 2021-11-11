class CreateUserSaveFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_save_films do |t|
      t.belongs_to :user
      t.belongs_to :save_film
      t.boolean :is_watched ,default: false
      t.timestamps
    end
  end
end
