class UsersController < ApplicationController
  def show
    @user = current_user
    @recipes = @user.recipes
  end
end
