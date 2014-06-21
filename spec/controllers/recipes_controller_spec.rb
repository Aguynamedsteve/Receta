require 'spec_helper'

describe RecipesController do
  before(:each) do
    @recipes = Recipe.create(title: "Arepas"), Recipe.create(title: "Papas")
  end

  it "loads all recipes into @recipes" do
    get :index
    expect(@recipes.count).to eq(2)
  end

  it "should find recipe by its id" do
    @recipe = Recipe.create(title: "Empenadas")
    get :show, :id => @recipe.id
    assigns[:recipe].title.should == "Empenadas"
  end

  
end
