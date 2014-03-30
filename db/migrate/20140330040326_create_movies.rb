class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  'description'
      t.string  'title'
      t.time    'duration'

      t.timestamps
    end
  end
end
