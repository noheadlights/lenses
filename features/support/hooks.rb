AfterConfiguration do
  @user_attr = FactoryGirl.attributes_for(:user)
  User.create!(@user_attr)
  Lense.delete_all
  begin
    %w(lens_type_wide lens_type_ultrawide lens_type_wide_to_tele lens_type_telezoom lens_type_normal).each do |lensetype|
      FactoryGirl.create lensetype
    end
    %w(brand_canon).each do |brand|
      FactoryGirl.create brand
    end
    %w(lens_normal lens_tele lens_ultrawide lens_wideangle lens_wide_to_tele ).each do |lense|
      FactoryGirl.create lense
    end
  end
end

