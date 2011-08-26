require "digest/md5"

class User < ActiveRecord::Base

  validates_uniqueness_of :username

  attr_accessor :password_confirm

  validate :passwords_are_same

  before_save :encrypt

  def passwords_are_same
     if password != password_confirm
        errors.add( :password, "must be same" )
        errors.add( :password_confirm, "must be same" )
     end
  end

  def name()
    firstname + " " + lastname
  end

  def check_password?( password )
        Digest::MD5.hexdigest( self.password + @@salt )
	self.password == Digest::MD5.hexdigest( password + @@salt )
  end

  def encrypt()
        self.password = Digest::MD5.hexdigest( self.password + @@salt )
  end

  private
   @@salt = "mun_hyvin_salainen_suola_1234"

end
