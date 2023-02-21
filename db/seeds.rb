# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#foodcategories table　8件
food_categories = [
                  {id: 1, name: "肉類"},
                  {id: 2, name: "野菜類"},
                  {id: 3, name: "魚介類"},
                  {id: 4, name: "果物類"},
                  {id: 5, name: "乳製品"},
                  {id: 6, name: "主食"},
                  {id: 7, name: "調味料"},
                  {id: 8, name: "その他"}
]

food_categories.each do |food_category|
  FoodCategory.find_or_create_by(food_category)
end

#foods table
foods = [
        {name: "牛肉", food_category_id: 1},
        {name: "豚肉", food_category_id: 1},
        {name: "鶏肉", food_category_id: 1},
        {name: "じゃがいも", food_category_id: 2},
        {name: "人参", food_category_id: 2},
        {name: "玉ねぎ", food_category_id: 2},
        {name: "ピーマン", food_category_id: 2},
        {name: "里芋", food_category_id: 2},
        {name: "長ネギ", food_category_id: 2},
        {name: "サバ", food_category_id: 3},
        {name: "アジ", food_category_id: 3},
        {name: "ブリ", food_category_id: 3},
        {name: "サンマ", food_category_id: 3},
        {name: "カツオ", food_category_id: 3},
        {name: "イワシ", food_category_id: 3},
        {name: "りんご", food_category_id: 4},
        {name: "ぶどう", food_category_id: 4},
        {name: "みかん", food_category_id: 4},
        {name: "牛乳", food_category_id: 5},
        {name: "チーズ", food_category_id: 5},
        {name: "バター", food_category_id: 5},
        {name: "ヨーグルト", food_category_id: 5},
        {name: "米", food_category_id: 6},
        {name: "パン", food_category_id: 6},
        {name: "うどん", food_category_id: 6},
        {name: "蕎麦", food_category_id: 6},
        {name: "ナン", food_category_id: 6},
        {name: "醤油", food_category_id: 7},
        {name: "たまご", food_category_id: 8}
]
foods.each do |foods|
  Food.find_or_create_by(foods)
end

#food_stocks table
# food_stocks = [
#               {id: 1, food_id: 1, use_up_on: Date.today + rand(30), price: 1000, consumption: false, user_id: 1},
#               {id: 2, food_id: 2, use_up_on: Date.today + rand(30), price: 300, consumption: false, user_id: 1},
#               {id: 3, food_id: 3, use_up_on: Date.today + rand(30), price: 300, consumption: false, user_id: 2},
#               {id: 4, food_id: 4, use_up_on: Date.today + rand(30), price: 70, consumption: false, user_id: 3},
#               {id: 5, food_id: 5, use_up_on: Date.today + rand(30), price: 70, consumption: false, user_id: 3}
# ]
# food_stocks.each do |food_stocks|
#   FoodStock.find_or_create_by(food_stocks)
# end
users = User.all
foods = Food.all

foods.each do |food|
  users.each do |user|
    rand(5).times do
      FoodStock.create!(use_up_on: Date.today + rand(30),
                        price: rand(100..1000),
                        notes: "テスト用のフードストックデータ",
                        user_id: user.id,
                        food_id: food.id)
    end
  end
end







#users table
# users = [
#         {id: 1, name: "坂本 薫哉", email: "sakamoto@gmail.com", password:"sakamoto"},
#         {id: 2, name: "髙橋兄やん", email: "takahashi@gmail.com", password:"takahashi"},
#         {id: 3, name: "おじょう", email: "adachi@gmail.com", password:"adachi"},
#         {id: 4, name: "ハコ様", email: "hako@gmail.com", password:"hako"},
#         {id: 5, name: "むつみたん", email: "sadara@gmail.com", password:"sadara"},
#         {id: 6, name: "古谷リーダー", email: "huruya@gmail.com", password:"huruya"},
#         {id: 7, name: "アイザック・ニュートン", email: "newton@gmail.com", password:"newton"}
# ]
# users.each do |users|
#   User.find_or_create_by(users)
# end
User.create!(name: "坂本 薫哉", email: "sakamoto@gmail.com", password:"sakamoto", admin: true)
User.create!(name: "髙橋兄やん", email: "takahashi@gmail.com", password:"takahashi")
User.create!(name: "おじょう", email: "adachi@gmail.com", password:"adachi")
User.create!(name: "ハコ様", email: "hako@gmail.com", password:"hakohako")
User.create!(name: "むつみたん", email: "sadara@gmail.com", password:"sadara")