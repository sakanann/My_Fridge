require 'rails_helper'

RSpec.describe '食品リスト登録機能' , type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user1) { FactoryBot.create(:user1) }
  let!(:user2) { FactoryBot.create(:user2) }

  let!(:food_category) { FoodCategory.create(name: '主食') }
  let!(:food) { Food.create(name: '米', food_category: food_category) }
  let!(:food_stock) { FoodStock.create(use_up_on: '02-27-002023', price: food_category) }
#!があると先に用意するものです(宮澤さん有難うございます)よって、error解消

def log_in
  visit new_user_session_path
  fill_in 'user[email]', with: 'user1@dive.com'
  fill_in 'user[password]', with: '222222'
  click_button "ログイン"
end


  describe '食品登録機能' do
    context '一覧画面に遷移した場合' do
      it 'カテゴリで絞り込み後、食品選択ができる' do
        log_in
        click_link '冷蔵庫 食品一覧'
        select '主食', from: 'food_category_id'
        # find(:css, '#food_category_id').select("主食")
        click_on '絞り込む'
        select '米', from: 'food_stock[food_id]'
        expect(page).to have_content '冷蔵庫 食品一覧'
      end
    end

    context '一覧画面に遷移した場合' do
      it '賞味期限が選択ができる' do
        log_in
        click_link '冷蔵庫 食品一覧'
        fill_in 'food_stock[use_up_on]', with: '02-27-002023'
        expect(page).to have_content '冷蔵庫 食品一覧'
      end
    end

    context '一覧画面に遷移した場合' do
      it '価格が選択ができる' do
        log_in
        click_link '冷蔵庫 食品一覧'
        fill_in 'food_stock[price]', with: '500'
        expect(page).to have_content '冷蔵庫 食品一覧'
      end
    end

    context '一覧画面に遷移した場合' do
      it '消費済みのチェック登録ができる' do
        log_in
        click_link '冷蔵庫 食品一覧'
        check 'food_stock[consumption]'
        expect(page).to have_content '冷蔵庫 食品一覧'
      end
    end

    context '一覧画面に遷移した場合' do
      it 'メモ登録ができる' do
        log_in
        click_link '冷蔵庫 食品一覧'
        fill_in 'food_stock[notes]', with: 'お米おいしい'
        expect(page).to have_content '冷蔵庫 食品一覧'
      end
    end
  end

  describe '食品登録機能' do
    context '一覧画面に遷移した場合' do
      it '食品と付随のカラム全て登録ができる' do
        log_in
        click_link '冷蔵庫 食品一覧'
        select '主食', from: 'food_category_id'
        # find(:css, '#food_category_id').select("主食")
        click_on '絞り込む'
        select '米', from: 'food_stock[food_id]'
        fill_in 'food_stock[use_up_on]', with: '02-27-002023'
        fill_in 'food_stock[price]', with: '500'
        check 'food_stock[consumption]'
        fill_in 'food_stock[notes]', with: 'お米おいしい'
        click_on '登録'
        expect(page).to have_content '登録しました'
      end
    end
  end


  describe '食品詳細機能' do
    context '詳細画面に遷移した場合' do
      it '食品と付随のカラム全て閲覧ができる' do
        log_in
        click_link '冷蔵庫 食品一覧'
        select '主食', from: 'food_category_id'
        # find(:css, '#food_category_id').select("主食")
        click_on '絞り込む'
        select '米', from: 'food_stock[food_id]'
        fill_in 'food_stock[use_up_on]', with: '02-27-002023'
        fill_in 'food_stock[price]', with: '500'
        check 'food_stock[consumption]'
        fill_in 'food_stock[notes]', with: 'お米おいしい'
        click_on '登録'
        click_on('食品詳細', match: :first)
        expect(page).to have_content '冷蔵庫画面に戻る'
      end
    end
  end
end