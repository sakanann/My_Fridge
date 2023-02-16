class FoodStocksController < ApplicationController
  before_action :set_food_stock, only: %i[ show edit update destroy ]
  before_action :authenticate_user!


  def index
    # @food_stocks = FoodStock.all
    @food_stock = FoodStock.new
    @food_stocks = current_user.food_stocks
    @food_select_lists = Food.where(food_category_id: params[:food_category_id])
  end

  def show
  end

  def new
    @food_stock = FoodStock.new
  end

  def edit
  end


  def create
    # binding.pry
    @food_stock = current_user.food_stocks.build(food_stock_params)

    if @food_stock.save
      flash[:notice] = "食材を登録しました！"
      redirect_to food_stocks_path
    else
      redirect_to food_stocks_path
    end
  end


  def update
    # @food_stock = food_stock.find(params[:id])
    if @food_stock.update(food_stock_params)
      flash[:notice] = "食材情報を修正しました！"
      redirect_to food_stocks_path
    else
      render :edit
    end
  end


  def destroy
    @food_stock.destroy
    flash[:notice] = "食材を削除しました"
    redirect_to food_stocks_path
  end

  private
    def set_food_stock
      @food_stock = FoodStock.find(params[:id])
    end


    def food_stock_params
      params.require(:food_stock).permit(:use_up_on, :price, :consumption, :notes, :food_id)
    end
end
