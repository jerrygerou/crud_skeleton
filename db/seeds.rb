require 'faker'

# Remove any poems in the database
Poem.destroy_all


# Seed database with poems
timestamp = Faker::Time.between(5.days.ago, 1.days.ago)
Poem.create({
  :title      => "More Than a Color Hex Code",
  :body       => Array.new(5) { "#{Faker::Hacker.ingverb} #{Faker::Color.color_name}.".capitalize }.join("\n"),
  :applauses  => 10,
  :created_at => timestamp,
  :updated_at => timestamp
})


timestamp = Faker::Time.between(15.days.ago, 10.days.ago)
Poem.create({
  :author     => Faker::Internet.user_name,
  :title      => "Space",
  :body       => [Faker::Space.planet, Faker::Space.star, Faker::Space.constellation, Faker::Space.star_cluster, Faker::Space.galaxy].join("\n"),
  :applauses  => 3,
  :created_at => timestamp,
  :updated_at => timestamp
})


timestamp = Faker::Time.between(20.days.ago, 16.days.ago)
Poem.create({
  :author     => Faker::Internet.user_name,
  :title      => "Browsing Bookshelves",
  :body       => Array.new(25) { Faker::Book.title + "." }.join(" "),
  :created_at => timestamp,
  :updated_at => timestamp
})
