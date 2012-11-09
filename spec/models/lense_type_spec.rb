require "spec_helper"

describe LenseType do

    describe "returns a type string " do
      context "with a valid paramaeters" do
        it "returns a string" do
          LenseType.find_by_lense_type("Normal").lense_type.should eq "Normal"
        end
      end
      context "with an empty string" do
        it "returns an empty string" do
          LenseType.find_by_lense_type("").lense_type.should eq ""
      end
    end
  end
end
