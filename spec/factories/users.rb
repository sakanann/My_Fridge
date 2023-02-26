FactoryBot.define do

  factory :user, class: User do
    id { 1 }
    name { "管理者" }
    email { "admin@dive.com" }
    password { "111111" }
    password_confirmation { "111111" }
    admin { "true" }
  end
end
