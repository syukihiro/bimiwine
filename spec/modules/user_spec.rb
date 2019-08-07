require 'rails_helper'
describe User do
  describe '#create' do
    it "ニックネームが空の場合のテスト" do
    user = User.new(nickname: "", phone_number: "09012345678", email: "kkk@co.jp", password: "111111", password_confirmation: "111111")
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "電話番号が空の場合のテスト" do
      user = User.new(nickname: "test", phone_number: "", email: "kkk@co.jp", password: "111111", password_confirmation: "111111")
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end
  end
  
end