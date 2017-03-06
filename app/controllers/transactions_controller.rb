class TransactionsController < ApplicationController

  # Dashboard
  def index
    if user_signed_in?
      @user = current_user
      @transactions = @user.transactions
    end
  end

  def new
    if user_signed_in?
      @user = current_user
      @transaction = @user.transactions.new
    else
      flash[:alert] = "You need an account for that! Please login or sign up. (:"
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
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
    else
      flash[:alert] = "You need an account for that! Please login or sign up. (:"
      redirect_to new_user_session_path
    end
  end

private
  def transaction_params
    params.require(:transaction).permit(:description, :amount, :user_id, :category_id, :income, :date)
  end
end
