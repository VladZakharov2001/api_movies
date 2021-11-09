class CreateSaveFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :save_films do |t|
      t.integer :external_film_id
      t.timestamps
    end
  end
end
