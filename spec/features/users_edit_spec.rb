require 'rails_helper'

RSpec.feature "Edit", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  # ユーザーは編集に成功する
#   scenario "successful edit" do
#     valid_login(user)    # spec/support/login_support.rbに定義済み
#     visit user_path(user)
#     click_link "アカウント設定"
#
#     fill_in "ユーザー名 *", with: user.name
#     fill_in "メールアドレス *", with: "edit@example.com"
#     fill_in "パスワード *", with: "test123"
#     fill_in "パスワード確認 *", with: "test123"
#     click_button "更新"
#
#     expect(current_path).to eq user_path(user)
#     expect(page).to have_content "アカウントを設定を更新しました！"
#     expect(user.reload.email).to eq "edit@example.com"
#
#   end
#
#   # ユーザーは編集に失敗する
#   scenario "unsuccessful edit" do
#     valid_login(user)    # spec/support/login_support.rbに定義済み
#     visit user_path(user)
#     click_link "アカウント設定"
#
#     fill_in "ユーザー名 *", with: user.name
#     fill_in "メールアドレス *", with: "edit@example.com"
#     fill_in "パスワード *", with: "test123"
#     fill_in "パスワード確認 *", with: "bar"
#     click_button "更新"
#
#     expect(user.reload.email).to_not eq "edit@example.com"
#   end

  scenario "フレンドリーフォワーディング" do
    visit edit_user_path(user)
    valid_login(user)
    expect(page).to have_content "パスワード *"
  end
end
