# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

eddy = Optician.create(username: "emante", email: "emantelook@2020optical.com", first_name: "Eddy", last_name: "Mante", password: "arcadia15", certificate_number: 354789)
tom = Optician.create(username: "tjones", email: "tom.jones@jonesglasses.com", first_name: "Tom", last_name: "Jomes", password: "yeti23", certificate_number: 110373)
ben = Optician.create(username: "bkildree", email: "benkildree@nycoptical.com", first_name: "Ben", last_name: "Kildree", password: "wildprarie", certificate_number: 736468)

sam = Optometrist.create(first_name: "Sam", last_name: "Jones", optometrist_email: "sjones@westportoptometry.com", phone_number: "(736)-456-8787", address: "13 Arcadia Lane, Westport, CT, 06880", notes: "OOO Monday and Thursday. Prefers texting.")
randy = Optometrist.create(first_name: "Randy", last_name: "Hildago", optometrist_email: "randy.hilds@yahoo.com", phone_number: "(767)-231-8930", address: "6277 Childress Street, Norwalk, CT, 06850", notes: "Make sure to doubel check the prescription. Call to confirm once received.")
marsellus = Optometrist.create(first_name: "Marsellus", last_name: "Wallace", optometrist_email: "mwallace@marcellus.com", phone_number: "(909) 222-4000", address: "33 Newtown Av, Narragansett, RI, 02882 ", notes: "Do not describe what Marsellus looks like to other customers.")

Patient.create(first_name: "Daniel", last_name: "Rhipshoot", phone_number: "(345) 645-3435", email: "danrhip@gmail.com", address: "7 Kean Lane, Greenwich, CT, 06830", birthdate: "1989-8-14", notes: "Mostly interested in new Oliver Peoples frames. Particular about style and prefers self-tinted lenses.", optician_id: eddy.id, optometrist_id: sam.id, total_revenue: 10465.40)
Patient.create(first_name: "Austin", last_name: "Talker", phone_number: "(230) 879-7788", email: "atalks@hotmail.com", address: "789 Oliver Road, Stamford, CT, 06901", birthdate: "1993-06-23", notes: "Extremely chatty customer who rarely buys new frames.", optician_id: tom.id, optometrist_id: randy.id, total_revenue: 3849.97)
Patient.create(first_name: "Whitney", last_name: "Houston", phone_number: "(438) 645-3435", email: "danrhip@gmail.com", address: "78 New Hope Ave, Newark, NJ, 07107", birthdate: "1963-8-9", notes: "VIP client. Typically interested in the best, most expensive frames. Usually will have her assistant Jane pick up and drop off glasses", optician_id: ben.id, optometrist_id: marsellus.id, total_revenue: 54678.88)