Place.destroy_all
Entry.destroy_all
User.destroy_all

# Create a default user
User.create!(username: "testuser", email: "test@example.com", password: "password", password_digest: BCrypt::Password.create("password"))

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
  { title: "Ate tacos", occurred_on: Date.new(2022, 1, 1), description: "Tacos are amazing!" },
  { title: "Lisa and Jim's Wedding", occurred_on: Date.new(2022, 1, 1), description: "So Sweet!" },
  { title: "Ate tacos again", occurred_on: Date.new(2022, 1, 1), description: "I love tacos!" }
])

charleston.entries.create([
  { title: "Walked along Rainbow Row", occurred_on: Date.new(2022, 2, 10), description: "Enjoyed the colorful houses on Rainbow Row." },
  { title: "Ate shrimp and grits", occurred_on: Date.new(2022, 2, 12), description: "Tried the famous shrimp and grits dish." }
])

beijing.entries.create([
  { title: "Visited the Great Wall", occurred_on: Date.new(2022, 3, 20), description: "Hiked along the Great Wall of China." },
  { title: "Explored the Forbidden City", occurred_on: Date.new(2022, 3, 22), description: "Took a tour of the historic Forbidden City." }
])

amsterdam.entries.create([
  { title: "Took a canal cruise", occurred_on: Date.new(2022, 4, 15), description: "Enjoyed a scenic cruise along the canals of Amsterdam." },
  { title: "Visited Anne Frank House", occurred_on: Date.new(2022, 4, 18), description: "Explored the museum dedicated to Anne Frank." }
])
