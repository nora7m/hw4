# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Clear existing data to prevent duplication if reseeding is safe
Place.destroy_all

# Create places in bulk
places = Place.create([
  { name: "Mexico City" },
  { name: "Charleston" },
  { name: "Beijing" },
  { name: "Amsterdam" }
])

# Accessing places directly by index
mexico_city = places[0]
charleston = places[1]
beijing = places[2]
amsterdam = places[3]

# Create entries for each place
mexico_city.entries.create([
  { title: "Ate tacos", posted_on: Date.new(2022, 1, 1), description: "Tacos are amazing!" },
  { title: "Lisa and Jim's Wedding", posted_on: Date.new(2022, 1, 1), description: "So Sweet!" },
  { title: "Ate tacos again", posted_on: Date.new(2022, 1, 1), description: "I love tacos!" }
])

charleston.entries.create([
  { title: "Walked along Rainbow Row", posted_on: Date.new(2022, 2, 10), description: "Enjoyed the colorful houses on Rainbow Row." },
  { title: "Ate shrimp and grits", posted_on: Date.new(2022, 2, 12), description: "Tried the famous shrimp and grits dish." }
])

beijing.entries.create([
  { title: "Visited the Great Wall", posted_on: Date.new(2022, 3, 20), description: "Hiked along the Great Wall of China." },
  { title: "Explored the Forbidden City", posted_on: Date.new(2022, 3, 22), description: "Took a tour of the historic Forbidden City." }
])

amsterdam.entries.create([
  { title: "Took a canal cruise", posted_on: Date.new(2022, 4, 15), description: "Enjoyed a scenic cruise along the canals of Amsterdam." },
  { title: "Visited Anne Frank House", posted_on: Date.new(2022, 4, 18), description: "Explored the museum dedicated to Anne Frank." }
])