require 'spec_helper'
  
  describe RecipesController do
    describe "Recipe#index" do      
      it "loads all recipes into @recipes" do
        @recipes = Recipe.create(title: "Arepas"), Recipe.create(title: "Papas")
        get :index
        expect(@recipes.count).to eq(2)
      end
    end
    
    describe "Recipe#show" do
      it "should find recipe by its id" do
        @recipe = Recipe.create(title: "Empenadas")
        get :show, :id => @recipe.id
        assigns[:recipe].title.should == "Empenadas"
      end
    end
  
    describe "Recipe#create" do

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
  
    describe "Recipes#edit" do
      it "should find recipe by its id" do
        @recipe = Recipe.create(title: "Empenadas")
        get :show, :id => @recipe.id
        assigns[:recipe].title.should == "Empenadas"
      end
    end

    describe "Recipes#update" do
      before(:each) do
        @recipe = Recipe.create(:id => 1, :title => "Peach Pie", :body => "Bake at tree fiddy.")
      end
      
      it "should find recipe by its id" do
        get :show, :id => @recipe.id
        assigns[:recipe].title.should == "Peach Pie"
      end

      it "allows a recipe to be updated" do
        prev_updated_at = @recipe.updated_at
        @rec = { :title => "new title", :body => "new body" }
        put :update, :id => @recipe.id, :recipe => @rec
        @recipe.reload
        @recipe.updated_at.should_not == prev_updated_at 
      end
      
      it "should re-render edit template on failed update" do
        @rec = { :title => "", :body => "new body" }
        put :update, :id => @recipe.id, :recipe => @rec
      
        flash[:notice].should be_nil
        response.should render_template('edit')
      end
      
      it "should redirect to index with a notice on successful update" do
        @rec = { :title => "new title", :body => "new body" }
        put :update, :id => @recipe.id, :recipe => @rec
      
        assigns[:recipe].should_not be_new_record
        flash[:notice].should_not be_nil
        response.should redirect_to(recipes_path)
      end
    end

    describe "Recipes#new" do
      it "creates a new instance of the Recipe model" do
        @recipe = Recipe.new
        @recipe.should be_an_instance_of Recipe
      end
    end
  end  
