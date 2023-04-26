require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index

      expect(response).to be_successful
    end
  end
end