# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.new(name: "masło").save
Ingredient.new(name: "jajka").save
Ingredient.new(name: "śmietana").save
Ingredient.new(name: "cukier").save
Ingredient.new(name: "mąka").save
Ingredient.new(name: "czekolada").save
Ingredient.new(name: "kakao").save
Ingredient.new(name: "truskawki").save
Ingredient.new(name: "twaróg").save

Category.new(name: "torty").save
Category.new(name: "serniki").save
Category.new(name: "babki").save
Category.new(name: "babeczki").save
Category.new(name: "ciasta").save
Category.new(name: "wiosna").save
Category.new(name: "lato").save
Category.new(name: "jesień").save
Category.new(name: "zima").save
