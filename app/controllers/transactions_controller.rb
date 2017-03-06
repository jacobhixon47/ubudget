class TransactionsController < ApplicationController
  before_action :authenticate_user!

  # Dashboard
  def index
    @user = current_user
    @transactions = @user.transactions
  end

  def new
    @user = current_user
    @transaction = @user.transactions.new
  end

  def create
    @user = current_user
    @transaction = @user.transactions.new(transaction_params)
    if @transaction.save
      if !@transaction.income?
        @transaction.category.goals.each do |goal|
          goal.spent_amount += @transaction.amount
          goal.save
        end
      end
      flash[:notice] = "Your transaction was successfully added! (:"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem submitting your transaction. Please try again."
      render :new
    end
  end

private
  def transaction_params
    params.require(:transaction).permit(:description, :amount, :user_id, :category_id, :income, :date)
  end
end
