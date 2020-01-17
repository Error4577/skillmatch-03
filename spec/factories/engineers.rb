FactoryBot.define do
  factory :engineer do
    name              { "testengineer" }
    sex                   { 0 }
    birthday              { "2020-01-01" }
    email                 { "engineer@test.com" }
    phone_number          { "12312341234" }
    password              { "1234abcd" }
    password_confirmation { "1234abcd" }
    self_introduction     { "hogehoge" }
  end
end