class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:notice] = "Recipe successfully updated."
      redirect_to recipes_path
    else
      flash[:error] = "Error saving your recipe. Please try again."
      render :edit
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe #{@recipe.title} was successfully created."
      redirect_to @recipe
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      flash[:notice] = "Recipe was deleted successfully."
      redirect_to recipes_path
    else
      flash[:error] = "There was an error deleting the recipe."
      render :show
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body)
  end
end
