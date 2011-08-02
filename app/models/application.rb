class Application < ActiveRecord::Base

  has_many :comments
  has_many :data_entries

end
