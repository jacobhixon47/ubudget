class GoalsController < ApplicationController
  def new
    if user_signed_in?
      @user = current_user
      @category = @user.categories.find(params[:category_id])
      @goal = @category.goals.new
    else
      flash[:notice] = "You must be signed in to access this feature"
      redirect_to home_index
    end
  end
  def create
    if user_signed_in?
      @user = current_user
      @category = @user.categories.find(params[:category_id])
      @goal = @category.goals.new(goal_params)
      @goal.spent_amount = 0
      # Check to see if weekly goal is set already
      if @goal.weekly? && @category.goals.where(:weekly => true).any?
        flash[:alert] = "You have already set a weekly goal."
        render :new
      # Check to see if monthly goal is set already
      elsif !@goal.weekly? && @category.goals.where(:weekly => false).any?
        flash[:alert] = "You have already set a monthly goal."
        render :new
      # If no monthly/weekly goal has been set so far
      else
        if @goal.save
          if @goal.weekly?
            @category.transactions.where(:date => Date.today.beginning_of_week..Date.today.end_of_week).each do |transaction|
              @goal.spent_amount += transaction.amount
              @goal.save
            end
          else
            @category.transactions.where(:date => Date.today.beginning_of_month..Date.today.end_of_month).each do |transaction|
              @goal.spent_amount += transaction.amount
              @goal.save
            end
          end
          flash[:notice] = "Your goal has been set!"
          redirect_to user_transactions_path(@user)
        else
          flash[:alert] = "There was a problem saving your goal, please try again."
          render :new
        end
      end
    else
      flash[:notice] = "You must be signed in to access this feature"
      redirect_to home_index
    end
  end

private
  def goal_params
    params.require(:goal).permit(:base_amount, :category_id, :weekly)
  end
end