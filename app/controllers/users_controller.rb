class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @transactions = @user.transactions
  end
end
