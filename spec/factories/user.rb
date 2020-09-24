FactoryBot.define do
  
  factory :user do
    nickname              {"abe"}
    email                 {"aaa@gmail.com"}
    password              {"123456"}
    password_confirmation {password}
    family_name           {"阿部"}
    last_name             {"太郎"}
    family_name_kana      {"アベ"}
    last_name_kana        {"タロウ"}
    birthday              {"1900-01-01"}
  end
end
