require "spec_helper"

describe Lense do
  before(:each) do
    @params={}
  end
  it "has example data" do
    Lense.all.count > 0
  end
  it "filters by Lens Type" do
    lt=LenseType.find_by_lense_type("Normal")
    @params[:lense_type_selection] = lt.id
    @params[:aperture_to]= ""
    pp @params
    Lense.search(@params).count.should == 1
  end

  it "filters by Min Aperture" do
    lt=LenseType.find_by_lense_type("")
    @params[:lense_type_selection] = lt.id
    @params[:aperture_to]= "1.8"
    pp @params
    Lense.search(@params).count.should == 1
  end
  it "filters by Lens Type and Min Aperture" do
    lt=LenseType.find_by_lense_type("Normal")
    @params[:lense_type_selection] = lt.id
    @params[:aperture_to]= "1.8"
    pp @params
    Lense.search(@params).count.should == 1
  end
  it "can search between two focal lengths" do
    lt=LenseType.find_by_lense_type("")
    @params[:lense_type_selection] = lt.id
    @params[:maximum_focal_length] = 200
    @params[:minimum_focal_length] = 50
    @params[:aperture_to] = ""
    Lense.search(@params).count.should == 4

  end
  it "uses >= and <= in the search" do
    lt=LenseType.find_by_lense_type("")
    @params[:lense_type_selection] = lt.id
    @params[:maximum_focal_length] = 50
    @params[:minimum_focal_length] = 50
    @params[:aperture_to] = ""

    Lense.search(@params).count.should == 1

  end

end