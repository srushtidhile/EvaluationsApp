# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create fname: 'Paul', lname: 'Sivilotti', email: 'sivilotti.1@osu.edu', admin: true, password: 'admin'
User.create fname: 'Jake', lname: 'Conway', email: 'conway.257@osu.edu', admin: true, password: 'admin'
User.create fname: 'Charlie', lname: 'Giles', email: 'giles.25@osu.edu', admin: true, password: 'admin'
User.create fname: 'John', lname: 'Smith', email: 'smith.1@osu.edu', password: 'user'
User.create fname: 'Natalie', lname: 'Chen', email: 'chen.8290@osu.edu', password: 'student'

patrick = Student.create fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran@gmail.com'
natalie = Student.create fname: 'Natalie', lname: 'Chen', email: 'chen.8290@osu.edu'
jacob = Student.create fname: 'Jacob', lname: 'Slivka', email: 'slivka.30@osu.edu'
srushti = Student.create fname: 'Srushti', lname: 'Dhile', email: 'dhile.1@osu.edu'
kunal = Student.create fname: 'Kunal', lname: 'Arya', email: 'arya.36@osu.edu'
zaid = Student.create fname: 'Zaid', lname: 'Badiger', email: 'badiger.2@osu.edu'
jamie = Student.create fname: 'Jamie', lname: 'Bossenbroek', email: 'bossenbroek.9@osu.edu'
samuel = Student.create fname: 'Samuel', lname: 'Cohen', email: 'cohen.976@osu.edu'
jay = Student.create fname: 'Jay', lname: 'Collins', email: 'collins.976@osu.edu'
devin = Student.create fname: 'Devin', lname: 'Das', email: 'das.264@osu.edu'
brian = Student.create fname: 'Brian', lname: 'Dong', email: 'dong.778@osu.edu'
louise = Student.create fname: 'Louise', lname: 'Fabris', email: 'fabris.1@osu.edu'
chase = Student.create fname: 'Chase', lname: 'Fensore', email: 'fensore.4@osu.edu'
isaiah = Student.create fname: 'Isaiah', lname: 'Green', email: 'green.1970@osu.edu'
lisa = Student.create fname: 'Lisa', lname: 'Hall', email: 'hall.2576@osu.edu'
yiyang = Student.create fname: 'Yiyang', lname: 'Huang', email: 'huang.3424@osu.edu'
jake = Student.create fname: 'Jake', lname: 'Imyak', email: 'imyak.1@osu.edu'
ryoma = Student.create fname: 'Ryoma', lname: 'Kawakami', email: 'kawakami.17@osu.edu'
simon = Student.create fname: 'Simon', lname: 'Kirksey', email: 'kirksey.36@osu.edu'

p1 = Presentation.create name: 'Bootstrap'
p1.students.push patrick
p1.students.push natalie
p1.students.push jacob
p1.students.push srushti
p1.save

p2 = Presentation.create name: 'Rspec'
p2.students.push kunal
p2.students.push zaid
p2.students.push jamie
p2.students.push samuel
p2.students.push jay
p2.save

p3 = Presentation.create name: 'jQuery'
p3.students.push devin
p3.students.push brian
p3.students.push louise
p3.students.push chase
p3.students.push lisa
p3.save

p4 = Presentation.create name: 'Node.js'
p4.students.push isaiah
p4.students.push lisa
p4.students.push yiyang
p4.students.push jake
p4.students.push ryoma
p4.save

p5 = Presentation.create name: 'PureCSS'
p5.students.push patrick
p5.students.push natalie
p5.students.push jacob
p5.students.push srushti
p5.save

# (1..10).each do |i|
#   p = Presentation.create name: i.to_s
#   p.students.push patrick
#   p.students.push natalie
#   p.students.push srushti
#   p.save
# end
