require "digest/md5"

class User < ActiveRecord::Base

  validates_uniqueness_of :username
 
  def check_password?( password )
	@password == Digest::MD5.hexdigest( password + @@salt )
  end

  def password( password = '' )
        @password = Digest::MD5.hexdigest( password + @@salt )
  end

  private
   @@salt = "mun_hyvin_salainen_suola_1234"

end
