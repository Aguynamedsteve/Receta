require 'spec_helper'

describe RecipesController do
  it "loads all recipes into @recipes" do
    @recipes = Recipe.create(title: "Ribs"), Recipe.create(title: "Shrimp")
    expect(@recipes.count).to eq(2)
  end

  
end
