# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all
cat1 = Cat.create(color: 'red', name: 'Kitty', age: 2)
cat2 = Cat.create(color: 'yellow', name: 'Candy', age: 3)
cat3 = Cat.create(color: 'blue', name: 'Vanilla', age: 4)