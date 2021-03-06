class Application < ActiveRecord::Base

  has_many :comments
  has_many :data_entries

  mount_uploader :appimage, ImageUploader
  mount_uploader :appexecutable, ExecutableUploader

  belongs_to :user

  validates_presence_of :name
  validates :version,  :numericality => true

  def has_comments?
     return comments.empty?
  end

  def data_number_of_entries(tag)
      data_entries_with_tag( tag ).length
  end

  def data_number_of_ids(tag)
      data_entries_with_tag( tag ).group( :uid )
  end

  private

  def data_entries_with_tag( tag )
      data_entries.where( :key => tag )
  end

end
