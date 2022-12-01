require "open-uri"
require "faker"

puts "Destroying users."
User.destroy_all
puts "Creating users..."

User.create!(
  first_name: "Remco",
  last_name: "Jonk",
  email: "remcojonk@hotmail.com",
  password: "123456"
)

puts "Destroying books..."
Book.destroy_all
puts "Creating books..."

# book_cover = ["https://mpd-biblio-covers.imgix.net/9781250847959.jpg?"]

25.times do
  @book = Book.create!(
    user_id: User.last.id,
    title: Faker::Book.title,
    psuedoname: Faker::Name.name_with_middle,
    description: Faker::Lorem.sentence(word_count: 500, supplemental: true),
    value: 45,
    shares: 50,
    example: Faker::Lorem.sentence(word_count: 1000, supplemental: true),
  )
  puts @book.title
end
