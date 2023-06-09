# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Venue.destroy_all
Booking.destroy_all

pendejos = [["Guillaume", "Soyer"],["Miguel", "Bartolomeu"],["Salim", "atiyeh"], ["Pana", "Cota"]]

pendejos.each do |first_name, last_name|
  pendejito = User.create!(
    first_name: first_name,
    last_name: last_name,
    birthdate: Date.parse("2001-04-25"),
    email: first_name.downcase + "@aol.com",
    password: "password",
    password_confirmation: "password"
  )
  venue_1 = Venue.create(title: "#{pendejito.first_name} Office in paris", address: "1Av. Veracruz 102, Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX", description: "A beautiful office in the heart of La Condesa", surface_area: 100, daily_rate: 650, venue_type: "Office", has_parking: true, has_internet: true, has_ac: true, user: pendejito)
  venue_1_file = URI.open("https://images.adsttc.com/media/images/535f/29ed/c07a/80a2/5900/0090/large_jpg/PORTADA_Google18.jpg?1398745571")
  venue_1.photos.attach(io: venue_1_file, filename: "#{pendejito.first_name} Office in paris", content_type: 'image/avif')
  venue_1.save!

  venue_2 = Venue.create(title: "#{pendejito.first_name} Beautiful restaurant in the heart of Mexico", address: "1Av. Veracruz 102, Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX", description: "A beautiful office in the heart of La Condesa", surface_area: 100, daily_rate: 650, venue_type: "Office", has_parking: true, has_internet: true, has_ac: true, user: pendejito)
  venue_2_file = URI.open("https://www.peninsula.com/-/media/images/paris/new/dining/loiseau-blanc/ppr-oiseau-blanc-interior-evening-1074/ppr-oiseaublanc.png?mw=987&hash=58953560C2A423F8B8D6B9EE0D7271CC")
  venue_2.photos.attach(io: venue_2_file, filename: "#{pendejito.first_name} Beautiful restaurant in the heart of Mexico", content_type: 'image/avif')
  venue_2.save!

  venue_3 = Venue.create(title: "#{pendejito.first_name} Remodeld night club in a vibrant town", address: "Merida 186, Roma Nte., Cuauhtémoc, 06700 Ciudad Cuauhtémoc, CDMX", description: "Brand new night club designed but renowed Mexican Architect", surface_area: 900, daily_rate: 3500, venue_type: 'Bar/Club', has_parking: true, has_internet: true, has_ac: true, user: pendejito)
  venue_3_file = URI.open("https://images.inmexico.com/2017/04/18-864x521.jpg")
  venue_3.photos.attach(io: venue_3_file, filename: "#{pendejito.first_name} Remodeld night club in a vibrant town", content_type: 'image/avif')
  venue_3.save!

  venue_4      = Venue.create(title: "#{pendejito.first_name} Large store in Mexico City", address: "Frontera 168, Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX", description: "Spacious storefront ready to use, in the heart of Roma Norte", surface_area: 2300, daily_rate: 1800, venue_type: "Storefront", has_parking: false, has_internet: true, has_ac: true, user: pendejito)
  venue_4_file = URI.open("https://imagenescityexpress.scdn6.secure.raxcdn.com/sites/default/files/2019-08/best-shopping-malls-in-mexico-city.jpg")
  venue_4.photos.attach(io: venue_4_file, filename: "#{pendejito.first_name} Large store in Mexico City", content_type: 'image/avif')
  venue_4.save!


  venue_5      = Venue.create(title: "#{pendejito.first_name} Amazing rooftop with views", address: "Av. Álvaro Obregón 182, Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX", description: "Beautiful rooftop with a view of the city", surface_area: 500, daily_rate: 2500, venue_type: "Bar/club", has_parking: false, has_internet: true, has_ac: true, user: pendejito)
  venue_5_file = URI.open("https://www.therooftopguide.com/rooftop-bars-in-mexico-city/Bilder/cityzen-600-1.jpg")
  venue_5.photos.attach(io: venue_5_file, filename: "#{pendejito.first_name} Amazing rooftop with views", content_type: 'image/avif')
  venue_5.save!


end


booking_1 = Booking.create(start_date: Date.parse("2021-06-06"), end_date: Date.parse("2021-06-08"), total_price: 1300, user_id: User.last, venue: Venue.last)
booking_2 = Booking.create(start_date: Date.parse("2021-06-06"), end_date: Date.parse("2021-06-08"), total_price: 4400, user_id: User.last, venue: Venue.last)
booking_3 = Booking.create(start_date: Date.parse("2021-06-06"), end_date: Date.parse("2021-06-08"), total_price: 7000, user_id: User.all[2], venue: Venue.last)
booking_4 = Booking.create(start_date: Date.parse("2021-06-06"), end_date: Date.parse("2021-06-08"), total_price: 3600, user_id: User.all[3], venue: Venue.last)
booking_4 = Booking.create(start_date: Date.parse("2021-06-06"), end_date: Date.parse("2021-06-08"), total_price: 3600, user_id: User.all[4], venue: Venue.last)
