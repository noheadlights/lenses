require 'factory_girl'

FactoryGirl.define do
  factory :brand_canon, class: Brand do
    name "Canon"
  end

  factory :lens_type_normal, class: LenseType do
    lense_type "Normal"
  end
  factory :lens_type_telezoom, class: LenseType do
    lense_type "Telezoom"
  end
  factory :lens_type_wide, class: LenseType do
    lense_type "Wideangle"
  end
  factory :lens_type_ultrawide, class: LenseType do
    lense_type "Ultrawide"
  end
  factory :lens_type_wide_to_tele, class: LenseType do
    lense_type "Wide-to-Tele"
  end

  factory :lens_normal, class: Lense do
    min_aperture 1.4
    max_aperture  1.4
    max_focal_length 50
    min_focal_length 50
    name "EF 50 1.8"
    notes "Testnote"
    association :brand, factory: :brand_canon
    association :lense_type, factory: :lens_type_normal
  end
  factory :lens_tele, class: Lense do
    min_aperture 3.5
    max_aperture  6.3
    min_focal_length 55
    max_focal_length 250
    name "EFS 55-250"
    notes "Testnote"
    association :brand, factory: :brand_canon
    association :lense_type, factory: :lens_type_telezoom
  end
  factory :lens_ultrawide, class: Lense do
    min_aperture 3.5
    max_aperture  5.3
    min_focal_length 10
    max_focal_length 20
    name "EF 10-20"
    notes "Testnote"
    association :brand, factory: :brand_canon
    association :lense_type, factory: :lens_type_ultrawide
  end
  factory :lens_wideangle, class: Lense do
    min_aperture 3.5
    max_aperture  5.8
    min_focal_length 18
    max_focal_length 55
    name "EFS 18-55"
    notes "Testnote"
    association :brand, factory: :brand_canon
    association :lense_type, factory: :lens_type_wide
  end
  factory :lens_wide_to_tele, class: Lense do
    min_aperture 4.5
    max_aperture  6.3
    min_focal_length 18
    max_focal_length 250
    name "EFS 18-250"
    notes "Testnote"
    association :brand, factory: :brand_canon
    association :lense_type, factory: :lens_type_wide_to_tele
  end
end
Factory.define :user do |user|
  user.name                   "admin"
  user.email                  "admin@lenses.com"
  user.password               "secret"
  user.password_confirmation  "secret"
end