# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Optician.create([
    {username: "emamelok", email: "emamelok@2020optical.com", first_name: "Eddy", last_name: "Mamelok", password: "arcadia15", certificate_number: 354789},
    {username: "tjones", email: "tom.jones@jonesglasses.com", first_name: "Tom", last_name: "Jomes", password: "yeti23", certificate_number: 110373},
    {username: "bkildree", email: "benkildree@nycoptical.com", first_name: "Ben", last_name: "Kildree", password: "wildprarie", certificate_number: 736468}
])