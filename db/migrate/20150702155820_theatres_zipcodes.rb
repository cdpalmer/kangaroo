class TheatresZipcodes < ActiveRecord::Migration
  def change
    create_table :theatres_zipcodes do |t|
      t.belongs_to :zipcode, index: :true
      t.belongs_to :theatre, index: :true
    end
  end
end
