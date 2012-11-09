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
end