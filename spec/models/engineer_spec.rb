require 'rails_helper'

# RSpec.describe Engineer, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Engineer do
  describe '#create' do
    # name, sex, birthday, email, phone_number, password, password_confirmation, self_introductionが存在すれば登録できる
    it "name, first_name, last_name, first_name_kana, last_name_kana, sex, birthday, email, phone_number, password, password_confirmation, self_introductionが存在すれば登録できる" do
      engineer = build(:engineer)
      expect(engineer).to be_valid
    end

    # nameが空白だと登録できないことを確認
    it "is invalid without a name" do
      engineer = build(:engineer, name: "")
      engineer.valid?
      expect(engineer.errors[:name]).to include("can't be blank")
    end

    # nameが20文字以上であれば登録できないこと
    it "nameが20文字以上であれば登録できないこと" do
      engineer = build(:engineer, name: Faker::Internet.username(specifier: 20..21))
      engineer.valid?
      expect(engineer.errors[:name]).to include("is too long (maximum is 20 characters)")
    end

    # nameが20文字以下であれば登録できること
    it "nameが20文字以下であれば登録できること" do
      engineer = build(:engineer, name: Faker::Internet.username(specifier: 19..20))
      engineer.valid?
      expect(engineer).to be_valid
    end
    
    # emailが空白だと登録できないことを確認
    it "is invalid without a email" do
      engineer = build(:engineer, email: "")
      engineer.valid?
      expect(engineer.errors[:email]).to include("can't be blank")
    end

    # emailが他のユーザと重複している場合登録できないことを確認
    it "is invalid with a duplicate email address" do
      engineer = create(:engineer)
      another_engineer = build(:engineer, email: engineer.email)
      another_engineer.valid?
      expect(another_engineer.errors[:email]).to include("has already been taken")
    end

    # emailがフォーマットに適していない場合登録できないことを確認
    it "is invalid with a unsuitable format" do
      engineer = build(:engineer, email: Faker::Alphanumeric.alphanumeric(number: 20))
      engineer.valid?
      expect(engineer.errors[:email]).to include("is invalid")
    end

    # phone_numberが空白でも登録できることを確認
    it "phone_numberが空白でも登録できることを確認" do
      engineer = build(:engineer, phone_number: nil)
      engineer.valid?
      expect(engineer).to be_valid
    end

    # phone_numberが10文字未満だと保存できないことを確認
    it "phone_numberが10文字未満だと保存できないことを確認" do
      engineer = build(:engineer, phone_number: Faker::Number.number(digits: 9))
      engineer.valid?
      expect(engineer.errors[:phone_number]).to include("is too short (minimum is 10 characters)")
    end

    # phone_numberが10文字以上だと保存できることを確認
    it "phone_numberが10文字以上だと保存できることを確認" do
      engineer = build(:engineer, phone_number: Faker::Number.number(digits: 10))
      engineer.valid?
      expect(engineer).to be_valid
    end

    # phone_numberが11文字以下だと保存できることを確認
    it "phone_numberが11文字以下だと保存できることを確認" do
      engineer = build(:engineer, phone_number: Faker::Number.number(digits: 11))
      engineer.valid?
      expect(engineer).to be_valid
    end

    # phone_numberが12文字以上だと保存できないことを確認
    it "phone_numberが12文字以上だと保存できないことを確認" do
      engineer = build(:engineer, phone_number: Faker::Number.number(digits: 12))
      engineer.valid?
      expect(engineer.errors[:phone_number]).to include("is too long (maximum is 11 characters)")
    end

    # phone_numberがフォーマットに適さない場合保存できないことを確認
    it "phone_numberがフォーマットに適さない場合保存できないことを確認" do
      engineer = build(:engineer, phone_number: Faker::Alphanumeric.alphanumeric(number: 10))
      engineer.valid?
      expect(engineer.errors[:phone_number]).to include("is invalid")
    end
    
    # passwordが空白だと登録できないことを確認
    it "is invalid without a password" do
      engineer = build(:engineer, password: "")
      engineer.valid?
      expect(engineer.errors[:password]).to include("can't be blank")
    end

    # passwordが7文字未満だと保存できないことを確認
    it "passwordが7文字未満だと保存できないことを確認" do
      engineer = build(:engineer, password: "kc0bjo", password_confirmation: "kc0bjo")
      engineer.valid?
      expect(engineer.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    # passwordが7文字以上だと保存できることを確認
    it "passwordが7文字以上だと保存できることを確認" do
      engineer = build(:engineer, password: "kc0bjos", password_confirmation: "kc0bjos")
      engineer.valid?
      expect(engineer).to be_valid
    end

    # passwordが128文字以下だと保存できることを確認
    it "passwordが128文字以下だと保存できることを確認" do
      engineer = build(:engineer, password: "djsdhk76shsravr4d25qu1wpvwrvd70lmmirr5ghk1o4w8paksqbzmtkfz7is1t17j4jsb9fey7mgtqktabg3nfrcrwr3twe98qva037vmfiexjeq1n4xcv9e0dx2iig", password_confirmation: "djsdhk76shsravr4d25qu1wpvwrvd70lmmirr5ghk1o4w8paksqbzmtkfz7is1t17j4jsb9fey7mgtqktabg3nfrcrwr3twe98qva037vmfiexjeq1n4xcv9e0dx2iig")
      engineer.valid?
      expect(engineer).to be_valid
    end

    # passwordが129文字以上だと保存できないことを確認
    it "passwordが129文字以上だと保存できないことを確認" do
      engineer = build(:engineer, password: "xyqxwq0yauzkn45gg2o00x298x848unzn1uqid9c90a847qnxulow2oq17qlncddfiea3uf9oxfx0zeyctu2r906vhpz0kc9swcbnvx4nkrvvlxet5ks7mc7d1e8t4wvy", password_confirmation: "xyqxwq0yauzkn45gg2o00x298x848unzn1uqid9c90a847qnxulow2oq17qlncddfiea3uf9oxfx0zeyctu2r906vhpz0kc9swcbnvx4nkrvvlxet5ks7mc7d1e8t4wvy")
      engineer.valid?
      expect(engineer.errors[:password]).to include("is too long (maximum is 128 characters)")
    end

    # passwordがフォーマットに適さない場合保存できないことを確認
    it "passwordがフォーマットに適さない場合保存できないことを確認" do
      engineer = build(:engineer, password: Faker::Alphanumeric.alpha(number: 10))
      engineer.valid?
      expect(engineer.errors[:password]).to include("is invalid")
    end

    # passwordが存在していてもpassword_confirmationが空白だと登録できないことを確認
    it "is invalid without a password_confirmation although with a password" do
      engineer = build(:engineer, password_confirmation: "")
      engineer.valid?
      expect(engineer.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
end