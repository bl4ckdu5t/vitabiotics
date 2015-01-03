# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
	name: 'Joseph Rex',
	role: 'administrator',
	email: 'admin@vitabiotics.com',
	avatar: '',
	password: 'password'
)

Preference.create!(
	company: 'vitabiotics',
	website: 'http://vitabiotics.herokuapp.com',
	theme: '221, 17, 66'
)
departments = [
	['Managing Director',''],
	['Management',''],
	['Junior Executive',''],
	['Senior Staff',''],
	['Junior Staff',''],
	['Temporary Staff',''],
	# senior staaff
	['Admin','Senior Staff'],
	['Operation','Senior Staff'],
	['Account','Senior Staff'],
	['Sales','Senior Staff'],
	['Maintenance','Senior Staff'],
	['Security','Senior Staff'],
	['Store','Senior Staff'],
	['Production','Senior Staff'],
	['Quality Assurance','Senior Staff'],
	# junior staff
	['Admin','Junior Staff'],
	['Operation','Junior Staff'],
	['Account','Junior Staff'],
	['Sales','Junior Staff'],
	['Maintenance','Junior Staff'],
	['Security','Junior Staff'],
	['Store','Junior Staff'],
	['Printing','Junior Staff'],
	['Driver','Junior Staff'],
	['Granulation','Junior Staff'],
	['Tablet','Junior Staff'],
	['Syrup','Junior Staff'],
	['Environmental','Junior Staff'],
	# temporary staff
	['Admin','Temporary Staff'],
	['Operation','Temporary Staff'],
	['Account','Temporary Staff'],
	['Sales','Temporary Staff'],
	['Maintenance','Temporary Staff'],
	['Security','Temporary Staff'],
	['Store','Temporary Staff'],
	['Printing','Temporary Staff'],
	['Driver','Temporary Staff'],
	['Granulation','Temporary Staff'],
	['Tablet','Temporary Staff'],
	['Syrup','Temporary Staff'],
	['Environmental','Temporary Staff'],
]
departments.each do |name, parent|
	Department.create!(name: "#{name}", parent: "#{parent}")
end

3.times do |t|
	Staff.create!(title: 'mr', surname: "John#{t}", othernames: "Doe#{t}", gender: 'male', annual_salary: '$500,000', email: "j#{t}@jt.com")
end