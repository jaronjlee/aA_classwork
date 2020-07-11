# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
cat1 = Cat.create(birth_date: Date.new(2015,1,20), color: 'red', name: 'Kitty', sex: 'M')
cat2 = Cat.create(birth_date: Date.new(2014,1,20), color: 'yellow', name: 'Candy', sex: 'F')
cat3 = Cat.create(birth_date: Date.new(2013,1,20), color: 'blue', name: 'Vanilla', sex: 'M')