# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Brand.delete_all
LenseType.delete_all
Lense.delete_all

User.create(email: "admin@lenses.com", password: "secret", password_confirmation: "secret" )
brand_none = Brand.create("")
brand = Brand.create(name: "Canon")
lt_none = LenseType.create(lense_type: "")
lt_normal = LenseType.create(lense_type: "Normal")
lt_tele = LenseType.create(lense_type: "Telezoom")
lt_wide = LenseType.create(lense_type: "Wide")
lt_uwide = LenseType.create(lense_type: "Ultra-Wide")
lt_wide_to_tele = LenseType.create(lense_type: "Wide-to-Tele")

Lense.create(min_aperture: 1.8, max_aperture: 1.8, max_focal_length: 50, min_focal_length: 50, name: "EF 50 1.8", notes: "Testnote", brand: brand, lense_type: lt_normal)
Lense.create(min_aperture: 3.5, max_aperture: 6.3, min_focal_length: 55, max_focal_length: 250, name: "EFS 55-250", notes: "Testnote",brand: brand, lense_type: lt_tele)
Lense.create(min_aperture: 3.5, max_aperture: 5.3, min_focal_length: 10, max_focal_length: 20, name: "EF 10-20", notes: "Testnote", brand: brand, lense_type: lt_uwide)
Lense.create(min_aperture: 3.5, max_aperture: 5.8, min_focal_length: 18, max_focal_length: 55, name: "EFS 18-55", notes: "Testnote", brand: brand, lense_type: lt_wide)
Lense.create(min_aperture: 4.5, max_aperture: 6.3, min_focal_length: 18, max_focal_length: 250, name: "EFS 18-250", notes: "Testnote", brand: brand, lense_type: lt_wide_to_tele)
