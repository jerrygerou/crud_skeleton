require 'faker'

20.times do
  User.create!( :username => Faker::Internet.user_name,
                :email => Faker::Internet.email,
                :hashed_password => 'password'
              )
end
