require 'spec_helper'

describe Recipe do
  before(:each) do
    @recipe = Recipe.new(:title => "Tacos")
  end

  it "should be valid" do 
    @recipe.should be_valid
  end

  it "should have an title" do
   @recipe.title.should == "Tacos"
 end
end
