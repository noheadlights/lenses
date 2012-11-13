# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.find_or_create_by_email(email: "admin@lenses.com", password: "secret", password_confirmation: "secret" )
Brand.find_or_create_by_name("")
Brand.find_or_create_by_name(name: "Canon")
LenseType.find_or_create_by_lense_type(lense_type: "")
LenseType.find_or_create_by_lense_type(lense_type: "Normal")
LenseType.find_or_create_by_lense_type(lense_type: "Telezoom")
LenseType.find_or_create_by_lense_type(lense_type: "Wide")
LenseType.find_or_create_by_lense_type(lense_type: "Ultra-Wide")
LenseType.find_or_create_by_lense_type(lense_type: "Wide-to-Tele")

