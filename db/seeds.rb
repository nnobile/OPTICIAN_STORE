# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Patient.create([
    {first_name: "Jason", last_name: "Jones", email: "jjones@gmail.com", address: "403 Hawthorne Way, Westport, CT, 06880", birthdate: 1976-04-02, prescription_notes: "OD/SPH: -2, OD/CYL -1" }



])


t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "address"
    t.date "birthdate"
    t.string "prescription_notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "optician_id"
    t.integer "optometrist_id"