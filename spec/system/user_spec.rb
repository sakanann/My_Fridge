require 'rails_helper'

RSpec.describe 'ユーザー管理機能' , type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:user1) { FactoryBot.create(:user1) }
  let(:user2) { FactoryBot.create(:user2) }

  describe 'ユーザ登録のテスト' do
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

  describe 'ユーザログインのテスト' do
    context '正しいパスワードが入力された場合' do
      it 'ログインできること' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'tokyo@example.com'
        fill_in 'user[password]', with: 'password'
        click_on 'アカウント登録'
        #binding.pry
        expect(page).not_to have_content 'ログインしています'
      end
    end
  end
end

#     context '誤ったパスワードが入力された場合' do
#       it 'ログインできないこと' do
#         visit new_user_session_path
#         fill_in 'user[email]', with: 'example@example.com'
#         fill_in 'user[password]', with: 'pass'
#         click_on 'commit'
#         expect(page).not_to have_content 'nagasaki'
#         expect(page).to have_content '違います'
#       end
#     end
#   end
# end
