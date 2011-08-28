class DataEntry < ActiveRecord::Base

   belongs_to :application

   validates_presence_of :uid
   validates_presence_of :key

end
