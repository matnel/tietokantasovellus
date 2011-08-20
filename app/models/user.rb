require "digest/md5"

class User < ActiveRecord::Base

  validates_uniqueness_of :username

   before_save :encrypt 

  def check_password?( password )
	self.password == Digest::MD5.hexdigest( password + @@salt )
  end

  def encrypt()
        self.password = Digest::MD5.hexdigest( self.password + @@salt )
  end

  private
   @@salt = "mun_hyvin_salainen_suola_1234"

end
