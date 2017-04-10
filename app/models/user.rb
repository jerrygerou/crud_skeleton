require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates_presence_of :username, :email
  validates_uniqueness_of :email

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return user if user && user.password == password
  end

end
