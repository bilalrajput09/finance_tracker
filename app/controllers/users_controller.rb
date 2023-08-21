class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    @friends_list = current_user.friends
    @name = params[:friend].capitalize
    @friends = @friends_list.select { |friend| @name == friend.first_name }
        if @name.present?
            if @name
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
