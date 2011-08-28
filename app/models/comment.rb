class Comment < ActiveRecord::Base

   belongs_to :application

   validates_presence_of :comment

end
