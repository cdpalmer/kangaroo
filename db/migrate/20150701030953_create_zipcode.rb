class CreateZipcode < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.string :value
    end
  end
end
