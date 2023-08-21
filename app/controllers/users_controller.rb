class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_stocks = @user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def show 
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def search
    @friends = current_user.friends
    @friends_searched = User.search(params[:friend])
    @friends_searched = @friends_searched.reject { |friend| current_user.id == friend.id }
        if @friends_searched.present?
            if @friends_searched
                render 'users/my_friends'
            else
                flash[:alert] = "Please enter a valid name."
                redirect_to my_friends_path
            end
        else
            flash[:alert] = "Please enter a name to search"
            redirect_to my_friends_path
        end
    end
end
