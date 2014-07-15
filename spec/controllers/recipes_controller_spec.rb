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

      it "should create an duplicate recipe" do
        @recipe = Recipe.create(title: "Empenadas")
        @copy = @recipe.dup
        (@copy).should_not eq(@recipe)
        (@copy.title).should eq(@recipe.title)
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

      it "assigns the requested recipe as @recipe" do
        recipe = Recipe.create(:id => 1, :title => "Peach Pie", :body => "Bake at tree fiddy.")
        get :edit, :id => recipe.id.to_s
        assigns(:recipe).should eq(recipe)
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
      it "assigns a new recipe as @recipe" do
        get :new
        assigns(:recipe).should be_a_new(Recipe)
      end

      it "creates a new instance of the Recipe model" do
        @recipe = Recipe.new
        @recipe.should be_an_instance_of Recipe
      end
    end

    describe "Recipes#destroy" do
      before :each do
        @recipe = Recipe.create(:id => 1, :title => "Peach Pie", :body => "Bake at tree fiddy.")
      end

      it "destroys the requested recipe" do
        expect { delete :destroy, :id => @recipe.id.to_s }.to change{ Recipe.count }.by(-1)
      end
  
      it "redirects to the recipes list" do
        delete :destroy, :id => @recipe.id.to_s
        flash[:notice].should_not be_nil
        response.should redirect_to(recipes_path)
      end

      #it "should redirect_to recipes_path on failed destroy" do
      #  delete :destroy, :id => @recipe.id.to_s 
      #  
      #  flash[:error].should_not be_nil
      #  response.should redirect_to(:show)
      #end
    end
  end
