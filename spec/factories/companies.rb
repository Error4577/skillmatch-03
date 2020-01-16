FactoryBot.define do
  factory :company do
    name                  {"testcompany"}
    email                 {"company@test.com"}
    phone_number          {"12312341234"}
    password              {"1234abcd"}
    password_confirmation {"1234abcd"}
    about                 {"hogehoge"}
  end
end