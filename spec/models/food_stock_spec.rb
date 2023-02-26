require 'rails_helper'

RSpec.describe FoodStock, type: :model do
  describe 'バリデーションのテスト' do
    context '食材リストの価格カラムが空の場合' do
      it 'バリデーションにひっかかる' do
        food_stock = FoodStock.new(price: '')
        expect(food_stock).not_to be_valid
      end
    end

    context '食材リストの価格カラムがきちんと設定されている場合' do
      it 'バリデーションに通る' do
        food = FactoryBot.create(:food)
        food_stock = FoodStock.new(price: 100, notes: 'memo', food_id: food.id)
        expect(food_stock).to be_valid
      end
    end
  end
end

#   describe '検索機能' do
#     # 必要に応じて、テストデータの内容を変更して構わない
#     let!(:foods_stock) { FactoryBot.create(:foods_stock, title: '坂本') }
#     let!(:second_foods_stock) { FactoryBot.create(:second_foods_stock, title: "sample") }
#     context 'scopeメソッドでタイトルのあいまい検索をした場合' do
#       it "検索キーワードを含むタスクが絞り込まれる" do
#         # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
#         expect(foods_stock.scope_title('坂本')).to include(foods_stock)
#         expect(foods_stock.scope_title('坂本')).not_to include(second_foods_stock)
#         expect(foods_stock.scope_title('坂本').count).to eq 1
#       end
#     end
#     context 'scopeメソッドでステータス検索をした場合' do
#       it "ステータスに完全一致するタスクが絞り込まれる" do
#         expect(foods_stock.where(status: '着手中')).to include(foods_stock)
#         expect(foods_stock.where(status: '着手中')).not_to include(second_foods_stock)
#         expect(foods_stock.where(status: '着手中').count).to eq 1
#       end
#     end
#     context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
#       it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
#         expect(foods_stock.scope_title('坂').where(status: "着手中")).to include(foods_stock)
#         expect(foods_stock.scope_title('坂').where(status: "着手中")).not_to include(second_foods_stock)
#         expect(foods_stock.scope_title('坂').where(status: "着手中").count).to eq 1
#       end
#     end
#   end
# end