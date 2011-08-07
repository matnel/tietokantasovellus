class AddImageToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :appimage, :string
  end
end
