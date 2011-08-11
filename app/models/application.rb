class Application < ActiveRecord::Base

  has_many :comments
  has_many :data_entries

  mount_uploader :appimage, ImageUploader
  mount_uploader :appexecutable, ExecutableUploader

  def has_comments?
     return comments.empty?
  end

  def data_number_of_entries(tag)
      return data_entries_with_tag( tag ).length
  end

  def data_number_of_ids(tag)
      return data_entries_with_tag( tag ).group( :id ).length
  end

  private

  def data_entries_with_tag( tag )
      return data_entries.where( :key => tag )
  end

end
