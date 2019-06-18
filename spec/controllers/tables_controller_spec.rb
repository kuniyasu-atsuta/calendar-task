require 'rails_helper'

RSpec.describe TablesController, type: :controller do

  describe "GET #basic" do
    it "returns http success" do
      get :basic
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #datatable" do
    it "returns http success" do
      get :datatable
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #editable" do
    it "returns http success" do
      get :editable
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #responsive" do
    it "returns http success" do
      get :responsive
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #tablesaw" do
    it "returns http success" do
      get :tablesaw
      expect(response).to have_http_status(:success)
    end
  end

end
