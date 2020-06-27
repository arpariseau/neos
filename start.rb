require_relative 'near_earth_objects'
require_relative 'neo_tablemaker'

puts "________________________________________________________________________________________________________________________________"
puts "Welcome to NEO. Here you will find information about how many meteors, asteroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
puts "Please enter a date in the following format YYYY-MM-DD."
print ">>"

date = gets.chomp
formatted_date = DateTime.parse(date).strftime("%A %b %d, %Y")

asteroid_details = NearEarthObjects.new(date)
asteroid_list = asteroid_details.format_asteroid_data
total_number_of_asteroids = asteroid_details.total_number_of_asteroids
largest_asteroid = asteroid_details.largest_asteroid_diameter

tablemaker = NEOTablemaker.new
column_data = tablemaker.format_columns(asteroid_list)

puts "______________________________________________________________________________"
puts "On #{formatted_date}, there were #{total_number_of_asteroids} objects that almost collided with the earth."
puts "The largest of these was #{largest_asteroid} ft. in diameter."
puts "\nHere is a list of objects with details:"
puts tablemaker.format_divider(column_data)
puts tablemaker.format_header(column_data)
tablemaker.create_rows(asteroid_list, column_data)
puts tablemaker.format_divider(column_data)
