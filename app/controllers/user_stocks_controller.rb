class UserStocksController < ApplicationController
    def create 
        stock = Stock.find_stock_db(params[:ticker])
        if stock.blank?
            stock = Stock.new_lookup(params[:ticker])
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:notice] = "Stock #{stock.name} has been added successfully"
        redirect_to my_portfolio_path
    end
end
