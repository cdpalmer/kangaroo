class CreateShowtime < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.string        :start_time
      t.integer       :theatre_id
      t.integer       :movie_id

      t.timestamps
    end
  end
end
