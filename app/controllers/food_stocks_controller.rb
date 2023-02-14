class FoodStocksController < ApplicationController
  before_action :set_food_stock, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /food_stocks or /food_stocks.json
  def index
    @food_stocks = FoodStock.all
  end

  # GET /food_stocks/1 or /food_stocks/1.json
  def show
  end

  # GET /food_stocks/new
  def new
    @food_stock = FoodStock.new
  end

  # GET /food_stocks/1/edit
  def edit
  end

  # POST /food_stocks or /food_stocks.json
  def create
    @food_stock = FoodStock.new(food_stock_params)
    @food_stock = current_user.food_stocks.build(food_stock_params)

    respond_to do |format|
      if @food_stock.save
        format.html { redirect_to food_stock_url(@food_stock), notice: "Food stock was successfully created." }
        format.json { render :show, status: :created, location: @food_stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_stocks/1 or /food_stocks/1.json
  def update
    respond_to do |format|
      if @food_stock.update(food_stock_params)
        format.html { redirect_to food_stock_url(@food_stock), notice: "Food stock was successfully updated." }
        format.json { render :show, status: :ok, location: @food_stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_stocks/1 or /food_stocks/1.json
  def destroy
    @food_stock.destroy

    respond_to do |format|
      format.html { redirect_to food_stocks_url, notice: "Food stock was successfully destroyed." }
      format.json { head :no_content }
    end
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
