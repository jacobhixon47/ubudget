class CategoriesController < ApplicationController
  def show
    @user = current_user
    @category = @user.categories.find(params[:id])
  end

  def new
    if user_signed_in?
      @user = current_user
      @category = @user.categories.new
    else
      flash[:notice] = "You must be signed in to access this feature."
      redirect_to home_index
    end
  end

  def create
    if user_signed_in?
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
    else
      flash[:alert] = "You must be signed in to access this feature."
      redirect_to home_index
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
