require 'spec_helper'

  describe RecipesController do
    #before(:each) do
    #end

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

  describe "POST #create" do
    before(:each) do
      @recipe = Recipe.new
    end

    it "should redirect to show with a notice on successful save" do
      Recipe.any_instance.stub(:valid?).and_return(true)
      post :create, :recipe => {:title => "Egg Foo Yung"}
      assigns[:recipe].should_not be_new_record
      flash[:notice].should_not be_blank
      response.should redirect_to(recipe_path)
    end
    
    it "should re-render new template on failed save" do
      post :create
      assigns[:recipe].should be_new_record
      flash[:notice].should be_blank
      response.should render_template(:show)
    end
  
    it "should pass params to recipe" do
      post :create, :recipe => {:title => "Egg Foo Yung"}
      assigns[:recipe].title.should == "Egg Foo Yung"
    end
  end
end  
