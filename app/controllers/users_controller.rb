class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @expenses = @user.transactions.where(income: false)
    @income = @user.transactions.where(income: true)
  end
end
