class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :title
      t.text :description
      t.decimal :version

      t.timestamps
    end
  end
end
