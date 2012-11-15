
desc "Import lenses."
task :import_lenses => :environment do
  LenseType.delete_all
  Brand.delete_all
  Lense.delete_all

  File.open("lenses.txt", "r").each do |line|
    line.unpack("C*").pack("U*")
    name, minimum_focal_length, maximum_focal_length, aperture, rest = line.strip.split("\t")
    split_name = name.split
    name= name.gsub("(prime)", "")
    brand_name= split_name[0]
    aperture = aperture.sub("f/", "").sub("L", "")

    aperture_min, aperture_max = aperture.split("-")
    unless aperture_max
      aperture_max=aperture_min
    end

    minimum_focal_length = minimum_focal_length.sub(',', '.')
    maximum_focal_length = maximum_focal_length.sub(',', '.')

    brand = Brand.find_or_create_by_name(brand_name)
    if maximum_focal_length.to_f < 21
      lt = LenseType.find_or_create_by_lense_type("Ultrawide")
    elsif maximum_focal_length.to_f < 50
      lt = LenseType.find_or_create_by_lense_type("Wide")
    elsif minimum_focal_length.to_f > 50
      lt = LenseType.find_or_create_by_lense_type("Telezoom")
    else
      lt = LenseType.find_or_create_by_lense_type("Wide-to-Tele")
    end

    puts brand
    puts name
    puts aperture_min
    puts aperture_max
    puts minimum_focal_length
    puts maximum_focal_length

    lense= Lense.find_or_create_by_name!(name: name,
                                        max_aperture: aperture_max,
                                        min_aperture: aperture_min,
                                        min_focal_length: minimum_focal_length,
                                        max_focal_length: maximum_focal_length,
                                        brand: brand,
                                        lense_type: lt )

    lense.save

    #u = User.new(:name => name, :age => age, :profession => profession)
    #u.save
  end
end