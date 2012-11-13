require "spec_helper"

describe Lense do
  describe "#search" do
    before(:each) do
      @params={}
      brand= Brand.find_by_name('Canon')
      @ef5018=Lense.create!(min_aperture: 1.8,
                    max_aperture: 1.8,
                    max_focal_length: 50,
                    min_focal_length: 50,
                    name: "EF 50 1.8",
                    notes: "Testnote",
                    brand: brand,
                    lense_type: LenseType.find_by_lense_type("Normal"))

      @efs55250=Lense.create!(min_aperture: 3.5,
                    max_aperture: 6.3,
                    min_focal_length: 55,
                    max_focal_length: 250,
                    name: "EFS 55-250",
                    notes: "Testnote",
                    brand: brand,
                    lense_type: LenseType.find_by_lense_type("Telezoom"))

      @ef1020=Lense.create!(min_aperture: 3.5,
                    max_aperture: 5.3,
                    min_focal_length: 10,
                    max_focal_length: 20,
                    name: "EF 10-20",
                    notes: "Testnote",
                    brand: brand,
                    lense_type: LenseType.find_by_lense_type("Ultra-Wide"))


      @efs1855=Lense.create!(min_aperture: 3.5,
                    max_aperture: 5.8,
                    min_focal_length: 18,
                    max_focal_length: 55,
                    name: "EFS 18-55",
                    notes: "Testnote",
                    brand: brand,
                    lense_type: LenseType.find_by_lense_type("Wide"))

      @efs18250=Lense.create!(min_aperture: 4.5,
                    max_aperture: 6.3,
                    min_focal_length: 18,
                    max_focal_length: 250,
                    name: "EFS 18-250",
                    notes: "Testnote",
                    brand: brand,
                    lense_type: LenseType.find_by_lense_type("Wide-to-Tele"))

    end

    it "filters by Lens Type" do
      lt=LenseType.find_by_lense_type("Normal")
      @params[:lense_type_selection] = lt.id
      search_result = Lense.search(@params)
      search_result.should have(1).items
      search_result.should include(@ef5018)
      search_result.should_not include(@efs18250)
    end
    it "doesn't filter by Lens Type when lense type is empty" do
      lt=LenseType.find_by_lense_type("")
      @params[:lense_type_selection] = lt.id
      search_result = Lense.search(@params)
      search_result.should have(5).items
      search_result.should include(@ef5018)
      search_result.should include(@efs18250)
    end

    it "filters by aperture value" do
      lt=LenseType.find_by_lense_type("")
      @params[:lense_type_selection] = lt.id
      @params[:aperture_to]= 2.7
      search_result = Lense.search(@params)
      search_result.should have(1).items
      search_result.should include(@ef5018)
      search_result.should_not include(@efs18250)
    end
    it "filters by minimum focal length" do
      lt=LenseType.find_by_lense_type("")
      @params[:lense_type_selection] = lt.id
      @params[:min_focal_length]= 54
      search_result = Lense.search(@params)
      search_result.should have(1).items
      search_result.should include(@efs55250)
    end
    it "filters by maximum focal length" do
      lt=LenseType.find_by_lense_type("")
      @params[:lense_type_selection] = lt.id
      @params[:max_focal_length]= 56
      search_result = Lense.search(@params)
      search_result.should have(3).items
      search_result.should include(@ef5018)
      search_result.should_not include(@efs18250)
    end
    it "filters by a combination of all filters" do
      lt=LenseType.find_by_lense_type("Normal")
      @params[:lense_type_selection] = lt.id
      @params[:max_focal_length] = 51
      @params[:min_focal_length] = 49
      @params[:aperture_to] = 2.8
      search_result = Lense.search(@params)
      search_result.should have(1).items
      search_result.should include(@ef5018)
      search_result.should_not include(@efs18250)
    end
  end
end