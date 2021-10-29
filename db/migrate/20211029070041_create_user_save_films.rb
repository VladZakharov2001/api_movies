class CreateUserSaveFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_save_films do |t|
      t.belongs_to :user
      t.belongs_to :save_film
      t.timestamps
    end
  end
end
