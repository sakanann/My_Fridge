require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'takahashi', email: 'takahashi@gmail.com', password: 'takahashi') }
  let(:food_category) { FoodCategory.create(name: 'テストカテゴリー') }
  let(:food) { Food.new(name: 'テスト食品', food_category: food_category) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(food).to be_valid
    end

    it 'is not valid without a name' do
      food.name = nil
      expect(food).not_to be_valid
    end
  end

  # describe 'associations' do
  #   it { should belong_to(:food_category) }
  #   it { should have_many(:food_stocks).dependent(:destroy) }
  #   it { should have_many(:users).through(:food_stocks) }
  # end
end
