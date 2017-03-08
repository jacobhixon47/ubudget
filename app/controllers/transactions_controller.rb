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
      @transaction.category.goals.each do |goal|
        goal.spent_amount += @transaction.amount
        goal.save
      end
      flash[:notice] = "Your transaction was successfully added! (:"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem submitting your transaction. Please try again."
      render :new
    end
  end

  def history_search
    @user = current_user
  end

  def history
    @user = current_user
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @interval = params[:interval]
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js
    end
  end

private
  def transaction_params
    params.require(:transaction).permit(:description, :amount, :user_id, :category_id, :date)
  end
end
