require 'rails_helper'


RSpec.describe FoodStock, type: :model do
  describe "バリデーションのテスト" do
    let!(:food_category) { FactoryBot.create(:food_category) }

    context "use_up_onカラムが空の場合" do
      it "バリデーションにひっかかる" do
        food_stock = FactoryBot.build(:food_stock, use_up_on: nil, food_category: food_category)
        expect(food_stock).to_not be_valid
      end
    end

    context "priceカラムが空の場合" do
      it "バリデーションにひっかかる" do
        food_stock = FactoryBot.build(:food_stock, price: nil, food_category: food_category)
        expect(food_stock).to_not be_valid
      end
    end

    context "priceカラムが0以下の場合" do
      it "バリデーションにひっかかる" do
        food_stock = FactoryBot.build(:food_stock, price: 0, food_category: food_category)
        expect(food_stock).to_not be_valid
      end
    end
  end
end