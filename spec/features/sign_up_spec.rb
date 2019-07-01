require 'rails_helper'
RSpec.feature "SignUps", type: :feature do

  scenario "ユーザーはサインアップに成功する" do
    visit root_path
    click_link "無料会員登録", match: :first

    perform_enqueued_jobs do
      expect {
        fill_in "メールアドレス",     with: "test@example.com"
        fill_in "名前",               with: "Example"
        fill_in "パスワード",         with: "test123"
        fill_in "パスワード確認",     with: "test123"
        click_button "アカウントの作成"
      }.to change(User, :count).by(1)

      expect(page).to have_content "認証用メールを送りました"
      expect(current_path).to eq root_path
    end
    mail = ActionMailer::Base.deliveries.last

    aggregate_failures do
      expect(mail.to).to eq ["test@example.com"]
      expect(mail.from).to eq ["noreply@example.com"]
      expect(mail.subject).to eq "アカウントの認証"
    end
  end
end
