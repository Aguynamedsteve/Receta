class RecipesController < ApplicationController
  def index
    @recipes = Recipes.all
  end

  def show
  end
end
