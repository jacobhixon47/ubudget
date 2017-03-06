class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @category = @user.categories.find(params[:id])
  end

  def new
    @user = current_user
    @category = @user.categories.new
  end

  def create
    @user = current_user
    @category = @user.categories.new(category_params)
    @category.name = @category.name.titlecase()
    if @category.save
      flash[:notice] = "Your category was successfully saved!"
      redirect_to user_transactions_path(@user)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end

  def destroy
    @user = current_user
    @category = @user.categories.find(params[:id])
    @category.destroy
    redirect_to user_transactions_path(@user)
  end

private
  def category_params
    params.require(:category).permit(:name)
  end
end
