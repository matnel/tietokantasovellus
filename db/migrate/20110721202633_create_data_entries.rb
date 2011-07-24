class CreateDataEntries < ActiveRecord::Migration
  def change
    create_table :data_entries do |t|
      t.integer :id
      t.timestamp :time
      t.string :key

      t.timestamps
    end
  end
end
