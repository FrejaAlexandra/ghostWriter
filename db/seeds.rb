require "open-uri"
require "faker"

puts "Destroying users."
User.destroy_all
puts "Creating users..."

User.create!(
  first_name: "Remco",
  last_name: "Jonk",
  email: "remcojonk@hotmail.com",
  password: "123456",
  balance: 5000
)

User.create!(
  first_name: "Freya",
  last_name: "Heaton",
  email: "freyaheaton94@gmail.com",
  password: "TAMPON",
  balance: 6500
)

# CashWallet.create!(
#   cash_value: "50"
# )

puts "Destroying books..."
Book.destroy_all
puts "Creating books..."

book_cover = ["https://img.theculturetrip.com/450x/smart/images/56-3972722-51zvcx96fjl.-sx326-bo1-204-203-200-.jpg",
              "https://img.theculturetrip.com/450x/smart/images/56-3972732-1984-by-george-orwell.jpg",
              "https://s26162.pcdn.co/wp-content/uploads/2018/05/american-psycho-670x1024.jpg",
              "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2018%2F05%2F000220540-2000.jpg",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhBwPEKoogvpts01TbWFgiQ5XIZpz5Rpmt-g&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI3fntZZXLycWOrynmwYkLwxaDAqSm7uvlUQ&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd9_COEHkxl9-hjLjB2OPJlVEpOk7x3S8VZA&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTq3FFTF5eSYGg5V8uUgGDd-wU7SWsOe92Ng&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzlzPjQ5R3jtSy9poaHKJ1JXQNPvUHSxEd3w&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_G9vtzNAJagX3GXQi_fR2ZtZtlL2-yC9DoA&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1xhTxG4_sErnpxQNfAzdOLtQ-vo943oMAVA&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTelPDqosKii0o4nKvjQuG4cVSVVBAf63ENTQ&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6z3Ti7kooxS4R56UyUSddN1iNJHsw7wxX8YMuVckQ0ZZ8ltU-nHEU4fT3RTt9NSz7oA8&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ16T-WF7Q-F1cXIKtVs9HFtnSJiO3NG5Aodw&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc736QQ2h1lj-rI9kMMppADP6U1LrJHdflnQ&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCrptowqiSzh_Lw1f4T2xZTwhUSTCCWCIf4Q&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlXkMvUDPgWPBGBRBH9qccJfTlRSFNgQcuRA&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgVytaBFSn6WVJz4wGOPpABJ0lgVMKLoaQg&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpnDwbiTAOnpdWBAmn2OgigTXjFUZMIRJXbw&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyK3_4X99wmrIApae1S3-9Zg5zaWTEfwnn9A&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiG0BcFIrGXXT58FNtjLiBcRtUQYR1HgKWdA&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwNlpqLK8kPTGLrkDvLL6RGIM1hjCu1dj7kQ&usqp=CAU",
              "https://s26162.pcdn.co/wp-content/uploads/2019/05/81gwhSBg7L-768x1152.jpg",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToVEOfJe9Mt2gp0JGHUidAoj4QlZlrPkfW9g&usqp=CAU",
              "https://cdn-1.debijenkorf.nl/web_detail_2x/assouline-capri-dolce-vita/?reference=057/720/0577209001000000_pro_flt_frt_01_1108_1528_7231688.jpg",
              "https://media.s-bol.com/XLLDYxXX8MKW/550x711.jpg",
              "https://www.billboard.com/wp-content/uploads/2022/08/Snoop-Dogg-Cookbook-Embed-1240.jpeg",
              "https://m.media-amazon.com/images/I/51aO4QtYr9L._SX336_BO1,204,203,200_.jpg",
              "https://m.media-amazon.com/images/I/51T8OXMiB5L._SY344_BO1,204,203,200_QL70_ML2_.jpg",
              "https://m.media-amazon.com/images/I/51VvX-IKp+L._SX258_BO1,204,203,200_.jpg",
              "https://m.media-amazon.com/images/I/41A77FOb6QL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
              "https://m.media-amazon.com/images/I/41LwAb57YJL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
              "https://m.media-amazon.com/images/I/51sydySzWqL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
              "https://m.media-amazon.com/images/I/41dZrbZCqTL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
              "https://m.media-amazon.com/images/I/513xvhXHvGL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
              "https://m.media-amazon.com/images/I/41AjwKSjRML.jpg",
              "https://m.media-amazon.com/images/I/41vVdFtbjhL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
              "https://m.media-amazon.com/images/I/41mQIVrnIaL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
              "https://pm1.narvii.com/6178/0d884ae5d41510cc073bea3f182c8108a4da8e2f_hq.jpg",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSboVHAZWT7MtqgUhiGZ_gXAltBakEaKTKyB8XW9QpFkBug1CHj",
              "https://m.media-amazon.com/images/I/41mT5UyhZ4L._SY344_BO1,204,203,200_QL70_ML2_.jpg",
              "https://m.media-amazon.com/images/I/51ocrgXUB4L._SX258_BO1,204,203,200_QL70_ML2_.jpg",
              "https://www.rickhansen.com/sites/default/files/2020-01/beautyisaverb-cover-hi-rez.jpg"
            ]

tags = ["Fantasy", "Romance", "Mystery", "Horror", "Thriller", "Paranormal", "Historical Fiction", "Sci-Fi", "Dystopian", "Memoir", "Art", "Self Help", "Motivational", "Health", "History", "Travel Guide", "Cookbook", "Poetry", "Erotic", "Female Author", "Trans Author", "Queer Author", "Non-Binary Author", "POC Author", "Black Author", "Asian Author", "LatinX Author", "Indegenous Author", "Agender Author", "Polysexual Author", "Fat Author" "Disabled Author", "Neurodivergent Author", "Literary Prize", "Critically Acclaimed", "Dark", "Cerebral", "Inspiring", "Slow-Burn", "Psychological", "Quirky", "Coming Of Age", "Cultural", "Social Commentary", "Sunday Reading", "Guilty Pleasure", "Strong Female Lead", "Queer Romance", "Manga/Anime", "Graphic Novel", "Children's Book", "Design"]

43.times do |i|
  file = URI.open(book_cover[i])

  book = Book.new(
    user_id: User.last.id,
    title: Faker::Book.title,
    psuedoname: Faker::Name.name_with_middle,
    description: Faker::Lorem.sentence(word_count: 500, supplemental: true),
    initial_share_value: 1.3,
    current_share_value: 1.3,
    total_amount: 4000,
    tag_list: tags.sample(3),
    example: Faker::Lorem.sentence(word_count: 1000, supplemental: true)
  )
  book.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  book.save!
  puts book.title
end
