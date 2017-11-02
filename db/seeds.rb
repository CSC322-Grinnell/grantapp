# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create({ first_name: 'Alice',
 last_name: 'Copenhagen', email: 'user@example.com', role:'Applicant' })
 
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

grant = Program.create({title: 'Football', tags: 'sports'})