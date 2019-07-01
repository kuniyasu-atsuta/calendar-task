require 'rails_helper'

RSpec.describe "remember_me", type: :request do
  let(:user) { FactoryBot.create(:user) }

  context "with valid information" do
    it "ログイン中のみログアウトすること" do
      sign_in_as(user)
      expect(response).to redirect_to user_path(user)

      #ログアウト
      delete logout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil
      expect(@current_user).to eq nil

      # 2番目のウィンドウでログアウトする
      delete logout_path
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq nil
      expect(@current_user).to eq nil
    end
  end
end
