class AddApplicationToDataEntry < ActiveRecord::Migration
  def change
    add_column :data_entries, :application_id, :integer
  end
end
