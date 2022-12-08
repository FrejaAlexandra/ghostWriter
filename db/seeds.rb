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
  balance: 0
)

User.create!(
  first_name: "Daniel",
  last_name: "Foca",
  email: "danielfoca@gmail.com",
  password: "123456"
)

User.create!(
  first_name: "Freya",
  last_name: "Heaton",

  email: "freyaheaton94@gmail.com",
  password: "TAMPON",
  balance: 75
)
puts "Destroying wallets."
CashWallet.destroy_all
puts "Creating wallet..."

CashWallet.create!(
  cash_value: "10",
  price_cents: 1000
)

CashWallet.create!(
  cash_value: "25",
  price_cents: 250
)

CashWallet.create!(
  cash_value: "50",
  price_cents: 5000
)

CashWallet.create!(
  cash_value: "150",
  price_cents: 15000
)

CashWallet.create!(
  cash_value: "200",
  price_cents: 20000
)

CashWallet.create!(
  cash_value: "250",
  price_cents: 25000
)

CashWallet.create!(
  cash_value: "500",
  price_cents: 50000
)

CashWallet.create!(
  cash_value: "750",
  price_cents: 75000
)

CashWallet.create!(
  cash_value: "1000",
  price_cents: 100000
)

CashWallet.create!(
  cash_value: "1500",
  price_cents: 150000
)

CashWallet.create!(
  cash_value: "2000",
  price_cents: 200000
)

CashWallet.create!(
  cash_value: "2500",
  price_cents: 250000
)

puts "Destroying books..."
Book.destroy_all
puts "Creating books..."

book_cover = [
  {
    img: "https://img.theculturetrip.com/450x/smart/images/56-3972722-51zvcx96fjl.-sx326-bo1-204-203-200-.jpg",
    title: "Jaws",
    author: "Peter Benchley",
    description: "Charlotte and Peter Fiell are two authorities on design history, theory and criticism and have written more than sixty books on the subject, many of which have become best sellers. They have also given conferences and courses as guest lecturers, curated exhibitions and advised manufacturers, museums, auction houses and major private collectors around the world. The Fiells have written numerous books for TASCHEN, including 1000 Chairs, 20th Century Design, Industrial Design A to Z, Scandinavian Design, and 21st Century Design.",
    author_description: "Peter Bradford Benchley (May 8, 1940 - February 11, 2006) was an American author, screenwriter, and ocean activist. He is known for his bestselling novel Jaws and co-wrote its film adaptation with Carl Gottlieb."
  },

  {
    img: "https://img.theculturetrip.com/450x/smart/images/56-3972732-1984-by-george-orwell.jpg",
    title: "1984",
    author: "George Orwell",
    description: "One of Britain's most popular novels, George Orwell's Nineteen Eighty-Four is set in a society terrorized by a totalitarian ideology propagated by The Party.
    Winston Smith works for the Ministry of Truth in London, chief city of Airstrip One. Big Brother stares out from every poster, the Thought Police uncover every act of betrayal. When Winston finds love with Julia, he discovers that life does not have to be dull and deadening, and awakens to new possibilities. Despite the police helicopters that hover and circle overhead, Winston and Julia begin to question the Party; they are drawn towards conspiracy. Yet Big Brother will not tolerate dissent - even in the mind. For those with original thoughts they invented Room 101. . .
    Nineteen Eighty-Fouris George Orwell's terrifying vision of a totalitarian future in which everything and everyone is slave to a tyrannical regime. The novel also coined many new words and phrases which regularly appear in popular culture, such as 'Big Brother', 'thoughtcrime', 'doublethink' and 'Newspeak'.",
    author_description: "George Orwell was an English novelist, essayist, and critic most famous for his novels Animal Farm (1945) and Nineteen Eighty-four (1949). The following biography was written by D.J. Taylor. Taylor is an author, journalist and critic.",
  },

  {
    img: "https://s26162.pcdn.co/wp-content/uploads/2018/05/american-psycho-670x1024.jpg",
    title: "American Psycho",
    author: "Bret Easton Ellis",
    description: "A cult classic, adapted into a film starring Christian Bale. Is evil something you are? Or is it something you do? Patrick Bateman has it all: good looks, youth, charm, a job on Wall Street, reservations at every new restaurant in town and a line of girls around the block. He is also a psychopath. A man addicted to his superficial, perfect life, he pulls us into a dark underworld where the American Dream becomes a nightmare . . . With an introduction by Irvine Welsh, Bret Easton Ellis's American Psycho is one of the most controversial and talked-about novels of all time. A multi-million-copy bestseller hailed as a modern classic, it is a violent black comedy about the darkest side of human nature.",
    author_description: "Bret Easton Ellis (born March 7, 1964 in Los Angeles, California) is an American novelist and short story writer. He was regarded as one of the so-called literary Brat Pack, which also included Tama Janowitz and Jay McInerney."
  },

  {
    img: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2018%2F05%2F000220540-2000.jpg",
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    description: "To Kill a Mockingbird is both a young girl's coming-of-age story and a darker drama about the roots and consequences of racism and prejudice, probing how good and evil can coexist within a single community or individual.",
    author_description: "Nelle Harper Lee (April 28, 1926 - February 19, 2016) was an American novelist best known for her 1960 novel To Kill a Mockingbird. It won the 1961 Pulitzer Prize and has become a classic of modern American literature. Lee has received numerous accolades and honorary degrees, including the Presidential Medal of Freedom in 2007 which was awarded for her contribution to literature.[1][2][3] She assisted her close friend Truman Capote in his research for the book In Cold Blood (1966).[4] Capote was the basis for the character Dill Harris in To Kill a Mockingbird.[5]"
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhBwPEKoogvpts01TbWFgiQ5XIZpz5Rpmt-g&usqp=CAU",
    title: "The Witches",
    author: "Roald Dahl",
    description: "The Witches is a children's dark fantasy novel by British author Roald Dahl. The story is set partly in Norway and partly in England, and features the experiences of a young English boy and his Norwegian grandmother in a world where child-hating societies of witches secretly exist in every country.",
    author_description: "Roald Dahl (13 September 1916 - 23 November 1990) was a British novelist, short-story writer, poet, screenwriter, and wartime fighter ace of Norwegian descent. His books have sold more than 250 million copies worldwide. Dahl has been called 'one of the greatest storytellers for children of the 20th century'."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI3fntZZXLycWOrynmwYkLwxaDAqSm7uvlUQ&usqp=CAU",
    title: "The Godfather",
    author: "Mario Puzo",
    description: "The Godfather is a crime novel by American author Mario Puzo. Originally published in 1969 by G. P. Putnam's Sons, the novel details the story of a fictional Mafia family in New York City (and Long Island), headed by Vito Corleone, the Godfather. The novel covers the years 1945 to 1955 and includes the back story of Vito Corleone from early childhood to adulthood.",
    author_description: "The bestselling author of one the world's most famous novels, The Godfather, Mario Puzo was an Italian American author and screenwriter. His claims to fame have been his intelligently written crime fiction and Italian mafia stories."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd9_COEHkxl9-hjLjB2OPJlVEpOk7x3S8VZA&usqp=CAU",
    title: "One Flew Over The Cuckoo's Nest",
    author: "Ken Kesey",
    description: "One Flew Over the Cuckoo's Nest is a novel by Ken Kesey published in 1962. Set in an Oregon psychiatric hospital, the narrative serves as a study of institutional processes and the human mind, including a critique of psychiatry and a tribute to individualistic principles.",
    author_description: "Ken Kesey, in full Ken Elton Kesey, (born September 17, 1935, La Junta, Colorado, U.S.—died November 10, 2001, Eugene, Oregon), American writer who was a hero of the countercultural revolution and the hippie movement of the 1960s. Kesey was educated at the University of Oregon and Stanford University."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTq3FFTF5eSYGg5V8uUgGDd-wU7SWsOe92Ng&usqp=CAU",
    title: "The Goldfinch",
    author: "Donna Tartt",
    description: "Aged thirteen, Theo Decker, son of a devoted mother and a reckless, largely absent father, survives an accident that otherwise tears his life apart. Alone and rudderless in New York, he is taken in by the family of a wealthy friend. He is tormented by an unbearable longing for his mother, and down the years clings to the thing that most reminds him of her: a small, strangely captivating painting that ultimately draws him into the criminal underworld. As he grows up, Theo learns to glide between the drawing rooms of the rich and the dusty antiques store where he works. He is alienated and in love - and his talisman, the painting, places him at the centre of a narrowing, ever more dangerous circle. The Goldfinch is a haunted odyssey through present-day America and a drama of enthralling power. Combining unforgettably vivid characters and thrilling suspense, it is a beautiful, addictive triumph - a sweeping story of loss and obsession, of survival and self-invention, of the deepest mysteries of love, identity and fate.",
    author_description: "Donna Louise Tartt (born December 23, 1963)[2] is an American novelist and essayist. Tartt's novels are The Secret History (1992), The Little Friend (2002), and The Goldfinch (2013).[3] Tartt won the WH Smith Literary Award for The Little Friend in 2003 and the Pulitzer Prize for Fiction for The Goldfinch in 2014.[4] She was included in Time magazine's 2014 '100 Most Influential People' list."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzlzPjQ5R3jtSy9poaHKJ1JXQNPvUHSxEd3w&usqp=CAU",
    title: "Lolita",
    author: "Vladimir Nabokov",
    description: "With one of the most controversial novels of the twentieth century, Vladimir Nabokov's Lolita is a strange, troubling love story told by the one of the most unreliable narrators in literature. This Penguin Modern Classics edition includes an afterword by Craig Raine. Poet and pervert, Humbert Humbert becomes obsessed by twelve-year-old Lolita and seeks to possess her, first carnally and then artistically, out of love, 'to fix once for all the perilous magic of nymphets'. Is he in love or insane? A silver-tongued poet or a pervert? A tortured soul or a monster? Or is he all of these? Humbert Humbert's seduction is one of many dimensions in Nabokov's dizzying masterpiece, which is suffused with a savage humour and rich, elaborate verbal textures. Filmed by Stanley Kubrick in 1962 starring James Mason and Peter Sellers, and again in 1997 by Adrian Lyne starring Jeremy Irons and Melanie Griffith, Lolita has lost none of its power to shock and awe. Lolita is comedy, subversive yet divine...You read Lolita sprawling limply in your chair, ravished, overcome, nodding scandalized assent. (Martin Amis, Observer).",
    author_description: "Vladimir Vladimirovich Nabokov was a Russian-American novelist, poet, translator, and entomologist. Born in Imperial Russia in 1899, Nabokov wrote his first nine novels in Russian (1926–1938) while living in Berlin, where he met his wife. He achieved international acclaim and prominence after moving to the United States, where he began writing in English. Nabokov became an American citizen in 1945 and lived mostly on the East Coast before returning to Europe in 1961, where he settled in Montreux, Switzerland."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_G9vtzNAJagX3GXQi_fR2ZtZtlL2-yC9DoA&usqp=CAU",
    title: "The Color Purple",
    author: "Alice Walker",
    description: "The Color Purple documents the traumas and gradual triumph of Celie, an African American teenager raised in rural isolation in Georgia, as she comes to resist the paralyzing self-concept forced on her by others. Celie narrates her life through painfully honest letters to God.",
    author_description: "Alice Malsenior Tallulah-Kate Walker (born February 9, 1944) is an American novelist, short story writer, poet, and social activist. In 1982, she became the first African-American woman to win the Pulitzer Prize for Fiction, which she was awarded for her novel The Color Purple. Over the span of her career, Walker has published seventeen novels and short story collections, twelve non-fiction works, and collections of essays and poetry. She has faced criticism for alleged antisemitism and for her endorsement of the conspiracist David Icke."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1xhTxG4_sErnpxQNfAzdOLtQ-vo943oMAVA&usqp=CAU",
    title: "The Handmaid's Tale",
    author: "Margaret Atwood",
    description: "In Margaret Atwood's dystopian future, environmental disasters and declining birthrates have led to a Second American Civil War. The result is the rise of the Republic of Gilead, a totalitarian regime that enforces rigid social roles and enslaves the few remaining fertile women. Offred is one of these, a Handmaid bound to produce children for one of Gilead’s commanders. Deprived of her husband, her child, her freedom, and even her own name, Offred clings to her memories and her will to survive. At once a scathing satire, an ominous warning, and a tour de force of narrative suspense, The Handmaid’s Tale is a modern classic.",
    author_description: "Margaret Atwood is a Canadian poet, novelist, literary critic, essayist, teacher, environmental activist, and inventor. Since 1961, she has published 18 books of poetry, 18 novels, 11 books of non-fiction, nine collections of short fiction, eight children's books, and two graphic novels, and a number of small press editions of both poetry and fiction. Atwood has won numerous awards and honors for her writing, including two Booker Prizes, the Arthur C. Clarke Award, the Governor General's Award, the Franz Kafka Prize, Princess of Asturias Awards, and the National Book Critics and PEN Center USA Lifetime Achievement Awards.[2] A number of her works have been adapted for film and television."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTelPDqosKii0o4nKvjQuG4cVSVVBAf63ENTQ&usqp=CAU",
    title: "Shawshank Redemption",
    author: "Stephen King",
    description: "Andy Dufresne, a banker, was convicted of killing his wife and her lover and sent to Shawshank Prison. He maintains his innocence over the decades he spends at Shawshank during which time he forms a friendship with Red, a fellow inmate.",
    author_description: "Stephen Edwin King (born September 21, 1947) is an American author of horror, supernatural fiction, suspense, crime, science-fiction, and fantasy novels. Described as the 'King of Horror', a play on his surname and a reference to his high standing in pop culture, his books have sold more than 350 million copies, and many have been adapted into films, television series, miniseries, and comic books. King has published 64 novels, including seven under the pen name Richard Bachman, and five non-fiction books. He has also written approximately 200 short stories, most of which have been published in book collections."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6z3Ti7kooxS4R56UyUSddN1iNJHsw7wxX8YMuVckQ0ZZ8ltU-nHEU4fT3RTt9NSz7oA8&usqp=CAU",
    title: "Dune",
    author: "Frank Herbert",
    description: "Set on the desert planet Arrakis, Dune is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the “spice” melange, a drug capable of extending life and enhancing consciousness.",
    author_description: "Franklin Patrick 'Frank' Herbert Jr. (October 8, 1920 - February 11, 1986) was an American science fiction author best known for the 1965 novel Dune and its five sequels. Though he became famous for his novels, he also wrote short stories and worked as a newspaper journalist, photographer, book reviewer, ecological consultant, and lecturer."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc736QQ2h1lj-rI9kMMppADP6U1LrJHdflnQ&usqp=CAU",
    title: "I Know Why The Caged Bird Sings",
    author: "Maya Angelou",
    description: "Sent by their mother to live with their devout, self-sufficient grandmother in a small Southern town, Maya and her brother, Bailey, endure the ache of abandonment and the prejudice of the local “powhitetrash.” At eight years old and back at her mother's side in St. Louis, Maya is attacked by a man many times her age—and has to live with the consequences for a lifetime. Years later, in San Francisco, Maya learns that love for herself, the kindness of others, her own strong spirit, and the ideas of great authors (“I met and fell in love with William Shakespeare”) will allow her to be free instead of imprisoned.",
    author_description: "Maya Angelou was an American memoirist, popular poet, and civil rights activist. She published seven autobiographies, three books of essays, several books of poetry, and is credited with a list of plays, movies, and television shows spanning over 50 years. She received dozens of awards and more than 50 honorary degrees. Angelou is best known for her series of seven autobiographies, which focus on her childhood and early adult experiences. The first, I Know Why the Caged Bird Sings (1969), tells of her life up to the age of 17 and brought her international recognition and acclaim."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCrptowqiSzh_Lw1f4T2xZTwhUSTCCWCIf4Q&usqp=CAU",
    title: "Foucault In Warsaw",
    author: "Remigiusz Ryziński",
    description: "Nominated for the Nike Literary Award, Foucault in Warsaw reconstructs a vibrant, engaging picture of gay life in Poland under communism—from the joys found in secret nightclubs, to the fears of not knowing who was a secret informant.",
    author_description: "Remigiusz Ryziński is a philosopher, cultural critic, writer, and academic lecturer who works on gender and queer theory; he has published three academic books. He is a graduate of the Jagiellonian University in Kraków and has also studied at the Sorbonne in Paris."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlXkMvUDPgWPBGBRBH9qccJfTlRSFNgQcuRA&usqp=CAU",
    title: "Moby-Dick",
    author: "Herman Melville",
    description: "Moby-Dick; or, The Whale is a novel by Herman Melville, in which Ishmael narrates the monomaniacal quest of Ahab, captain of the whaler Pequod, for revenge on the albino sperm whale Moby Dick, which on a previous voyage destroyed Ahab's ship and severed his leg at the knee.",
    author_description: "Herman Melville (August 1, 1819 - September 28, 1891) was an American novelist, short story writer, and poet of the American Renaissance period. Among his best-known works are Moby-Dick (1851); Typee (1846), a romanticized account of his experiences in Polynesia; and Billy Budd, Sailor, a posthumously published novella. Although his reputation was not high at the time of his death, the 1919 centennial of his birth was the starting point of a Melville revival, and Moby-Dick grew to be considered one of the great American novels."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgVytaBFSn6WVJz4wGOPpABJ0lgVMKLoaQg&usqp=CAU",
    title: "My Father, The Pornographer",
    author: "Chris Offutt",
    description: "In “one of the most sensitive, nuanced examinations of father and son relationships” (The Boston Globe), award-winning writer Chris Offutt struggles to understand his recently deceased father, based on his reading of the 400-plus novels his father—a well-known writer of pornography in the 1970s and 80s—left him in his will.",
    author_description: "Christopher John Offutt (born August 24, 1958) is an American writer. He is most widely known for his short stories and novels, but he has also published three memoirs and multiple nonfiction articles. In 2005, he had a story included in a comic book collection edited by Michael Chabon, and another in the anthology Noir. He has written episodes for the TV series True Blood and Weeds."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpnDwbiTAOnpdWBAmn2OgigTXjFUZMIRJXbw&usqp=CAU",
    title: "Zombie Spaceship Wasteland",
    author: "Patton Oswalt",
    description: "Zombie Spaceship Wasteland is a collection of pieces by the comedian, bouncing from pieces on the awkward intersection of Dungeons & Dragons and puberty to making a living in Los Angeles to a graphic short story about vampires trying to look cool.",
    author_description: "Patton Peter Oswalt (born January 27, 1969) is an American stand-up comedian, actor and writer. He is known as Spence Olchin in the sitcom The King of Queens (1998-2007) and narrated the sitcom The Goldbergs (2013-present) as adult Adam F. Goldberg. After making his acting debut in the Seinfeld episode 'The Couch', he has since appeared in a variety of television series, such as Parks and Recreation, Community, Two and a Half Men, Drunk History, Reno 911!, Mystery Science Theater 3000, Archer, Veep, Justified, Kim Possible, and Brooklyn Nine-Nine, portraying Principal Ralph Durbin in A.P. Bio (2018–2021) and Matthew the Raven in the TV series The Sandman (2022–present)."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyK3_4X99wmrIApae1S3-9Zg5zaWTEfwnn9A&usqp=CAU",
    title: "The Little Prince",
    author: " Antoine De Saint-Exupery",
    description: "The Little Prince is an honest and beautiful story about loneliness, friendship, sadness, and love. The prince is a small boy from a tiny planet (an asteroid to be precise), who travels the universe, planet-to-planet, seeking wisdom. On his journey, he discovers the unpredictable nature of adults.",
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiG0BcFIrGXXT58FNtjLiBcRtUQYR1HgKWdA&usqp=CAU",
    title: "On The Road",
    author: "Jack Kerouac",
    description: "On the Road is a 1957 novel by American writer Jack Kerouac, based on the travels of Kerouac and his friends across the United States. It is considered a defining work of the postwar Beat and Counterculture generations, with its protagonists living life against a backdrop of jazz, poetry, and drug use.",
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwNlpqLK8kPTGLrkDvLL6RGIM1hjCu1dj7kQ&usqp=CAU",
    title: "Lady Chatterley's Lover",
    author: "D. H. Lawrence",
    description: "The story concerns a young married woman, the former Constance Reid (Lady Chatterley), whose upper-class Baronet husband, Sir Clifford Chatterley, described as a handsome, well-built man, is paralysed from the waist down because of a Great War injury. Constance has an affair with the gamekeeper, Oliver Mellors.",
  },

  {
    img: "https://s26162.pcdn.co/wp-content/uploads/2019/05/81gwhSBg7L-768x1152.jpg",
    title: "On Earth We're Briefly gorgeous",
    author: "Ocean Vuong",
    description: "'On Earth We're Briefly Gorgeous,' By Ocean Vuong Ocean Vuong's debut novel is a painful but extraordinary coming-of-age story, about a young Vietnamese American writer whose fractured family was torn by their experiences during the Vietnam War.",
  },

  # {
  #   img: "https://cdn-1.debijenkorf.nl/web_detail_2x/assouline-capri-dolce-vita/?reference=057/720/0577209001000000_pro_flt_frt_01_1108_1528_7231688.jpg",
  #   title: "Capri Dolce Vita",
  #   author: "Cesare Cunnacia",
  #   description: "Capri, a resort island dating back to the height of the Roman Empire, has long been an extraordinary destination full of ancient charm. Cherished by everyone from physician Axel Munthe, who recommended its clean air to his patients as a cure for bronchitis ; to film director Jean-Luc Godard as the setting for his 1963 film Contempt ; to literary icons, celebrities, poets, and the jet set, Capri boasts a rich Mediterranean spirit and style that encompasses a wealth of beauty, from gardens to villas to caves to the people walking in the lively Piazzetta, where cars are prohibited and the island's playful attitude runs rampant. Capri Dolce Vita is a look at this fabled corner of the world through the ages and a celebration of paradise on earth.",
  #   author_description: "Cesare Cunaccia is a writer, lecturer, curator, and journalist. He was editor at large for Vogue Italia and L'Uomo Vogue and the antiques consultant for Architectural Digest Italy."
  # },

  {
    img: "https://www.billboard.com/wp-content/uploads/2022/08/Snoop-Dogg-Cookbook-Embed-1240.jpeg",
    title: "From Crook To Cook",
    author: "Snoop Dogg",
    description: "The first cookbook and recipe book from Tha Dogg, From Crook to Cook: Platinum Recipes from Tha Boss Dogg's Kitchen. You've seen Snoop Dogg work his culinary magic on VH1's Emmy-nominated Martha and Snoop's Potluck Dinner Party, and now Tha Dogg's up in your kitchen ... with his first cookbook. Recipe book that delivers 50 recipes straight from Snoop's own collection: Snoop's cookbook features OG soul food cookbook staples.",
    author_description: "Calvin Cordozar Broadus a.k.a. “Snoop Dogg” was born on October 20, 1971 in Long Beach, California where he was nicknamed Snoopy by his parents because of a striking resemblance to the Peanuts cartoon character. A promising rapper from an early age, he began performing in the 6th grade but was waylaid by brushes with the law in high school."
  },

  {
    img: "https://m.media-amazon.com/images/I/51aO4QtYr9L._SX336_BO1,204,203,200_.jpg",
    title: "The complete Persepolis",
    author: "Marjane Satrapi",
    description: "Persepolis is the story of Satrapi's unforgettable childhood and coming of age within a large and loving family in Tehran during the Islamic Revolution; of the contradictions between private life and public life in a country plagued by political upheaval; of her high school years in Vienna facing the trials of adolescence far from her family; of her homecoming—both sweet and terrible; and, finally, of her self-imposed exile from her beloved homeland. It is the chronicle of a girlhood and adolescence at once outrageous and familiar, a young life entwined with the history of her country yet filled with the universal trials and joys of growing up.",
    author_description: "Marjane Satrapi is a graphic novelist, cartoonist, illustrator, film director, and children's book author. Her best-known works include the graphic novel Persepolis and its film adaptation, the graphic novel Chicken with Plums, and the Marie Curie biopic Radioactive."
  },

  {
    img: "https://m.media-amazon.com/images/I/51T8OXMiB5L._SY344_BO1,204,203,200_QL70_ML2_.jpg",
    title: "The Japanese Secret To A Long And Happy Life",
    author: "Hector Garcia, Francesc Miralles",
    description: "Ikigai gently unlocks simple secrets we can all use to live long, meaningful, happy lives. Science-based studies weave beautifully into honest, straight-talking conversation you won't be able to put down. Warm, patient, and kind, this book pulls you gently along your own journey rather than pushing you from behind.",
    author_description: "Francesc Miralles is an award-winning author who has written a number of bestselling self-help and inspirational books. Born in Barcelona, he studied journalism, English literature, and German, and has worked as an editor, a translator, a ghost-writer, and a musician."
  },

  {
    img: "https://m.media-amazon.com/images/I/51VvX-IKp+L._SX258_BO1,204,203,200_.jpg",
    title: "Cooking To Save Your Life",
    author: "Cheyenne Olivier",
    description: "In this playful, erudite and sensationally delicious cookbook, Banerjee takes us through the recipes he has delighted his friends, colleagues and students with - from charred avocado to Andhra pork ribs, deconstructed salade niçoise to a trifle made in under 20 minutes.",
    author_description: "Cheyenne Olivier is an illustrator based in France. She builds her images from a visual vocabulary of elementary shapes like squares, circles and triangles that form the basic blocks of a connected universe where humans, animals, plants, and minerals are all made of the same matter."
  },

  {
    img: "https://m.media-amazon.com/images/I/41A77FOb6QL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
    title: "Greenlights",
    author: "Matthew McConaughey",
    description: "Greenlights is the fascinating autobiography of Matthew McConaughey in which he takes us on a wild ride of his journey through a childhood of tough love, rising to fame and success in Hollywood, shifting his career, and more, guided by the green lights he saw that led him forward at each step.",
    author_description: "Matthew McConaughey, in full Matthew David McConaughey, (born November 4, 1969, Uvalde, Texas, U.S.), American actor whose virile good looks and Southern charm established him as a romantic leading man, a status that belied an equal ability to evince flawed, unpleasant characters."
  },

  {
    img: "https://m.media-amazon.com/images/I/41LwAb57YJL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
    title: "Being Mortal",
    author: "Atul Gawande",
    description: "Being Mortal: Medicine and What Matters in the End is a 2014 non-fiction book by American surgeon Atul Gawande. The book addresses end-of-life care, hospice care, and also contains Gawande's reflections and personal stories. He suggests that medical care should focus on well-being rather than survival.",
    author_description: "He is a renowned surgeon, writer, and public health leader. Prior to joining the Biden-Harris administration, he was a practicing general and endocrine surgeon at Brigham and Women's Hospital and a professor at Harvard Medical School and the Harvard T.H. Chan School of Public Health."
  },

  {
    img: "https://m.media-amazon.com/images/I/41dZrbZCqTL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
    title: "Polysecure",
    author: "Jessica Fern",
    description: "Attachment theory has entered the mainstream, but most discussions focus on how we can cultivate secure monogamous relationships. What if, like many people, you're striving for secure, happy attachments with more than one partner? Polyamorous psychotherapist Jessica Fern breaks new ground by extending attachment theory into the realm of consensual nonmonogamy. Using her nested model of attachment and trauma, she expands our understanding of how emotional experiences can influence our relationships. Then, she sets out six specific strategies to help you move toward secure attachments in your multiple relationships. Polysecure is both a trailblazing theoretical treatise and a practical guide.",
    author_description: "I grew up in a neighborhood well acquainted with violence and a family considerably impacted by divorce, multi-generational trauma, substance abuse and interpersonal discord. The effects of these experiences were challenging for many years, but through the therapeutic process, I was able to reclaim my strength, build resiliency, create relationships that I was nourished by and live from a heart that was open instead of fearfully protected. This journey began with investing my time and resources in workshops, retreats and therapy in order to heal myself, rewire my reactivity, re-invent certain relationships, while letting go of others and comfortably stand in the ways I'm different.  "
  },

  {
    img: "https://m.media-amazon.com/images/I/513xvhXHvGL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
    title: "The Ethical Slut",
    author: "Janet W. Hardy",
    description: "The Ethical Slut, Third Edition by Dossie Easton and Janet Hardy, is a nuts and bolts guide to ethical non-monogamy. It walks readers through everything from what ethical non-monogamy is, to how to safely navigate “the practice of sluthood,” to consent and communication.",
    author_description: "Hardy is an American writer and sex educator, and founder of Greenery Press. She has also been published as Catherine A. Liszt and Lady Green. She is the author or co-author of eleven books, and frequently collaborates with Dossie Easton."
  },

  {
    img: "https://m.media-amazon.com/images/I/41AjwKSjRML.jpg",
    title: "Call Me By Your Name",
    author: "Andre Aciman",
    description: "Andre Aciman's Call Me by Your Name is the story of a sudden and powerful romance that blossoms between an adolescent boy and a summer guest at his parents' cliffside mansion on the Italian Riviera. Each is unprepared for the consequences of their attraction, when, during the restless summer weeks, unrelenting currents of obsession, fascination, and desire intensify their passion and test the charged ground between them. Recklessly, the two verge toward the one thing both fear they may never truly find again: total intimacy. It is an instant classic and one of the great love stories of our time.",
    author_description: "André Aciman (born 2 January 1951) is an Italian-American writer. Born and raised in Alexandria, Egypt, he is currently a distinguished professor at the Graduate Center of City University of New York, where he teaches the history of literary theory and the works of Marcel Proust."
  },

  {
    img: "https://m.media-amazon.com/images/I/41vVdFtbjhL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
    title: "The Last Bear",
    author: "Hannah Gold",
    description: "It tells the story of middle grades girl, April, who travels to Bear Island in Norway for her father to conduct scientific research. The book follows her adventure as she discovers and befriends one lonely, hungry, and stranded polar bear.",
    author_description: "Hannah Gold worked in the film and magazine industries before taking time out to pursue her dream of writing. She lives in Lincolnshire with her tortoise, her cat and her husband. The Last Bear was her middle grade debut which became an inspirational, international bestseller on release in 2021."
  },

  {
    img: "https://m.media-amazon.com/images/I/41mQIVrnIaL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
    title: "Bauhaus",
    author: "Frank Whitford",
    description: "The author describes the historical context of the Bauhaus school, the development of the Bauhaus style, key figures at the school and within the movement, and the influence of Bauhaus art and design on future artistic styles.",
    author_description: "Dr Frank Whitford was an art historian and critic, and one of Britain's leading experts on 20th-century German and Austrian art. During his varied career, he lectured on the history of art at University College London and Homerton College, Cambridge, wrote several books and served as a newspaper art critic. From 1983 onwards he was a senior member of Wolfson College, Cambridge."
  },

  {
    img: "https://pm1.narvii.com/6178/0d884ae5d41510cc073bea3f182c8108a4da8e2f_hq.jpg",
    title: "Attack On Titan",
    author: "Hajime Isayama",
    description: "A Japanese manga series written and illustrated by Hajime Isayama, Attack on Titan is set in a world where humanity lives inside cities surrounded by enormous walls that protect them from gigantic man-eating humanoids called Titans.",
    author_description: "Hajime Isayama is a Japanese author and manga artist, widely known for being the creative genius behind the Attack on Titan franchise series. Born in Oita Prefecture, Japan, Isayama studied cartoon design in college and made his big break on his very first series with Attack on Titan being published in 2009."
  },

  {
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSboVHAZWT7MtqgUhiGZ_gXAltBakEaKTKyB8XW9QpFkBug1CHj",
    title: "Fattily Ever After",
    author: "Stephanie Yeboah",
    description: "Twenty-nine year-old plus-size blogger Stephanie Yeboah has experienced racism and fat-phobia throughout her life. From being bullied at school to being objectified and humiliated in her dating life, Stephanie's response to discrimination has always been to change the narrative around body-image and what we see as beautiful. In her debut book, Fattily Ever After, Stephanie Yeboah speaks openly and courageously about her own experience on navigating life as a black, plus-sized woman - telling it how it really is - and how she has managed to find self-acceptance in a world where judgement and discrimination are rife.",
    author_description: "Stephanie Yeboah is an award-winning plus size blogger, author, journalist, public speaker, and body positivity advocate from London. Social media star Stephanie is best recognized for her book 'Fattily Ever After', in which she talks about 'the fat, black girls' guide to living life unapologetically."
  },

  {
    img: "https://m.media-amazon.com/images/I/41mT5UyhZ4L._SY344_BO1,204,203,200_QL70_ML2_.jpg",
    title: "The Body Keeps The Score",
    author: "Bessel A. van der Kolk",
    description: "Renowned trauma expert Bessel van der Kolk has spent over three decades working with survivors. In The Body Keeps the Score, he transforms our understanding of traumatic stress, revealing how it literally rearranges the brain's wiring—specifically areas dedicated to pleasure, engagement, control, and trust. He shows how these areas can be reactivated through innovative treatments including neurofeedback, mindfulness techniques, play, yoga, and other therapies. Based on Dr. van der Kolk's own research and that of other leading specialists, The Body Keeps the Score offers proven alternatives to drugs and talk therapy—and a way to reclaim lives.",
    author_description: "Bessel van der Kolk MD has spent his professional life studying how children and adults adapt to traumatic experiences. He translates emerging findings from neuroscience and attachment research to develop and study a range of effective treatments for traumatic stress and developmental trauma in children and adults."
  },

  {
    img: "https://m.media-amazon.com/images/I/51ocrgXUB4L._SX258_BO1,204,203,200_QL70_ML2_.jpg",
    title: "Salt, Fat, Acid, Heat",
    author: " Samin Nosrat",
    description: "An illustrated and visionary new masterclass in cooking that distils decades of professional experience into just four simple elements. Features 100 essential recipes with dozens of variations, enabling readers to master the skills of cooking instinctively. With illustrations by Wendy Macnaughton. *Also appeared in May Buyer's Notes.",
    author_description: "Samin Nosrat is an American chef, TV host, food writer and podcaster. She is the author of the James Beard Award-winning, New York Times Bestselling cookbook Salt Fat Acid Heat and host of a Netflix docu-series of the same name.[4][2][5][6] From 2017-2021, she was a food columnist for The New York Times Magazine. Nosrat is also the co-host of the podcast Home Cooking.",
  }
]

tags = ["Fantasy", "Romance", "Mystery", "Horror", "Thriller", "Paranormal", "Historical Fiction", "Sci-Fi", "Dystopian", "Memoir", "Art", "Self Help", "Motivational", "Health", "History", "Travel Guide", "Cookbook", "Poetry", "Erotic", "Female Author", "Trans Author", "Queer Author", "Non-Binary Author", "POC Author", "Black Author", "Asian Author", "LatinX Author", "Indegenous Author", "Agender Author", "Polysexual Author", "Fat Author", "Disabled Author", "Neurodivergent Author", "Literary Prize", "Critically Acclaimed", "Dark", "Cerebral", "Inspiring", "Slow-Burn", "Psychological", "Quirky", "Coming Of Age", "Cultural", "Social Commentary", "Sunday Reading", "Guilty Pleasure", "Strong Female Lead", "Queer Romance", "Manga/Anime", "Graphic Novel", "Children's Book", "Design"]

book_cover.each do |i|
  file = URI.open(i[:img], "User-Agent" => "Ruby/3.1.2")

  book = Book.new(
    title: i[:title],
    description: i[:description],
    author_description: i[:author_description],
    finacials: 
    user_id: User.last.id,
    psuedoname: i[:author],
    tag_list: tags.sample(3),
    initial_share_value: 1.3,
    current_share_value: 1.3,
    total_amount: 4000,
    example: Faker::Lorem.sentence(word_count: 1000, supplemental: true)
  )
  book.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  book.save!
  puts book.title
end
