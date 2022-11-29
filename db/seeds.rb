require "open-uri"
require "faker"

puts "Creating users..."


cat = ["fsaf", "ddfdsfd"]

# User.create!(
#   first_name: Faker::Name.neutral_first_name,
#   last_name: Faker::Name.last_name,
#   email: Faker::Internet.email(name: 'sam smith', separators: ['-'], domain: 'gmail'),
#   password: Faker::Internet.password
# )

puts "Destroying books..."
Book.destroy_all
puts "Creating books..."

book_cover = ["https://mpd-biblio-covers.imgix.net/9781250847959.jpg?"]

25.times do

  @book = Book.create!(
    user_id: User.last.id,
    title: Faker::Book.title,
    category: cat.sample,
    description: Faker::JapaneseMedia::StudioGhibli.quote,
    value: 45,
    shares: 50,
    example: Faker::Quotes::Rajnikanth
  )
end
