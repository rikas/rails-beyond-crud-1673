# db/seeds.rb
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = { chef_name: 'Ramsey', name: "Dishoom", address: "7 Boundary St, London E2 7JE",
            rating: 5 }
pizza_east = { chef_name: 'Silva', name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ",
               rating: 4 }

[dishoom, pizza_east].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
