class AddExecutableToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :appexecutable, :string
  end
end
