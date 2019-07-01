require 'rails_helper'

RSpec.feature "Pages", type: :feature do
  describe "Landing page" do
    before do
      visit root_path
    end

    it "ランディングページに’無料会員登録’と表示されていること" do
      expect(page).to have_content '無料会員登録'
    end

    it "タイトルが正しく表示されていること" do
      expect(page).to have_title "landing"
    end
  end
end

RSpec.feature "UserPages", type: :feature do
  describe "signup page" do
    before do
      visit signup_path
    end

    it "新規登録ページに新規登録’と表示されていること" do
      expect(page).to have_content '新規登録'
    end

    it "タイトルが正しく表示されていること" do
      expect(page).to have_title '新規登録'
    end
  end
end
