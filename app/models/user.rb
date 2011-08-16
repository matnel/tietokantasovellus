require "digest/md5"

class User < ActiveRecord::Base

  def check_password?( password )
	@password == Digest::MD5.hexdigest( password + @@salt )
  end

  def password( password )
        @password = Digest::MD5.hexdigest( password + @@salt )
  end

  private
   @@salt = "mun_hyvin_salainen_suola_1234"

end
