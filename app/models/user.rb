require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email


# Getter method retrieves the hashed_password as a BCrypt::Password object
  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

# Writer that gets called when we assign a new plaintext password to the passwort attr
  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    # @password is a BCrypt:Password object representing the hashed password
    self.hashed_password = @password
    # Writing the hashed password to the actual database column/field that we have
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return user if user && user.password == password
  end

end
