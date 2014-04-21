class CreateTheatre < ActiveRecord::Migration
  def change
    create_table :theatres do |t|
      t.integer   :zip_code
      t.string    :title
      t.string    :address

      t.timestamps
    end
  end
end
