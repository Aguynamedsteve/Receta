require 'spec_helper'

  describe RecipesController do
    
    it "loads all recipes into @recipes" do
      @recipes = Recipe.create(title: "Arepas"), Recipe.create(title: "Papas")
      get :index
      expect(@recipes.count).to eq(2)
    end
  
    it "should find recipe by its id" do
      @recipe = Recipe.create(title: "Empenadas")
      get :show, :id => @recipe.id
      assigns[:recipe].title.should == "Empenadas"
    end

  describe "Recipe #create" do

    it "renders flash notice on successful save" do
      post :create, :recipe => {:title => "Egg Foo Yung"}
      flash[:notice].should_not be_blank
    end
    
    it "should re-render new template on failed save" do
      post :create, :recipe => {:title => "fu"}
      flash[:notice].should be_blank
      response.should render_template(:new)
    end
  
    it "should pass params to recipe" do
      post :create, :recipe => {:title => "Egg Foo Yung"}
      assigns[:recipe].title.should == "Egg Foo Yung"
    end
  end

  describe "Recipes #edit" do
        
  end
end  
