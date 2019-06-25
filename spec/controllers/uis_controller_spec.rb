require 'rails_helper'

RSpec.describe UisController, type: :controller do

  describe "GET #material_icons" do
    it "returns http success" do
      get :material_icons
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #modals" do
    it "returns http success" do
      get :modals
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #notification" do
    it "returns http success" do
      get :notification
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #range_slider" do
    it "returns http success" do
      get :range_slider
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #sweetalert" do
    it "returns http success" do
      get :sweetalert
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #themify_icons" do
    it "returns http success" do
      get :themify_icons
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #widgets" do
    it "returns http success" do
      get :widgets
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #treeview" do
    it "returns http success" do
      get :treeview
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #font_awesome_icons" do
    it "returns http success" do
      get :font_awesome_icons
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #dripicons" do
    it "returns http success" do
      get :dripicons
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #draggable_cards" do
    it "returns http success" do
      get :draggable_cards
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #components" do
    it "returns http success" do
      get :components
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #checkbox_radio" do
    it "returns http success" do
      get :checkbox_radio
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #cards" do
    it "returns http success" do
      get :cards
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #buttons" do
    it "returns http success" do
      get :buttons
      expect(response).to have_http_status(:success)
    end
  end

end
