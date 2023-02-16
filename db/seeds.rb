# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#FoodCategory

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
          {name: "牛乳", food_category_id: 5},
          {name: "米", food_category_id: 6},
          {name: "醤油", food_category_id: 7},
          {name: "たまご", food_category_id: 8}
]
foods.each do |foods|
  Food.find_or_create_by(foods)
end
