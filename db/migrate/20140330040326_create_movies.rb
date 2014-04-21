class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.belongs_to :theatre
      t.string  :description
      t.string  :title
      t.integer :duration
      t.integer :theatre_id

      t.timestamps
    end
  end
end
