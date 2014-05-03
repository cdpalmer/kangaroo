class AddRemoteIdToTheatres < ActiveRecord::Migration
  def change
    add_column :theatres, :remote_id, :integer
  end
end
