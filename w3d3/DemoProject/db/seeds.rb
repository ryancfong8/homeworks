# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

house1 = House.create(address: "2400 Drive Way")
house2 = House.create(address: "30 Road Drive")

ryan = Person.create(name: 'Ryan', house_id: house1.id)
ngoc = Person.create(name: 'Ngoc', house_id: house1.id)
tyler = Person.create(name: 'Tyler', house_id: house2.id)
james = Person.create(name: 'James', house_id: house2.id)
