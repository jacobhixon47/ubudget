class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @expenses = Transaction.where(user_id: @user.id, income: false)
    @income = Transaction.where(user_id: @user.id, income: true)
    @profit = @income.sum(:amount) - @expenses.sum(:amount).to_f
  end
end
