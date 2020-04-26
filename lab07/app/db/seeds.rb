# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new
user1.name = "bill"
user1.email = "bill@mail.com"
user1.password = "123"
user1.password_confirmation = "123"
user1.save

user2 = User.new
user2.name = "jill"
user2.email = "jill@mail.com"
user2.password = "123"
user2.password_confirmation = "123"
user2.save