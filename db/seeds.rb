# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_1 = User.create!(
  first_name: "John",
  last_name: "Doe",
  birthdate: Date.parse("1982-01-04"),
  profile_img_url: "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
  email: "john@example.com",
  password: "qwerty",
  password_confirmation: "qwerty",
  created_at: DateTime.now,
  updated_at: DateTime.now
)

venue_1 = Venue.create(title: "Office in paris", address: "1Av. Veracruz 102, Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX", description: "A beautiful office in the heart of La Condesa", img_url: "https://s3.us-east-1.amazonaws.com/co-assets/assets/images/_fbTw/coworking-vs-office.jpg", surface_area: 100, daily_rate: 650, venue_type: "Office", has_parking: true, has_internet: true, has_ac: true, user_id: 1)
venue_2 = Venue.create(title: "Beautiful restaurant in the heart of Mexico", address: "Cozumel 62, Cuautemoc, mexico city, 06700", description: "Spacious restaurant fully equipped", img_url: "https://cdn.vox-cdn.com/thumbor/5d_RtADj8ncnVqh-afV3mU-XQv0=/0x0:1600x1067/1200x900/filters:focal(672x406:928x662)/cdn.vox-cdn.com/uploads/chorus_image/image/57698831/51951042270_78ea1e8590_h.7.jpg", surface_area: 350, daily_rate: 2200, venue_type: "Restaurant", has_parking: true, has_internet: true, has_ac: true, user_id: 1)
venue_3 = Venue.create(title: "Remodeld night club in a vibrant town", address: "Merida 186, Roma Nte., Cuauhtémoc, 06700 Ciudad Cuauhtémoc, CDMX", description: "Brand new night club designed but renowed Mexican Architect", img_url: "https://static.dezeen.com/uploads/2011/07/dezeen_MN-Roy-Club-by-Emmanuel-Picault-and-Ludwig-Godefroy_15.jpg", surface_area: 900, daily_rate: 3500, venue_type: 'Bar/Club', has_parking: true, has_internet: true, has_ac: true, user_id: 1)
venue_4 = Venue.create(title: "Large store in Mexico City", address: "Frontera 168, Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX", description: "Spacious storefront ready to use, in the heart of Roma Norte", img_url: "https://thumbs.dreamstime.com/b/interior-store-empty-shelves-d-image-95230796.jpg", surface_area: 2300, daily_rate: 1800, venue_type: "Storefront", has_parking: false, has_internet: true, has_ac: true, user_id: 1)
venue_5 = Venue.create(title: "Amazing rooftop with views", address: "Av. Álvaro Obregón 182, Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX", description: "Beautiful rooftop with a view of the city", img_url: "https://media.timeout.com/images/105813983/image.jpg", surface_area: 500, daily_rate: 2500, venue_type: "Bar/club", has_parking: false, has_internet: true, has_ac: true, user_id: 1)



booking_1 = Booking.create(start_date: Date.parse("2021-06-06"), end_date: Date.parse("2021-06-08"), total_price: 1300, user_id: 1, venue_id: 1)
booking_2 = Booking.create(start_date: Date.parse("2021-06-06"), end_date: Date.parse("2021-06-08"), total_price: 4400, user_id: 1, venue_id: 2)
booking_3 = Booking.create(start_date: Date.parse("2021-06-06"), end_date: Date.parse("2021-06-08"), total_price: 7000, user_id: 1, venue_id: 3)
booking_4 = Booking.create(start_date: Date.parse("2021-06-06"), end_date: Date.parse("2021-06-08"), total_price: 3600, user_id: 1, venue_id: 4)
