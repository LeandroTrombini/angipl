require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe "GET index" do
    before { get :index }
    it "renders the index template" do
      expect(response).to be_successful
    end
  end
end