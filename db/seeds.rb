# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

entry1 = Entry.create(name: "east", block: 1)
entry2 = Entry.create(name: "north", block: 2)
entry3 = Entry.create(name: "west", block: 3)
entry4 = Entry.create(name: "south", block: 4)
arr1, arr2, arr3, arr4 = [],[],[],[]
a = (1..250).select{|num| arr1.push num}
b = (251..500).select{|num| arr2.push num}
c = (501..750).select{|num| arr3.push num}
d = (751..1000).select{|num| arr4.push num}

Slot.create(seats: arr1, entry_id: entry1.id )
Slot.create(seats: arr2, entry_id: entry2.id )
Slot.create(seats: arr3, entry_id: entry3.id )
Slot.create(seats: arr4, entry_id: entry4.id )
