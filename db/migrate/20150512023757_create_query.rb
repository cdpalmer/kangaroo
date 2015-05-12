class CreateQuery < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.integer :zip_code

      t.timestamps
    end
  end
end
