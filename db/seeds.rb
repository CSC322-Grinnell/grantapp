# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create({ first_name: 'Alice',
 last_name: 'Copenhagen', email: 'user@example.com', role:'Applicant' })

grant = Program.create({title: 'Sports', deadline: "5-6-2015"})