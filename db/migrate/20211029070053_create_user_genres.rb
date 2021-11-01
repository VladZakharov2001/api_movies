class CreateUserGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :user_genres do |t|
      t.belongs_to :user
      t.belongs_to :genre
      t.timestamps
    end
  end
end
