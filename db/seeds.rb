# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

analyst = Analyst.first

if analyst.blank?
	 Analyst.create(:email=>"analyst@propertyonguard.com",:password=>"12345678",:password_confirmation=>"12345678",:name=>"analyst")
else
	analyst.password = "12345678"
	analyst.password_confirmation = "12345678"
	analyst.save
end


