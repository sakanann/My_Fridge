require 'rails_helper'

RSpec.describe 'ユーザー管理機能' , type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user1) { FactoryBot.create(:user1) }
  let!(:user2) { FactoryBot.create(:user2) }


  def log_in
    visit new_user_session_path
    fill_in 'user[email]', with: 'user1@dive.com'
    fill_in 'user[password]', with: '222222'
    click_button "ログイン"
  end


  describe '一般ユーザ登録のテスト' do
    context '新規登録画面に遷移した場合' do
      it 'ユーザーの新規登録ができる' do
        visit new_user_registration_path
        fill_in 'user[name]', with: '坂本'
        fill_in 'user[email]', with: 'sakamoto@dive.com'
        fill_in 'user[password]', with: 'sakamoto'
        fill_in 'user[password_confirmation]', with: 'sakamoto'
        click_on "アカウント登録"
        expect(page).to have_content '坂本さんでログインしています'
      end
    end
  end

  describe '一般ユーザログインのテスト' do
    context '正しいパスワードが入力された場合' do
      it 'ログインできること' do
        visit new_user_session_path
        log_in
        expect(page).to have_content 'ログインしています'
      end
    end


    context '間違ったパスワードが入力された場合' do
      it 'ログインできないこと' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@dive.com'
        fill_in 'user[password]', with: '22'
        click_button "ログイン"
        expect(page).not_to have_content 'ログインしています'
      end
    end
  end

  describe '管理者ユーザログインのテスト' do
    context '管理者権限を持ったユーザーログインした場合' do
      it '管理者画面のリンクが出て管理者画面に行く' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'admin@dive.com'
        fill_in 'user[password]', with: '111111'
        click_button 'ログイン'
        click_link '管理者ページへ'
        sleep(5)
        expect(page).to have_content 'サイト管理'
      end
    end
  end
end

