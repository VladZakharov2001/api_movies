class CreateFilters < ActiveRecord::Migration[6.1]
  def change
    create_table :ganres do |t|
      t.belongs_to :user, foreign_key: true
      t.string :ganre
      t.timestamps
    end
  end
end
