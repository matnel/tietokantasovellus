class AddApplicationToComment < ActiveRecord::Migration
  def change
    add_column :comments, :application, :integer
  end
end
