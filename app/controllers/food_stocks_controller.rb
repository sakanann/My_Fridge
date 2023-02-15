class FoodStocksController < ApplicationController
  before_action :set_food_stock, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /food_stocks or /food_stocks.json
  def index
    # @food_stocks = FoodStock.all
    @food_stocks = current_user.food_stocks
  end

  # GET /food_stocks/1 or /food_stocks/1.json
  def show
  end

  # GET /food_stocks/new
  def new
    @food_stock = FoodStock.new
    Food.where(food_category_id: 2)
  end

  # GET /food_stocks/1/edit
  def edit
  end

  # POST /food_stocks or /food_stocks.json
  def create
    @food_stock = FoodStock.new(food_stock_params)
    @food_stock = current_user.food_stocks.build(food_stock_params)

    if @food_stock.save
    # binding.pry
      flash[:notice] = "食材を登録しました！"
      redirect_to food_stocks_path
    else
      render :new
    end
  end

  # PATCH/PUT /food_stocks/1 or /food_stocks/1.json
  def update
    # @food_stock = food_stock.find(params[:id])
    if @food_stock.update(food_stock_params)
      flash[:notice] = "食材情報を修正しました！"
      redirect_to food_stocks_path
    else
      render :edit
    end
  end

  # DELETE /food_stocks/1 or /food_stocks/1.json
  def destroy
    @food_stock.destroy
    flash[:notice] = "食材を削除しました"
    redirect_to food_stocks_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_stock
      @food_stock = FoodStock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_stock_params
      params.require(:food_stock).permit(:use_up_on, :price, :consumption, :notes)
    end
end
