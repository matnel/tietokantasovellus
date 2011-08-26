class AddUidToDataEntries < ActiveRecord::Migration
  def change
    add_column :data_entries, :uid, :string
  end
end
