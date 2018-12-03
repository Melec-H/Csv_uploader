# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


buildings = [
    ["1", "10 Rue La bruyère", "75009", "Paris", "France", "Martin Faure"],
    ["2", "40 Rue René Clair", "75018", "Paris", "France", "Martin Faure"]
]

buildings.each do |ref, address, zip, city, country, name|
    Building.create( reference: ref, address: address, zip_code: zip, city: city, country: country, manager_name: name)
end
