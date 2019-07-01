# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  activated         :boolean          default(FALSE)
#  activated_at      :datetime
#  activation_digest :string(255)
#  admin             :boolean          default(FALSE)
#  email             :string(255)
#  name              :string(255)
#  password_digest   :string(255)
#  remember_digest   :string(255)
#  reset_digest      :string(255)
#  reset_sent_at     :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe User do
    it "有効なファクトリを持つこと" do
        expect(user).to be_valid
    end
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name).is_at_most(50) }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_length_of(:email).is_at_most(255) }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  it "重複したメールアドレスは無効であること" do
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "Aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  describe "メールアドレスの有効性" do
    it '有効な場合' do
      valid_addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end

    it '無効な場合' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid
      end
    end
  end

  describe "パスワード確認が一致すること" do
    it "一致する場合" do
      user = FactoryBot.build(:user, password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end

    it "一致しない場合" do
      user = FactoryBot.build(:user, password: "password", password_confirmation: "passwor")
      expect(user).to_not be_valid
    end
  end

  describe "authenticated? should return false for a user with nil digest" do
    it "ダイジェストが存在しない場合のauthenticated?のテスト" do
      expect(user.authenticated?(:remember, '')).to eq false
    end
  end
end
