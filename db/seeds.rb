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
    description: Faker::JapaneseMedia::StudioGhibli.quote,
    value: 4500,
    shares: 50,
    example: Faker::Quotes::Rajnikanth
  )
  puts @book.title
end
