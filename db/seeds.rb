# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create URL Shorteners
if Shortener.count.zero?
  n = rand(100)
  puts "Creating #{n} URL Shorteners"

  n.times do
    Shortener.abbreviate_url(Faker::Internet.url).save
  end
  puts "Added initial data set."
end
