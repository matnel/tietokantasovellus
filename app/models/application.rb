class Application < ActiveRecord::Base

  has_many :comments
  has_many :data_entries

  mount_uploader :appimage, ImageUploader
  mount_uploader :appexecutable, ExecutableUploader

end
