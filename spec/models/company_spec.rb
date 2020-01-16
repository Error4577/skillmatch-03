require 'rails_helper'

# RSpec.describe Company, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Company do
  describe '#create' do
    # nameが空白だと登録できないことを確認
    it "is invalid without a name" do
      company = build(:company, name: "")
      company.valid?
      expect(company.errors[:name]).to include("can't be blank")
    end

    # nameが50文字以上であれば登録できないこと
    it "is invalid without a name" do
      company = build(:company, name: Faker::Internet.username(specifier: 50..51))
      company.valid?
      expect(company.errors[:name]).to include("is too long (maximum is 50 characters)")
    end

    # nameが50文字以下であれば登録できること
    it "is invalid without a name" do
      company = build(:company, name: Faker::Internet.username(specifier: 49..50))
      company.valid?
      expect(company).to be_valid
    end

    # emailが空白だと登録できないことを確認
    it "is invalid without a email" do
      company = build(:company, email: "")
      company.valid?
      expect(company.errors[:email]).to include("can't be blank")
    end

    # emailが他のユーザと重複している場合登録できないことを確認
    it "is invalid with a duplicate email address" do
      company = create(:company)
      another_company = build(:company, email: company.email)
      another_company.valid?
      expect(another_company.errors[:email]).to include("has already been taken")
    end

    # emailがフォーマットに適していない場合登録できないことを確認
    it "it is invalid with a unsuitable format" do
      company = build(:company, email: Faker::Alphanumeric.alphanumeric(number: 20))
      company.valid?
      expect(company.errors[:email]).to include("is invalid")
    end

    # phone_numberが空白だと登録できないことを確認
    it "is invalid without a phone_number" do
      company = build(:company, phone_number: "")
      company.valid?
      expect(company.errors[:phone_number]).to include("can't be blank")
    end

    # phone_numberが10文字未満だと保存できないことを確認
    it "phone_numberが10文字未満だと保存できないことを確認" do
      company = build(:company, phone_number: Faker::Number.number(digits: 9))
      company.valid?
      expect(company.errors[:phone_number]).to include("is too short (minimum is 10 characters)")
    end

    # phone_numberが10文字以上だと保存できることを確認
    it "phone_numberが10文字以上だと保存できることを確認" do
      company = build(:company, phone_number: Faker::Number.number(digits: 10))
      company.valid?
      expect(company).to be_valid
    end

    # phone_numberが11文字以下だと保存できることを確認
    it "phone_numberが11文字以下だと保存できることを確認" do
      company = build(:company, phone_number: Faker::Number.number(digits: 11))
      company.valid?
      expect(company).to be_valid
    end

    # phone_numberが12文字以上だと保存できないことを確認
    it "phone_numberが12文字以上だと保存できないことを確認" do
      company = build(:company, phone_number: Faker::Number.number(digits: 12))
      company.valid?
      expect(company.errors[:phone_number]).to include("is too long (maximum is 11 characters)")
    end

    # phone_numberがフォーマットに適さない場合保存できないことを確認
    it "phone_numberがフォーマットに適さない場合保存できないことを確認" do
      company = build(:company, phone_number: Faker::Alphanumeric.alphanumeric(number: 10))
      company.valid?
      expect(company.errors[:phone_number]).to include("is invalid")
    end

    # passwordが空白だと登録できないことを確認
    it "is invalid without a password" do
      company = build(:company, password: "")
      company.valid?
      expect(company.errors[:password]).to include("can't be blank")
    end

    # passwordが7文字未満だと保存できないことを確認
    it "passwordが7文字未満だと保存できないことを確認" do
      company = build(:company, password: "kc0bjo", password_confirmation: "kc0bjo")
      company.valid?
      expect(company.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    # passwordが7文字以上だと保存できることを確認
    it "passwordが7文字以上だと保存できることを確認" do
      company = build(:company, password: "kc0bjos", password_confirmation: "kc0bjos")
      company.valid?
      expect(company).to be_valid
    end

    # passwordが128文字以下だと保存できることを確認
    it "passwordが128文字以下だと保存できることを確認" do
      company = build(:company, password: "djsdhk76shsravr4d25qu1wpvwrvd70lmmirr5ghk1o4w8paksqbzmtkfz7is1t17j4jsb9fey7mgtqktabg3nfrcrwr3twe98qva037vmfiexjeq1n4xcv9e0dx2iig", password_confirmation: "djsdhk76shsravr4d25qu1wpvwrvd70lmmirr5ghk1o4w8paksqbzmtkfz7is1t17j4jsb9fey7mgtqktabg3nfrcrwr3twe98qva037vmfiexjeq1n4xcv9e0dx2iig")
      company.valid?
      expect(company).to be_valid
    end

    # passwordが129文字以上だと保存できないことを確認
    it "passwordが129文字以上だと保存できないことを確認" do
      company = build(:company, password: "xyqxwq0yauzkn45gg2o00x298x848unzn1uqid9c90a847qnxulow2oq17qlncddfiea3uf9oxfx0zeyctu2r906vhpz0kc9swcbnvx4nkrvvlxet5ks7mc7d1e8t4wvy", password_confirmation: "xyqxwq0yauzkn45gg2o00x298x848unzn1uqid9c90a847qnxulow2oq17qlncddfiea3uf9oxfx0zeyctu2r906vhpz0kc9swcbnvx4nkrvvlxet5ks7mc7d1e8t4wvy")
      company.valid?
      expect(company.errors[:password]).to include("is too long (maximum is 128 characters)")
    end

    # passwordがフォーマットに適さない場合保存できないことを確認
    it "passwordがフォーマットに適さない場合保存できないことを確認" do
      company = build(:company, password: Faker::Alphanumeric.alpha(number: 10))
      company.valid?
      expect(company.errors[:password]).to include("is invalid")
    end

    # passwordが存在していてもpassword_confirmationが空白だと登録できないことを確認
    it "is invalid without a password_confirmation although with a password" do
      company = build(:company, password_confirmation: "")
      company.valid?
      expect(company.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
end
