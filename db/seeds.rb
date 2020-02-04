# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Reset
puts 'Deleting existing entries'
User.delete_all
Inquiry.delete_all

# Admin
puts 'Creating Admin stephen.schuez@gmail.com'
User.create(email: "stephen.schuez@gmail.com", admin: true, password: "777jjj")

# Inquiries
newspapers = ["Aargauer Zeitung", "Basellandschaftl. Zeitung", "Basler Zeitung", "Berner Zeitung", "Neue Luzerner Zeitung", "Neue Zürcher Zeitung", "St. Galler Tagblatt", "Südostschweiz", "Tages Anzeiger", "Zürichsee-Zeitung Gesamtausgabe: Bezirk Horgen"]

newspapers_other = ["", "", "", "WOZ", "", "Limmat", "Herisau Blatt", "Bodensee Zirkel", "", "Sennezeitung Arburg"]

puts 'Creating 15 inquiries...'

15.times do
inquiry = Inquiry.create!(
	email: Faker::Internet.email,
	newspaper: newspapers.sample,
	other_newspaper: newspapers_other.sample,
	desired_date: Date.today + rand(1..7)
	)
end

puts "Created #{Inquiry.count} new inquiries."