class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:title, :body))
    if @recipe.save
      flash[:notice] = "Recipe #{@recipe.title} was successfully created."
      redirect_to @recipe
    else
      render :new
    end
  end
end
