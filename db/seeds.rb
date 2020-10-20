# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Visit.destroy_all
Trip.destroy_all
User.destroy_all

u1 = User.create(username: 'Levi', password: 'aaa', street: '2419 Flowering Brook Lane', city: 'Sugar Land', state: 'TX', zip: '77479', home_latitude: 29.567762, home_longitude: -95.673661)

t1 = Trip.create(user_id: u1.id, title: 'Santa Fe to Boulder', description: 'This was a trip from Santa Fe, New Mexico to Boulder, Colorado', is_public: true, start_date: DateTime.now)

v1 = Visit.create(trip_id: t1.id, location_name: "Black Canyon", latitude: 35.8416667, longitude: -105.8333333, description: 'blaah', reservable: true, phone: '867-5309', stop_number: 1)
v2 = Visit.create(trip_id: t1.id, location_name: "Coaldale Campground", latitude: 38.33587413, longitude: -105.8019904, description: 'blaah', reservable: false, phone: '867-5309', stop_number: 2)
v3 = Visit.create(trip_id: t1.id, location_name: "PEACEFUL VALLEY", latitude: 40.1313889, longitude: -105.5061111, description: 'blaah', reservable: true, phone: '867-5309', stop_number: 3)
