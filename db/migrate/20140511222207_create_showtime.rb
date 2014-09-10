class CreateShowtime < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.belongs_to    :movie
      t.belongs_to    :theatre
      t.integer       :start_time

      t.timestamps
    end
  end
end
